

# Module libp2p_relay_bridge #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)



### <a name="Libp2p2_Relay_Bridge">Libp2p2 Relay Bridge</a> ###

Libp2p2 Relay Bridge API.

<a name="types"></a>

## Data Types ##




### <a name="type-relay_bridge_cr">relay_bridge_cr()</a> ###


<pre><code>
relay_bridge_cr() = #libp2p_relay_bridge_cr_pb{}
</code></pre>




### <a name="type-relay_bridge_rs">relay_bridge_rs()</a> ###


<pre><code>
relay_bridge_rs() = #libp2p_relay_bridge_rs_pb{}
</code></pre>




### <a name="type-relay_bridge_sc">relay_bridge_sc()</a> ###


<pre><code>
relay_bridge_sc() = #libp2p_relay_bridge_sc_pb{}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#client-1">client/1</a></td><td>
Getter.</td></tr><tr><td valign="top"><a href="#create_cr-2">create_cr/2</a></td><td>
Create an relay bridge Client to Relay.</td></tr><tr><td valign="top"><a href="#create_rs-2">create_rs/2</a></td><td>
Create an relay bridge Relay to Server.</td></tr><tr><td valign="top"><a href="#create_sc-2">create_sc/2</a></td><td>
Create an relay bridge Server to Client.</td></tr><tr><td valign="top"><a href="#server-1">server/1</a></td><td>
Getter.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="client-1"></a>

### client/1 ###

<pre><code>
client(Libp2p_relay_bridge_cr_pb::<a href="#type-relay_bridge_cr">relay_bridge_cr()</a> | <a href="#type-relay_bridge_rs">relay_bridge_rs()</a> | <a href="#type-relay_bridge_sc">relay_bridge_sc()</a>) -&gt; string()
</code></pre>
<br />

Getter

<a name="create_cr-2"></a>

### create_cr/2 ###

<pre><code>
create_cr(Server::string(), Client::string()) -&gt; <a href="#type-relay_bridge_cr">relay_bridge_cr()</a>
</code></pre>
<br />

Create an relay bridge Client to Relay

<a name="create_rs-2"></a>

### create_rs/2 ###

<pre><code>
create_rs(Server::string(), Client::string()) -&gt; <a href="#type-relay_bridge_rs">relay_bridge_rs()</a>
</code></pre>
<br />

Create an relay bridge Relay to Server

<a name="create_sc-2"></a>

### create_sc/2 ###

<pre><code>
create_sc(Server::string(), Client::string()) -&gt; <a href="#type-relay_bridge_sc">relay_bridge_sc()</a>
</code></pre>
<br />

Create an relay bridge Server to Client

<a name="server-1"></a>

### server/1 ###

<pre><code>
server(Libp2p_relay_bridge_cr_pb::<a href="#type-relay_bridge_cr">relay_bridge_cr()</a> | <a href="#type-relay_bridge_rs">relay_bridge_rs()</a> | <a href="#type-relay_bridge_sc">relay_bridge_sc()</a>) -&gt; string()
</code></pre>
<br />

Getter

