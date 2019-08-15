

# Module libp2p_group_worker #
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

__Behaviours:__ [`gen_statem`](gen_statem.md).

<a name="types"></a>

## Data Types ##




### <a name="type-stream_client_spec">stream_client_spec()</a> ###


<pre><code>
stream_client_spec() = {Path::string(), {Module::atom(), Args::[any()]}}
</code></pre>




### <a name="type-target">target()</a> ###


<pre><code>
target() = {MAddr::string(), Spec::<a href="#type-stream_client_spec">stream_client_spec()</a>}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#assign_stream-2">assign_stream/2</a></td><td>Assigns the given stream to the worker.</td></tr><tr><td valign="top"><a href="#assign_target-2">assign_target/2</a></td><td>Assign a target to a worker.</td></tr><tr><td valign="top"><a href="#callback_mode-0">callback_mode/0</a></td><td></td></tr><tr><td valign="top"><a href="#clear_target-1">clear_target/1</a></td><td>Clears the current target for the worker.</td></tr><tr><td valign="top"><a href="#close-1">close/1</a></td><td>Changes the group worker state to <code>closing</code> state.</td></tr><tr><td valign="top"><a href="#closing-3">closing/3</a></td><td></td></tr><tr><td valign="top"><a href="#connected-3">connected/3</a></td><td></td></tr><tr><td valign="top"><a href="#connecting-3">connecting/3</a></td><td></td></tr><tr><td valign="top"><a href="#init-1">init/1</a></td><td></td></tr><tr><td valign="top"><a href="#send-3">send/3</a></td><td>Sends a given <code>Data</code> binary on it's stream asynchronously.</td></tr><tr><td valign="top"><a href="#send_ack-3">send_ack/3</a></td><td>Used as a convenience for groups using libp2p_ack_stream, this
function sends an ack to the worker's stream if connected.</td></tr><tr><td valign="top"><a href="#start_link-4">start_link/4</a></td><td></td></tr><tr><td valign="top"><a href="#start_link-5">start_link/5</a></td><td></td></tr><tr><td valign="top"><a href="#targeting-3">targeting/3</a></td><td></td></tr><tr><td valign="top"><a href="#terminate-3">terminate/3</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="assign_stream-2"></a>

### assign_stream/2 ###

<pre><code>
assign_stream(Pid::pid(), StreamPid::pid()) -&gt; ok
</code></pre>
<br />

Assigns the given stream to the worker. This does _not_ update
the target of the worker but moves the worker to the `connected`
state and uses it to send data.

<a name="assign_target-2"></a>

### assign_target/2 ###

<pre><code>
assign_target(Pid::pid(), Target::<a href="#type-target">target()</a>) -&gt; ok
</code></pre>
<br />

Assign a target to a worker. This causes the worker to go back
to attempting to connect to the given target, dropping it's stream
if it has one. The target is passed as the a tuple consisting of
the crytpo address and the spec of the stream client to start once
the worker is connected to the target.

<a name="callback_mode-0"></a>

### callback_mode/0 ###

`callback_mode() -> any()`

<a name="clear_target-1"></a>

### clear_target/1 ###

<pre><code>
clear_target(Pid::pid()) -&gt; ok
</code></pre>
<br />

Clears the current target for the worker. The worker goes back
to target acquisition, after dropping it's streeam if it has one.

<a name="close-1"></a>

### close/1 ###

<pre><code>
close(Pid::pid()) -&gt; ok
</code></pre>
<br />

Changes the group worker state to `closing` state. Closing
means that a newly assigned stream is still accepted but the worker
will not attempt to re-acquire a target or re-connect.

<a name="closing-3"></a>

### closing/3 ###

`closing(EventType, Msg, Data) -> any()`

<a name="connected-3"></a>

### connected/3 ###

`connected(EventType, Msg, Data) -> any()`

<a name="connecting-3"></a>

### connecting/3 ###

`connecting(EventType, Msg, Data) -> any()`

<a name="init-1"></a>

### init/1 ###

<pre><code>
init(Args::term()) -&gt; <a href="gen_statem.md#type-init_result">gen_statem:init_result</a>(atom())
</code></pre>
<br />

<a name="send-3"></a>

### send/3 ###

<pre><code>
send(Pid::pid(), Ref::term(), Data::any()) -&gt; ok
</code></pre>
<br />

Sends a given `Data` binary on it's stream asynchronously. The given `Ref` is
used to indicate the send result to the server for the worker.

__See also:__ [libp2p_group_server:send_result/3](libp2p_group_server.md#send_result-3).

<a name="send_ack-3"></a>

### send_ack/3 ###

<pre><code>
send_ack(Pid::pid(), Seq::[pos_integer()], Reset::boolean()) -&gt; ok
</code></pre>
<br />

Used as a convenience for groups using libp2p_ack_stream, this
function sends an ack to the worker's stream if connected.

<a name="start_link-4"></a>

### start_link/4 ###

<pre><code>
start_link(Kind::atom(), Server::pid(), GroupID::string(), TID::<a href="ets.md#type-tab">ets:tab()</a>) -&gt; {ok, Pid::pid()} | ignore | {error, Error::term()}
</code></pre>
<br />

<a name="start_link-5"></a>

### start_link/5 ###

<pre><code>
start_link(Kind::atom(), Stream::pid(), Server::pid(), GroupID::string(), TID::<a href="ets.md#type-tab">ets:tab()</a>) -&gt; {ok, Pid::pid()} | ignore | {error, Error::term()}
</code></pre>
<br />

<a name="targeting-3"></a>

### targeting/3 ###

`targeting(EventType, Msg, Data) -> any()`

<a name="terminate-3"></a>

### terminate/3 ###

<pre><code>
terminate(Reason::term(), State::term(), Data::term()) -&gt; any()
</code></pre>
<br />

