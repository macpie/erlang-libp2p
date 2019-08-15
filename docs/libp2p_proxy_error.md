

# Module libp2p_proxy_error #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)



### <a name="Libp2p2_Proxy_Error">Libp2p2 Proxy Error</a> ###

Libp2p2 Proxy Error API.

<a name="types"></a>

## Data Types ##




### <a name="type-proxy_error">proxy_error()</a> ###


<pre><code>
proxy_error() = #libp2p_proxy_error_pb{}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#new-1">new/1</a></td><td>
Create an proxy respuest.</td></tr><tr><td valign="top"><a href="#reason-1">reason/1</a></td><td>
Getter.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="new-1"></a>

### new/1 ###

<pre><code>
new(Reason::atom()) -&gt; <a href="#type-proxy_error">proxy_error()</a>
</code></pre>
<br />

Create an proxy respuest

<a name="reason-1"></a>

### reason/1 ###

<pre><code>
reason(Error::<a href="#type-proxy_error">proxy_error()</a>) -&gt; atom()
</code></pre>
<br />

Getter

