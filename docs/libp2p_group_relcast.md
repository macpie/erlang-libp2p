

# Module libp2p_group_relcast #
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

<a name="types"></a>

## Data Types ##




### <a name="type-opt">opt()</a> ###


<pre><code>
opt() = {stream_clients, [<a href="libp2p_group_worker.md#type-stream_client_spec">libp2p_group_worker:stream_client_spec()</a>]}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#handle_command-2">handle_command/2</a></td><td></td></tr><tr><td valign="top"><a href="#handle_input-2">handle_input/2</a></td><td></td></tr><tr><td valign="top"><a href="#info-1">info/1</a></td><td>Gets information for a group.</td></tr><tr><td valign="top"><a href="#queues-1">queues/1</a></td><td>Get the messages queued in the relcast server.</td></tr><tr><td valign="top"><a href="#send-2">send/2</a></td><td>Send the given data to the member of the group.</td></tr><tr><td valign="top"><a href="#start_link-3">start_link/3</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="handle_command-2"></a>

### handle_command/2 ###

<pre><code>
handle_command(GroupPid::pid(), Msg::term()) -&gt; term() | {error, any()}
</code></pre>
<br />

<a name="handle_input-2"></a>

### handle_input/2 ###

<pre><code>
handle_input(GroupPid::pid(), Msg::term()) -&gt; ok
</code></pre>
<br />

<a name="info-1"></a>

### info/1 ###

<pre><code>
info(GroupPid::pid()) -&gt; map()
</code></pre>
<br />

Gets information for a group. The information is represented
as a nested map of information related to the workers, sessions and
streams that build up the group.

<a name="queues-1"></a>

### queues/1 ###

<pre><code>
queues(GroupPid::pid()) -&gt; <a href="relcast.md#type-status">relcast:status()</a>
</code></pre>
<br />

Get the messages queued in the relcast server.

<a name="send-2"></a>

### send/2 ###

<pre><code>
send(GroupPid::pid(), Data::iodata()) -&gt; ok | {error, term()}
</code></pre>
<br />

Send the given data to the member of the group. The
implementation of the group determines the strategy used for
delivery. For gossip groups, for example, delivery is best effort.

<a name="start_link-3"></a>

### start_link/3 ###

<pre><code>
start_link(TID::<a href="ets.md#type-tab">ets:tab()</a>, GroupID::string(), Args::[any()]) -&gt; {ok, pid()} | {error, term()}
</code></pre>
<br />

