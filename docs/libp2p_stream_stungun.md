

# Module libp2p_stream_stungun #
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

<a name="types"></a>

## Data Types ##




### <a name="type-txn_id">txn_id()</a> ###


<pre><code>
txn_id() = non_neg_integer()
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#client-2">client/2</a></td><td></td></tr><tr><td valign="top"><a href="#dial-5">dial/5</a></td><td></td></tr><tr><td valign="top"><a href="#handle_data-3">handle_data/3</a></td><td></td></tr><tr><td valign="top"><a href="#init-3">init/3</a></td><td></td></tr><tr><td valign="top"><a href="#mk_stun_txn-0">mk_stun_txn/0</a></td><td></td></tr><tr><td valign="top"><a href="#server-4">server/4</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="client-2"></a>

### client/2 ###

`client(Connection, Args) -> any()`

<a name="dial-5"></a>

### dial/5 ###

<pre><code>
dial(TID::<a href="ets.md#type-tab">ets:tab()</a>, PeerAddr::string(), PeerPath::string(), TxnID::<a href="#type-txn_id">txn_id()</a>, Handler::pid()) -&gt; {ok, pid()} | {error, term()}
</code></pre>
<br />

<a name="handle_data-3"></a>

### handle_data/3 ###

`handle_data(X1, Code, State) -> any()`

<a name="init-3"></a>

### init/3 ###

`init(X1, Connection, X3) -> any()`

<a name="mk_stun_txn-0"></a>

### mk_stun_txn/0 ###

<pre><code>
mk_stun_txn() -&gt; {string(), <a href="#type-txn_id">txn_id()</a>}
</code></pre>
<br />

<a name="server-4"></a>

### server/4 ###

`server(Connection, Path, TID, Args) -> any()`

