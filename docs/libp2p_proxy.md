

# Module libp2p_proxy #
* [Description](#description)
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)



### <a name="Libp2p_Proxy">Libp2p Proxy</a> ###
.

<a name="types"></a>

## Data Types ##




### <a name="type-opt">opt()</a> ###


<pre><code>
opt() = {address, string()} | {port, integer()} | {limit, non_neg_integer()}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#add_stream_handler-1">add_stream_handler/1</a></td><td></td></tr><tr><td valign="top"><a href="#dial_framed_stream-3">dial_framed_stream/3</a></td><td>
Dial proxy stream.</td></tr><tr><td valign="top"><a href="#limit-1">limit/1</a></td><td></td></tr><tr><td valign="top"><a href="#version-0">version/0</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="add_stream_handler-1"></a>

### add_stream_handler/1 ###

<pre><code>
add_stream_handler(TID::<a href="ets.md#type-tab">ets:tab()</a>) -&gt; ok
</code></pre>
<br />

<a name="dial_framed_stream-3"></a>

### dial_framed_stream/3 ###

<pre><code>
dial_framed_stream(Swarm::pid(), Address::string(), Args::list()) -&gt; {ok, pid()} | {error, any()} | ignore
</code></pre>
<br />

Dial proxy stream

<a name="limit-1"></a>

### limit/1 ###

<pre><code>
limit(Opts::<a href="ets.md#type-tab">ets:tab()</a> | list()) -&gt; integer()
</code></pre>
<br />

<a name="version-0"></a>

### version/0 ###

<pre><code>
version() -&gt; string()
</code></pre>
<br />

