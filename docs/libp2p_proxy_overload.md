

# Module libp2p_proxy_overload #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)



### <a name="Libp2p2_Proxy_Overload">Libp2p2 Proxy Overload</a> ###

Libp2p2 Proxy Overload API.

<a name="types"></a>

## Data Types ##




### <a name="type-proxy_overload">proxy_overload()</a> ###


<pre><code>
proxy_overload() = #libp2p_proxy_overload_pb{}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#new-1">new/1</a></td><td>
Create an proxy respuest.</td></tr><tr><td valign="top"><a href="#pub_key_bin-1">pub_key_bin/1</a></td><td>
Getter.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="new-1"></a>

### new/1 ###

<pre><code>
new(PubKeyBin::<a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>) -&gt; <a href="#type-proxy_overload">proxy_overload()</a>
</code></pre>
<br />

Create an proxy respuest

<a name="pub_key_bin-1"></a>

### pub_key_bin/1 ###

<pre><code>
pub_key_bin(Overload::<a href="#type-proxy_overload">proxy_overload()</a>) -&gt; <a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>
</code></pre>
<br />

Getter

