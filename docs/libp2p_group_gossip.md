

# Module libp2p_group_gossip #
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

<a name="types"></a>

## Data Types ##




### <a name="type-connection_kind">connection_kind()</a> ###


<pre><code>
connection_kind() = peerbook | seed | inbound
</code></pre>




### <a name="type-handler">handler()</a> ###


<pre><code>
handler() = {Module::atom(), State::any()}
</code></pre>




### <a name="type-opt">opt()</a> ###


<pre><code>
opt() = {peerbook_connections, pos_integer()} | {drop_timeout, pos_integer()} | {stream_clients, [<a href="libp2p_group_worker.md#type-stream_client_spec">libp2p_group_worker:stream_client_spec()</a>]} | {seed_nodes, [MultiAddr::string()]}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#add_handler-3">add_handler/3</a></td><td></td></tr><tr><td valign="top"><a href="#connected_addrs-2">connected_addrs/2</a></td><td></td></tr><tr><td valign="top"><a href="#remove_handler-2">remove_handler/2</a></td><td></td></tr><tr><td valign="top"><a href="#send-3">send/3</a></td><td>Send the given data to all members of the group for the given
gossip key.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="add_handler-3"></a>

### add_handler/3 ###

<pre><code>
add_handler(Pid::pid(), Key::string(), Handler::<a href="#type-handler">handler()</a>) -&gt; ok
</code></pre>
<br />

<a name="connected_addrs-2"></a>

### connected_addrs/2 ###

<pre><code>
connected_addrs(Pid::pid(), WorkerKind::<a href="#type-connection_kind">connection_kind()</a> | all) -&gt; [string()]
</code></pre>
<br />

<a name="remove_handler-2"></a>

### remove_handler/2 ###

<pre><code>
remove_handler(Pid::pid(), Key::string()) -&gt; ok
</code></pre>
<br />

<a name="send-3"></a>

### send/3 ###

<pre><code>
send(Pid::pid(), Key::string(), Data::iodata()) -&gt; ok
</code></pre>
<br />

Send the given data to all members of the group for the given
gossip key. The implementation of the group determines the strategy
used for delivery. Delivery is best effort.

