

# Module libp2p_relay_ping #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)



### <a name="Libp2p2_Relay_Ping">Libp2p2 Relay Ping</a> ###

Libp2p2 Relay Request API.

<a name="types"></a>

## Data Types ##




### <a name="type-relay_ping">relay_ping()</a> ###


<pre><code>
relay_ping() = #libp2p_relay_ping_pb{}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#create_ping-1">create_ping/1</a></td><td>
Create a relay ping.</td></tr><tr><td valign="top"><a href="#create_pong-1">create_pong/1</a></td><td>
Create a relay pong.</td></tr><tr><td valign="top"><a href="#seq-1">seq/1</a></td><td>
Access relay ping/pong sequence number.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="create_ping-1"></a>

### create_ping/1 ###

<pre><code>
create_ping(Seq::non_neg_integer()) -&gt; <a href="#type-relay_ping">relay_ping()</a>
</code></pre>
<br />

Create a relay ping

<a name="create_pong-1"></a>

### create_pong/1 ###

<pre><code>
create_pong(Libp2p_relay_ping_pb::<a href="#type-relay_ping">relay_ping()</a>) -&gt; <a href="#type-relay_ping">relay_ping()</a>
</code></pre>
<br />

Create a relay pong

<a name="seq-1"></a>

### seq/1 ###

<pre><code>
seq(Libp2p_relay_ping_pb::<a href="#type-relay_ping">relay_ping()</a>) -&gt; non_neg_integer()
</code></pre>
<br />

Access relay ping/pong sequence number

