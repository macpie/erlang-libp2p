

# Module libp2p_proxy_req #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)



### <a name="Libp2p2_Proxy_Request">Libp2p2 Proxy Request</a> ###

Libp2p2 Proxy Request API.

<a name="types"></a>

## Data Types ##




### <a name="type-proxy_req">proxy_req()</a> ###


<pre><code>
proxy_req() = #libp2p_proxy_req_pb{}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#address-1">address/1</a></td><td>
Getter.</td></tr><tr><td valign="top"><a href="#create-1">create/1</a></td><td>
Create an proxy request.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="address-1"></a>

### address/1 ###

<pre><code>
address(Req::<a href="#type-proxy_req">proxy_req()</a>) -&gt; string()
</code></pre>
<br />

Getter

<a name="create-1"></a>

### create/1 ###

<pre><code>
create(Address::string()) -&gt; <a href="#type-proxy_req">proxy_req()</a>
</code></pre>
<br />

Create an proxy request

