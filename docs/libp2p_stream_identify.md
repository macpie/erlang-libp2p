

# Module libp2p_stream_identify #
* [Function Index](#index)
* [Function Details](#functions)

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#client-2">client/2</a></td><td></td></tr><tr><td valign="top"><a href="#dial_spawn-3">dial_spawn/3</a></td><td></td></tr><tr><td valign="top"><a href="#handle_data-3">handle_data/3</a></td><td></td></tr><tr><td valign="top"><a href="#handle_info-3">handle_info/3</a></td><td></td></tr><tr><td valign="top"><a href="#init-3">init/3</a></td><td></td></tr><tr><td valign="top"><a href="#server-4">server/4</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="client-2"></a>

### client/2 ###

`client(Connection, Args) -> any()`

<a name="dial_spawn-3"></a>

### dial_spawn/3 ###

<pre><code>
dial_spawn(Session::pid(), TID::<a href="ets.md#type-tab">ets:tab()</a>, Handler::pid()) -&gt; pid()
</code></pre>
<br />

<a name="handle_data-3"></a>

### handle_data/3 ###

`handle_data(X1, Data, State) -> any()`

<a name="handle_info-3"></a>

### handle_info/3 ###

`handle_info(X1, X2, State) -> any()`

<a name="init-3"></a>

### init/3 ###

`init(X1, Connection, X3) -> any()`

<a name="server-4"></a>

### server/4 ###

`server(Connection, Path, TID, X4) -> any()`

