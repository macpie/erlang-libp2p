

# Module libp2p_proxy_server #
* [Description](#description)
* [Function Index](#index)
* [Function Details](#functions)



### <a name="Libp2p_Proxy_Server">Libp2p Proxy Server</a> ###
.

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#code_change-3">code_change/3</a></td><td></td></tr><tr><td valign="top"><a href="#connection-3">connection/3</a></td><td></td></tr><tr><td valign="top"><a href="#handle_call-3">handle_call/3</a></td><td></td></tr><tr><td valign="top"><a href="#handle_cast-2">handle_cast/2</a></td><td></td></tr><tr><td valign="top"><a href="#handle_info-2">handle_info/2</a></td><td></td></tr><tr><td valign="top"><a href="#init-1">init/1</a></td><td></td></tr><tr><td valign="top"><a href="#proxy-4">proxy/4</a></td><td></td></tr><tr><td valign="top"><a href="#start_link-1">start_link/1</a></td><td></td></tr><tr><td valign="top"><a href="#terminate-2">terminate/2</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="code_change-3"></a>

### code_change/3 ###

`code_change(OldVsn, State, Extra) -> any()`

<a name="connection-3"></a>

### connection/3 ###

<pre><code>
connection(TID::<a href="ets.md#type-tab">ets:tab()</a>, Connection::<a href="libp2p_connection.md#type-connection">libp2p_connection:connection()</a>, ID::binary()) -&gt; ok | {error, any()}
</code></pre>
<br />

<a name="handle_call-3"></a>

### handle_call/3 ###

`handle_call(Msg, From, State) -> any()`

<a name="handle_cast-2"></a>

### handle_cast/2 ###

`handle_cast(Msg, State) -> any()`

<a name="handle_info-2"></a>

### handle_info/2 ###

`handle_info(Msg, State) -> any()`

<a name="init-1"></a>

### init/1 ###

`init(Args) -> any()`

<a name="proxy-4"></a>

### proxy/4 ###

<pre><code>
proxy(Swarm::pid(), ID::binary(), ServerStream::pid(), AAddress::string()) -&gt; ok | {error, any()}
</code></pre>
<br />

<a name="start_link-1"></a>

### start_link/1 ###

`start_link(Args) -> any()`

<a name="terminate-2"></a>

### terminate/2 ###

`terminate(Reason, State) -> any()`

