

# Module libp2p_identify #
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

<a name="types"></a>

## Data Types ##




### <a name="type-identify">identify()</a> ###


<pre><code>
identify() = #libp2p_signed_identify_pb{}
</code></pre>




### <a name="type-identify_map">identify_map()</a> ###


<pre><code>
identify_map() = #{peer =&gt; <a href="libp2p_peer.md#type-peer">libp2p_peer:peer()</a>, observed_addr =&gt; string(), nonce =&gt; binary()}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#decode-1">decode/1</a></td><td>Decodes a given binary into an identify.</td></tr><tr><td valign="top"><a href="#encode-1">encode/1</a></td><td>Encodes the given identify into its binary form.</td></tr><tr><td valign="top"><a href="#from_map-2">from_map/2</a></td><td></td></tr><tr><td valign="top"><a href="#nonce-1">nonce/1</a></td><td></td></tr><tr><td valign="top"><a href="#observed_addr-1">observed_addr/1</a></td><td></td></tr><tr><td valign="top"><a href="#observed_maddr-1">observed_maddr/1</a></td><td></td></tr><tr><td valign="top"><a href="#peer-1">peer/1</a></td><td></td></tr><tr><td valign="top"><a href="#pubkey_bin-1">pubkey_bin/1</a></td><td></td></tr><tr><td valign="top"><a href="#verify-1">verify/1</a></td><td>Cryptographically verifies a given identify.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="decode-1"></a>

### decode/1 ###

<pre><code>
decode(Bin::binary()) -&gt; {ok, <a href="#type-identify">identify()</a>} | {error, term()}
</code></pre>
<br />

Decodes a given binary into an identify.

<a name="encode-1"></a>

### encode/1 ###

<pre><code>
encode(Msg::<a href="#type-identify">identify()</a>) -&gt; binary()
</code></pre>
<br />

Encodes the given identify into its binary form.

<a name="from_map-2"></a>

### from_map/2 ###

<pre><code>
from_map(Map::<a href="#type-identify_map">identify_map()</a>, SigFun::<a href="libp2p_crypto.md#type-sig_fun">libp2p_crypto:sig_fun()</a>) -&gt; <a href="#type-identify">identify()</a>
</code></pre>
<br />

<a name="nonce-1"></a>

### nonce/1 ###

<pre><code>
nonce(Libp2p_signed_identify_pb::<a href="#type-identify">identify()</a>) -&gt; string()
</code></pre>
<br />

<a name="observed_addr-1"></a>

### observed_addr/1 ###

<pre><code>
observed_addr(Identify::<a href="#type-identify">identify()</a>) -&gt; string()
</code></pre>
<br />

<a name="observed_maddr-1"></a>

### observed_maddr/1 ###

`observed_maddr(Libp2p_signed_identify_pb) -> any()`

<a name="peer-1"></a>

### peer/1 ###

<pre><code>
peer(Libp2p_signed_identify_pb::<a href="#type-identify">identify()</a>) -&gt; <a href="libp2p_peer.md#type-peer">libp2p_peer:peer()</a>
</code></pre>
<br />

<a name="pubkey_bin-1"></a>

### pubkey_bin/1 ###

<pre><code>
pubkey_bin(Identify::<a href="#type-identify">identify()</a>) -&gt; <a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>
</code></pre>
<br />

<a name="verify-1"></a>

### verify/1 ###

<pre><code>
verify(Msg::<a href="#type-identify">identify()</a>) -&gt; {ok, <a href="#type-identify">identify()</a>} | {error, term()}
</code></pre>
<br />

Cryptographically verifies a given identify.

