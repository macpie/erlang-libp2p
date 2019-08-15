

# Module libp2p_relay_server #
* [Description](#description)
* [Function Index](#index)
* [Function Details](#functions)



### <a name="Libp2p_Relay_Server">Libp2p Relay Server</a> ###
.

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#code_change-3">code_change/3</a></td><td></td></tr><tr><td valign="top"><a href="#handle_call-3">handle_call/3</a></td><td></td></tr><tr><td valign="top"><a href="#handle_cast-2">handle_cast/2</a></td><td></td></tr><tr><td valign="top"><a href="#handle_info-2">handle_info/2</a></td><td></td></tr><tr><td valign="top"><a href="#init-1">init/1</a></td><td></td></tr><tr><td valign="top"><a href="#negotiated-2">negotiated/2</a></td><td></td></tr><tr><td valign="top"><a href="#relay-1">relay/1</a></td><td></td></tr><tr><td valign="top"><a href="#replace-2">replace/2</a></td><td></td></tr><tr><td valign="top"><a href="#start_link-1">start_link/1</a></td><td></td></tr><tr><td valign="top"><a href="#stop-1">stop/1</a></td><td></td></tr><tr><td valign="top"><a href="#terminate-2">terminate/2</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="code_change-3"></a>

### code_change/3 ###

`code_change(OldVsn, State, Extra) -> any()`

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

`init(TID) -> any()`

<a name="negotiated-2"></a>

### negotiated/2 ###

<pre><code>
negotiated(Swarm::pid(), Address::string()) -&gt; ok | {error, any()}
</code></pre>
<br />

<a name="relay-1"></a>

### relay/1 ###

<pre><code>
relay(Swarm::pid()) -&gt; ok | {error, any()}
</code></pre>
<br />

<a name="replace-2"></a>

### replace/2 ###

<pre><code>
replace(Address::string(), Swarm::pid()) -&gt; ok | {error, any()}
</code></pre>
<br />

<a name="start_link-1"></a>

### start_link/1 ###

`start_link(Args) -> any()`

<a name="stop-1"></a>

### stop/1 ###

<pre><code>
stop(Swarm::pid()) -&gt; ok | {error, any()}
</code></pre>
<br />

<a name="terminate-2"></a>

### terminate/2 ###

`terminate(Reason, State) -> any()`

