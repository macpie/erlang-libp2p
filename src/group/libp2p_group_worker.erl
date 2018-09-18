-module(libp2p_group_worker).

-behaviour(gen_statem).
-behavior(libp2p_info).

%% API
-export([start_link/5, assign_target/2, assign_stream/3, send/3, send_ack/1, close/1]).

%% gen_statem callbacks
-export([callback_mode/0, init/1, terminate/3]).
-export([request_target/3, connect/3, closing/3]).

%% libp2p_info
-export([info/1]).

-define(SERVER, ?MODULE).

-record(data,
        { tid :: ets:tab(),
          kind :: atom() | pos_integer(),
          group_id :: string(),
          server :: pid(),
          client_spec=undefined :: undefined | libp2p_group:stream_client_spec(),
          target=undefined :: undefined | string(),
          connect_pid=undefined :: undefined | pid(),
          connect_retry_timer=undefined :: undefined | reference(),
          session_monitor=undefined :: pid_monitor(),
          stream_pid=undefined :: pid() | undefined
        }).

-define(ASSIGN_RETRY, 1000).
-define(CONNECT_RETRY, 1000).

-type pid_monitor() :: undefined | {reference(), pid()}.

%% API

-spec assign_target(pid(), string() | undefined) -> ok.
assign_target(Pid, MAddr) ->
    gen_statem:cast(Pid, {assign_target, MAddr}).

-spec assign_stream(pid(), libp2p_connection:connection(), pid()) -> ok.
assign_stream(Pid, Connection, StreamPid) ->
    gen_statem:cast(Pid, {assign_stream, Connection, StreamPid}).

-spec send(pid(), term(), binary()) -> ok.
send(Pid, Ref, Data) ->
    gen_statem:cast(Pid, {send, Ref, Data}).

-spec close(pid()) -> ok.
close(Pid) ->
    Pid ! close,
    ok.

-spec send_ack(pid()) -> ok.
send_ack(Pid) ->
    Pid ! send_ack,
    ok.

%% libp2p_info
info(Pid) ->
    catch gen_statem:call(Pid, info).

%% gen_statem
%%

-spec start_link(atom(), libp2p_group:stream_client_spec(), pid(), string(), ets:tab()) ->
                        {ok, Pid :: pid()} |
                        ignore |
                        {error, Error :: term()}.
start_link(Kind, ClientSpec, Server, GroupID, TID) ->
    gen_statem:start_link(?MODULE, [Kind, ClientSpec, Server, GroupID, TID], []).


callback_mode() -> [state_functions, state_enter].

-spec init(Args :: term()) -> gen_statem:init_result(atom()).
init([Kind, ClientSpec, Server, GroupID, TID]) ->
    process_flag(trap_exit, true),
    {ok, request_target,
     update_metadata(#data{tid=TID, server=Server, kind=Kind, group_id=GroupID, client_spec=ClientSpec})}.

-spec request_target('enter', Msg :: term(), Data :: term()) ->
                            gen_statem:state_enter_result(request_target);
                    (gen_statem:event_type(), Msg :: term(), Data :: term()) ->
                            gen_statem:event_handler_result(atom()).
request_target(enter, _, #data{kind=Kind, server=Server}) ->
    libp2p_group_server:request_target(Server, Kind, self()),
    {keep_state_and_data, ?ASSIGN_RETRY};
request_target(timeout, _, #data{}) ->
    repeat_state_and_data;
request_target(cast, {assign_target, undefined}, #data{}) ->
    {keep_state_and_data, ?ASSIGN_RETRY};
request_target(cast, {assign_target, MAddr}, Data=#data{}) ->
    {next_state, connect, update_metadata(Data#data{target=MAddr})};
request_target(cast, {send, Ref, _Bin}, #data{server=Server}) ->
    libp2p_group_server:send_result(Server, Ref, {error, not_connected}),
    {keep_state_and_data, ?ASSIGN_RETRY};
request_target(EventType, Msg, Data) ->
    handle_event(EventType, Msg, Data).


-spec connect('enter', Msg :: term(), Data :: term()) ->
                     gen_statem:state_enter_result(connect);
             (gen_statem:event_type(), Msg :: term(), Data :: term()) ->
                     gen_statem:event_handler_result(atom()).
connect(enter, _, Data=#data{target=Target, tid=TID, connect_pid=undefined}) ->
    Parent = self(),
    {Pid, _} = spawn_monitor(
                 fun() ->
                         case libp2p_transport:connect_to(Target, [], 5000, TID) of
                             {error, Reason} ->
                                 Parent ! {error, Reason};
                             {ok, SessionPid} ->
                                 Parent ! {assign_session, SessionPid}
                         end
                 end),
    {next_state, connect, Data#data{connect_pid=Pid}};
connect(enter, _, Data=#data{connect_pid=ConnectPid})  ->
    {repeat_state, Data#data{connect_pid=kill_pid(ConnectPid)}};
connect(info, connect_retry, Data=#data{}) ->
    {repeat_state, Data#data{connect_retry_timer=undefined}};
connect(cast, {assign_target, undefined}, Data=#data{connect_pid=ConnectPid}) ->
    {next_state, request_target, Data#data{connect_pid=kill_pid(ConnectPid),
                                           session_monitor=monitor_session(undefined, Data),
                                           stream_pid=assign_stream(undefined, Data)}};
connect(info, {error, _Reason}, Data=#data{}) ->
    {keep_state, connect_retry(Data)};
connect(info, {'EXIT', StreamPid, _Reason}, Data=#data{stream_pid=StreamPid}) ->
    %% The _stream_ that this worker is linked to went away.
    %% Try creating the stream again
    {keep_state, connect_retry(Data#data{session_monitor=monitor_session(undefined, Data),
                                         stream_pid=assign_stream(undefined, Data)})};
connect(info, {'DOWN', SessionMonitor, process, _Pid, _Reason},
        Data=#data{session_monitor={SessionMonitor, _}}) ->
    %% The _session_ that this worker is monitoring went away. Set a
    %% timer to try again.
    {keep_state, connect_retry(Data#data{session_monitor=undefined,
                                         stream_pid=assign_stream(undefined, Data)})};
connect(info, {'DOWN', _, process, _, normal}, Data=#data{}) ->
    %% Ignore a normal down for the connect pid, since it completed
    %% it's work successfully
    {keep_state, Data#data{connect_pid=undefined}};
connect(info, {'DOWN', _, process, _, _}, Data=#data{}) ->
    %% The connect process wend down for a non-normal reason. Set a
    %% timeout to try again.
    {keep_state, connect_retry(Data#data{connect_pid=undefined})};
connect(info, {assign_session, SessionPid},
        Data=#data{session_monitor=SessionMonitor, stream_pid=_StreamPid}) when SessionMonitor /= undefined ->
    %% Attempting to assign a session when we already have one. We
    %% toss a coin to decide if we keep ours (1) or use the new given one.
    %%
    %% TODO: Once a proper group_gossip lands ,We can likely stop
    %% trackign the session altogether since the stream will be the
    %% only thing we care about
    case rand:uniform(2) of
        1 ->
            %% lager:debug("Trying to assign a session ~p while one is being monitored with stream ~p",
            %%             [SessionMonitor, _StreamPid]),
            keep_state_and_data;
        _ ->
            connect(info, {assign_session, SessionPid},
                    Data#data{session_monitor=monitor_session(undefined, Data),
                              stream_pid=assign_stream(undefined, Data)})
    end;
connect(info, {assign_session, SessionPid},
        Data=#data{session_monitor=undefined, client_spec=undefined}) ->
    %% Assign a session without a client spec. Just monitor the
    %% session. Success, no timeout needed.
    %%
    %% TODO: REMOVE this once the new group_gossip works
    {keep_state, Data#data{session_monitor=monitor_session(SessionPid, Data),
                           stream_pid=assign_stream(undefined, Data)}};
connect(info, {assign_session, SessionPid}, Data=#data{target=Target, client_spec={Path, {M, A}}}) ->
    %% Assign session with a client spec. Start and link client by dialing
    case libp2p_session:dial_framed_stream(Path, SessionPid, M, A) of
        {ok, StreamPid} ->
            {keep_state, Data#data{session_monitor=monitor_session(SessionPid, Data),
                                   stream_pid=assign_stream(StreamPid, Data)}};
        {error, Error} ->
            lager:notice("Failed to start client on target: ~s path: ~s: ~p", [Target, Path, Error]),
            {keep_state, connect_retry(Data#data{session_monitor=monitor_session(undefined, Data),
                                                 stream_pid=assign_stream(undefined, Data)})}
    end;
connect(info, close, Data) ->
    {next_state, closing, Data};
connect(EventType, Msg, Data) ->
    handle_event(EventType, Msg, Data).

closing(info, close, #data{}) ->
    keep_state_and_data;
closing(info, {'EXIT', StreamPid, _Reason}, Data=#data{stream_pid=StreamPid}) ->
    %% The _stream_ that this worker is linked to went away.
    %% We do _not_ try to re-initiate outbound when we're closing down.
    %% Inbound streams are accepted. See handle_event({assign_stream, ..}).
    {keep_state, Data#data{session_monitor=undefined,
                           stream_pid=assign_stream(undefined, Data)}};
closing(info, {'DOWN', SessionMonitor, process, _Pid, _Reason},
        Data=#data{session_monitor={SessionMonitor, _}}) ->
    %% The _session_ that this worker is monitoring went away. We're
    %% closing down so let it all go.
    {keep_state, Data#data{session_monitor=undefined,
                           stream_pid=assign_stream(undefined, Data)}};
closing(info, {'DOWN', _, process, _, _}, Data=#data{}) ->
    %% Ignore a normal or error down for the connect pid, since we're
    %% already in closing mode completed it's work successfully
    {keep_state, Data#data{connect_pid=undefined}};


closing(EventType, Msg, Data) ->
    handle_event(EventType, Msg, Data).



-spec terminate(Reason :: term(), State :: term(), Data :: term()) -> any().
terminate(_Reason, _State, Data=#data{connect_pid=Process}) ->
    kill_pid(Process),
    assign_stream(undefined, Data),
    monitor_session(undefined, Data).



handle_event(cast, {assign_stream, Conn, StreamPid},
             Data=#data{stream_pid=_CurrentStreamPid}) when StreamPid /= undefined  ->
    %% If send_pid known we have an existing stream. Do not replace.
    case rand:uniform(2) of
        1 ->
            %% lager:debug("Loser stream ~p (addr_info ~p) to assigned stream ~p (addr_info ~p)",
            %%             [StreamPid, libp2p_framed_stream:addr_info(StreamPid),
            %%              _CurrentStreamPid, libp2p_framed_stream:addr_info(_CurrentStreamPid)]),
            libp2p_framed_stream:close(StreamPid),
            keep_state_and_data;
        _ ->
            %% lager:debug("Lucky winner stream ~p (addr_info ~p) overriding existing stream ~p (addr_info ~p)",
            %%              [StreamPid, libp2p_framed_stream:addr_info(StreamPid),
            %%               _CurrentStreamPid, libp2p_framed_stream:addr_info(_CurrentStreamPid)]),
            case libp2p_connection:session(Conn) of
                {ok, SessionPid} ->
                    {keep_state, Data#data{session_monitor=monitor_session(SessionPid, Data),
                                           stream_pid=assign_stream(StreamPid, Data)}};
                _ ->
                    libp2p_framed_stream:close(StreamPid),
                    keep_state_and_data
            end
    end;
handle_event(cast, {assign_stream, Conn, StreamPid}, Data=#data{}) ->
    %% Assign a stream. Monitor the session and remember the
    %% stream. Link the stream right away
    link(StreamPid),
    {ok, SessionPid} = libp2p_connection:session(Conn),
    {keep_state, Data#data{session_monitor=monitor_session(SessionPid, Data),
                           stream_pid=assign_stream(StreamPid, Data)}};
handle_event(cast, {send, Ref, _Bin}, #data{server=Server, stream_pid=undefined}) ->
    %% Trying to send while not connected to a stream
    libp2p_group_server:send_result(Server, Ref, {error, not_connected}),
    keep_state_and_data;
handle_event(cast, {send, Ref, Bin}, #data{server=Server, stream_pid=StreamPid}) ->
    Result = libp2p_framed_stream:send(StreamPid, Bin),
    libp2p_group_server:send_result(Server, Ref, Result),
    keep_state_and_data;
handle_event(info, send_ack, #data{stream_pid=undefined}) ->
    keep_state_and_data;
handle_event(info, send_ack, #data{stream_pid=StreamPid}) ->
    StreamPid ! send_ack,
    keep_state_and_data;
handle_event({call, From}, info, Data=#data{kind=Kind, server=ServerPid, target=Target,
                                            stream_pid=StreamPid,
                                            session_monitor=SessionMonitor}) ->
    Info = #{
             module => ?MODULE,
             pid => self(),
             kind => Kind,
             server => ServerPid,
             target => Target,
             session =>
                 case SessionMonitor of
                     {_, SessPid} -> SessPid;
                     Other -> Other
                 end,
             stream_info =>
                 case StreamPid of
                     undefined -> undefined;
                     _ -> libp2p_framed_stream:info(StreamPid)
                 end
            },
    {keep_state, Data, [{reply, From, Info}]};

handle_event(enter, _, #data{})  ->
    %% Ignore out of order enter events since we may already have
    %% exited the original state.
    keeps_state_and_data;
handle_event(info, connect_retry, #data{}) ->
    %% Ignore unhandled connect_retry events. The connect state
    %% overrides this to deal with actual retries.
    keeps_state_and_data;
handle_event(EventType, Msg, #data{}) ->
    lager:warning("Unhandled event ~p: ~p", [EventType, Msg]),
    keep_state_and_data.

%% Utilities

-spec connect_retry(#data{}) -> #data{}.
connect_retry(Data=#data{connect_retry_timer=undefined}) ->
    Timer = erlang:send_after(?CONNECT_RETRY, self(), connect_retry),
    Data#data{connect_retry_timer=Timer};
connect_retry(Data=#data{}) ->
    Data.

-spec monitor_session(SessionPid::pid() | undefined, #data{}) -> pid_monitor().
monitor_session(undefined, #data{session_monitor=undefined}) ->
    undefined;
monitor_session(undefined, #data{session_monitor={Monitor,_}}) ->
    erlang:demonitor(Monitor),
    undefined;
monitor_session(SessionPid, #data{session_monitor=undefined}) ->
    {erlang:monitor(process, SessionPid), SessionPid};
monitor_session(SessionPid, #data{session_monitor={Monitor,_}}) ->
    erlang:demonitor(Monitor),
    {erlang:monitor(process, SessionPid), SessionPid}.

assign_stream(undefined, #data{stream_pid=undefined}) ->
    undefined;
assign_stream(undefined, #data{stream_pid=Pid, kind=Kind, server=Server}) ->
    catch unlink(Pid),
    libp2p_framed_stream:close(Pid),
    libp2p_group_server:send_ready(Server, Kind, false),
    undefined;
assign_stream(StreamPid, #data{stream_pid=undefined, kind=Kind, server=Server}) ->
    link(StreamPid),
    libp2p_group_server:send_ready(Server, Kind, true),
    StreamPid;
assign_stream(StreamPid, #data{stream_pid=StreamPid}) ->
    StreamPid;
assign_stream(StreamPid, #data{stream_pid=Pid, server=Server, kind=Kind}) ->
    link(StreamPid),
    catch unlink(Pid),
    libp2p_framed_stream:close(Pid),
    %% we have a new stream, re-advertise our ready status
    libp2p_group_server:send_ready(Server, Kind, true),
    StreamPid.

-spec kill_pid(pid() | undefined) -> undefined.
kill_pid(undefined) ->
    undefined;
kill_pid(Pid) ->
    unlink(Pid),
    erlang:exit(Pid, kill),
    undefined.

update_metadata(Data=#data{}) ->
    Path = fun(undefined) ->
                   undefined;
              ({P, _}) -> P
           end,
    SessionRemote = fun(undefined) ->
                            undefined;
                       ({_, Pid}) ->
                            {_, RemoteAddr} = libp2p_session:addr_info(Pid),
                            RemoteAddr
                    end,
    SessionLocal = fun(undefined) ->
                            undefined;
                       ({_, Pid}) ->
                            {LocalAddr, _} = libp2p_session:addr_info(Pid),
                            LocalAddr
                    end,
    IndexOrKind = fun(V) when is_atom(V) ->
                          {kind, V};
                     (I) when is_integer(I) ->
                          {index, I}
                  end,
    libp2p_lager_metadata:update(
      [
       {target, Data#data.target},
       {path, Path(Data#data.client_spec)},
       IndexOrKind(Data#data.kind),
       {group_id, Data#data.group_id},
       {session_local, SessionLocal(Data#data.session_monitor)},
       {session_remote, SessionRemote(Data#data.session_monitor)}
      ]),
    Data.
