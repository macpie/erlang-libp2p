

# Module libp2p_proxy_envelope #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)



### <a name="Libp2p2_Proxy_Envelope">Libp2p2 Proxy Envelope</a> ###

Libp2p2 Proxy Envelope API.

<a name="types"></a>

## Data Types ##




### <a name="type-proxy_envelope">proxy_envelope()</a> ###


<pre><code>
proxy_envelope() = #libp2p_proxy_envelope_pb{}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#create-2">create/2</a></td><td>
Create an envelope.</td></tr><tr><td valign="top"><a href="#data-1">data/1</a></td><td>
Getter.</td></tr><tr><td valign="top"><a href="#decode-1">decode/1</a></td><td>
Decode proxy_envelope binary to record.</td></tr><tr><td valign="top"><a href="#encode-1">encode/1</a></td><td>
Encode proxy_envelope record to binary.</td></tr><tr><td valign="top"><a href="#id-1">id/1</a></td><td>
Getter.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="create-2"></a>

### create/2 ###

<pre><code>
create(ID::binary(), Libp2p_proxy_req_pb::<a href="libp2p_proxy_req.md#type-proxy_req">libp2p_proxy_req:proxy_req()</a> | <a href="libp2p_proxy_resp.md#type-proxy_resp">libp2p_proxy_resp:proxy_resp()</a> | <a href="libp2p_proxy_dial_back.md#type-proxy_dial_back">libp2p_proxy_dial_back:proxy_dial_back()</a> | <a href="libp2p_proxy_error.md#type-proxy_error">libp2p_proxy_error:proxy_error()</a> | <a href="libp2p_proxy_overload.md#type-proxy_overload">libp2p_proxy_overload:proxy_overload()</a>) -&gt; <a href="#type-proxy_envelope">proxy_envelope()</a>
</code></pre>
<br />

Create an envelope

<a name="data-1"></a>

### data/1 ###

<pre><code>
data(Env::<a href="#type-proxy_envelope">proxy_envelope()</a>) -&gt; {req, <a href="libp2p_proxy_req.md#type-proxy_req">libp2p_proxy_req:proxy_req()</a>} | {resp, <a href="libp2p_proxy_resp.md#type-proxy_resp">libp2p_proxy_resp:proxy_resp()</a>} | {dial_back, <a href="libp2p_proxy_dial_back.md#type-proxy_dial_back">libp2p_proxy_dial_back:proxy_dial_back()</a>} | {error, <a href="libp2p_proxy_error.md#type-proxy_error">libp2p_proxy_error:proxy_error()</a>} | {overload, <a href="libp2p_proxy_overload.md#type-proxy_overload">libp2p_proxy_overload:proxy_overload()</a>}
</code></pre>
<br />

Getter

<a name="decode-1"></a>

### decode/1 ###

<pre><code>
decode(Bin::binary()) -&gt; <a href="#type-proxy_envelope">proxy_envelope()</a>
</code></pre>
<br />

Decode proxy_envelope binary to record

<a name="encode-1"></a>

### encode/1 ###

<pre><code>
encode(Libp2p_proxy_envelope_pb::<a href="#type-proxy_envelope">proxy_envelope()</a>) -&gt; binary()
</code></pre>
<br />

Encode proxy_envelope record to binary

<a name="id-1"></a>

### id/1 ###

<pre><code>
id(Env::<a href="#type-proxy_envelope">proxy_envelope()</a>) -&gt; binary()
</code></pre>
<br />

Getter

