

# Module libp2p_nat #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)



### <a name="Libp2p_NAT">Libp2p NAT</a> ###
.

<a name="types"></a>

## Data Types ##




### <a name="type-opt">opt()</a> ###


<pre><code>
opt() = {enabled, boolean()}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#add_port_mapping-2">add_port_mapping/2</a></td><td></td></tr><tr><td valign="top"><a href="#delete_port_mapping-2">delete_port_mapping/2</a></td><td></td></tr><tr><td valign="top"><a href="#enabled-1">enabled/1</a></td><td></td></tr><tr><td valign="top"><a href="#maybe_apply_nat_map-1">maybe_apply_nat_map/1</a></td><td></td></tr><tr><td valign="top"><a href="#maybe_spawn_discovery-3">maybe_spawn_discovery/3</a></td><td></td></tr><tr><td valign="top"><a href="#renew_port_mapping-2">renew_port_mapping/2</a></td><td></td></tr><tr><td valign="top"><a href="#spawn_discovery-3">spawn_discovery/3</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="add_port_mapping-2"></a>

### add_port_mapping/2 ###

<pre><code>
add_port_mapping(InternalPort::integer(), ExternalPort::integer()) -&gt; {ok, string(), integer(), integer() | infinity, integer()} | {error, any()}
</code></pre>
<br />

<a name="delete_port_mapping-2"></a>

### delete_port_mapping/2 ###

<pre><code>
delete_port_mapping(InternalPort::integer(), ExternalPort::integer()) -&gt; ok | {error, any()}
</code></pre>
<br />

<a name="enabled-1"></a>

### enabled/1 ###

<pre><code>
enabled(Opts::<a href="ets.md#type-tab">ets:tab()</a> | list()) -&gt; boolean()
</code></pre>
<br />

<a name="maybe_apply_nat_map-1"></a>

### maybe_apply_nat_map/1 ###

`maybe_apply_nat_map(X1) -> any()`

<a name="maybe_spawn_discovery-3"></a>

### maybe_spawn_discovery/3 ###

<pre><code>
maybe_spawn_discovery(Pid::pid(), MultiAddrs::[string()], TID::<a href="ets.md#type-tab">ets:tab()</a>) -&gt; ok
</code></pre>
<br />

<a name="renew_port_mapping-2"></a>

### renew_port_mapping/2 ###

<pre><code>
renew_port_mapping(InternalPort::integer(), ExternalPort::integer()) -&gt; {ok, string(), integer(), integer() | infinity, integer()} | {error, any()}
</code></pre>
<br />

<a name="spawn_discovery-3"></a>

### spawn_discovery/3 ###

<pre><code>
spawn_discovery(Pid::pid(), MultiAddrs::[string()], TID::<a href="ets.md#type-tab">ets:tab()</a>) -&gt; ok
</code></pre>
<br />

