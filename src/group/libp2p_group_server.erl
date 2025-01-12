-module(libp2p_group_server).

-export([request_target/3, send_result/3, send_ready/4]).

-spec request_target(Server::pid(), term(), Worker::pid()) -> ok.
request_target(Pid, Kind, WorkerPid) ->
    gen_server:cast(Pid, {request_target, Kind, WorkerPid}).

-spec send_result(Server::pid(), Ref::term(), Result::any()) -> ok.
send_result(Pid, Ref, Result) ->
    gen_server:cast(Pid, {send_result, Ref, Result}).

-spec send_ready(Server::pid(), Target::string(), Ref::term(), Ready::boolean()) -> ok.
send_ready(Pid, Target, Ref, Ready) ->
    gen_server:cast(Pid, {send_ready, Target, Ref, Ready}).
