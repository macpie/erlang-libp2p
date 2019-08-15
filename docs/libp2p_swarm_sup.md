

# Module libp2p_swarm_sup #
* [Function Index](#index)
* [Function Details](#functions)

__Behaviours:__ [`supervisor`](supervisor.md).

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#gossip_group-1">gossip_group/1</a></td><td></td></tr><tr><td valign="top"><a href="#init-1">init/1</a></td><td></td></tr><tr><td valign="top"><a href="#name-1">name/1</a></td><td></td></tr><tr><td valign="top"><a href="#opts-1">opts/1</a></td><td></td></tr><tr><td valign="top"><a href="#peerbook-1">peerbook/1</a></td><td></td></tr><tr><td valign="top"><a href="#pubkey_bin-1">pubkey_bin/1</a></td><td></td></tr><tr><td valign="top"><a href="#register_gossip_group-1">register_gossip_group/1</a></td><td></td></tr><tr><td valign="top"><a href="#register_peerbook-1">register_peerbook/1</a></td><td></td></tr><tr><td valign="top"><a href="#register_server-1">register_server/1</a></td><td></td></tr><tr><td valign="top"><a href="#server-1">server/1</a></td><td></td></tr><tr><td valign="top"><a href="#start_link-1">start_link/1</a></td><td></td></tr><tr><td valign="top"><a href="#sup-1">sup/1</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="gossip_group-1"></a>

### gossip_group/1 ###

<pre><code>
gossip_group(TID::<a href="ets.md#type-tab">ets:tab()</a>) -&gt; pid()
</code></pre>
<br />

<a name="init-1"></a>

### init/1 ###

`init(X1) -> any()`

<a name="name-1"></a>

### name/1 ###

<pre><code>
name(TID::<a href="ets.md#type-tab">ets:tab()</a>) -&gt; atom()
</code></pre>
<br />

<a name="opts-1"></a>

### opts/1 ###

<pre><code>
opts(TID::<a href="ets.md#type-tab">ets:tab()</a>) -&gt; <a href="libp2p_config.md#type-opts">libp2p_config:opts()</a> | any()
</code></pre>
<br />

<a name="peerbook-1"></a>

### peerbook/1 ###

<pre><code>
peerbook(TID::<a href="ets.md#type-tab">ets:tab()</a>) -&gt; pid()
</code></pre>
<br />

<a name="pubkey_bin-1"></a>

### pubkey_bin/1 ###

<pre><code>
pubkey_bin(TID::<a href="ets.md#type-tab">ets:tab()</a>) -&gt; <a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>
</code></pre>
<br />

<a name="register_gossip_group-1"></a>

### register_gossip_group/1 ###

`register_gossip_group(TID) -> any()`

<a name="register_peerbook-1"></a>

### register_peerbook/1 ###

`register_peerbook(TID) -> any()`

<a name="register_server-1"></a>

### register_server/1 ###

`register_server(TID) -> any()`

<a name="server-1"></a>

### server/1 ###

<pre><code>
server(Sup::<a href="ets.md#type-tab">ets:tab()</a> | pid()) -&gt; pid()
</code></pre>
<br />

<a name="start_link-1"></a>

### start_link/1 ###

`start_link(Args) -> any()`

<a name="sup-1"></a>

### sup/1 ###

<pre><code>
sup(TID::<a href="ets.md#type-tab">ets:tab()</a>) -&gt; pid()
</code></pre>
<br />

