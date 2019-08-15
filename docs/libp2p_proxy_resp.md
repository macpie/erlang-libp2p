

# Module libp2p_proxy_resp #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)



### <a name="Libp2p2_Proxy_Resp">Libp2p2 Proxy Resp</a> ###

Libp2p2 Proxy Resp API.

<a name="types"></a>

## Data Types ##




### <a name="type-proxy_resp">proxy_resp()</a> ###


<pre><code>
proxy_resp() = #libp2p_proxy_resp_pb{}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#create-1">create/1</a></td><td>
Create an proxy respuest.</td></tr><tr><td valign="top"><a href="#create-2">create/2</a></td><td>
Create an proxy respuest.</td></tr><tr><td valign="top"><a href="#multiaddr-1">multiaddr/1</a></td><td>
Getter.</td></tr><tr><td valign="top"><a href="#success-1">success/1</a></td><td>
Getter.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="create-1"></a>

### create/1 ###

<pre><code>
create(Success::boolean()) -&gt; <a href="#type-proxy_resp">proxy_resp()</a>
</code></pre>
<br />

Create an proxy respuest

<a name="create-2"></a>

### create/2 ###

<pre><code>
create(Success::true, MultiAddr::string()) -&gt; <a href="#type-proxy_resp">proxy_resp()</a>
</code></pre>
<br />

Create an proxy respuest

<a name="multiaddr-1"></a>

### multiaddr/1 ###

<pre><code>
multiaddr(Resp::<a href="#type-proxy_resp">proxy_resp()</a>) -&gt; string() | undefined
</code></pre>
<br />

Getter

<a name="success-1"></a>

### success/1 ###

<pre><code>
success(Resp::<a href="#type-proxy_resp">proxy_resp()</a>) -&gt; boolean() | 0 | 1
</code></pre>
<br />

Getter

