

# Module libp2p_peerbook #
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

<a name="types"></a>

## Data Types ##




### <a name="type-opt">opt()</a> ###


<pre><code>
opt() = {stale_time, pos_integer()} | {peer_time, pos_integer()}
</code></pre>




### <a name="type-peerbook">peerbook()</a> ###


<pre><code>
peerbook() = #peerbook{tid = <a href="ets.md#type-tab">ets:tab()</a>, store = <a href="/Users/pdefebvre/Perso/erlang-libp2p/_build/default/lib/rocksdb/doc/rocksdb.md#type-db_handle">rocksdb:db_handle()</a>, stale_time = pos_integer()}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#add_association-3">add_association/3</a></td><td>Adds an association under the given type to for the swarm this
peerbook is part of.</td></tr><tr><td valign="top"><a href="#blacklist_listen_addr-3">blacklist_listen_addr/3</a></td><td></td></tr><tr><td valign="top"><a href="#changed_listener-1">changed_listener/1</a></td><td></td></tr><tr><td valign="top"><a href="#get-2">get/2</a></td><td></td></tr><tr><td valign="top"><a href="#handle_call-3">handle_call/3</a></td><td></td></tr><tr><td valign="top"><a href="#handle_cast-2">handle_cast/2</a></td><td></td></tr><tr><td valign="top"><a href="#handle_gossip_data-2">handle_gossip_data/2</a></td><td></td></tr><tr><td valign="top"><a href="#handle_info-2">handle_info/2</a></td><td></td></tr><tr><td valign="top"><a href="#init-1">init/1</a></td><td></td></tr><tr><td valign="top"><a href="#init_gossip_data-1">init_gossip_data/1</a></td><td></td></tr><tr><td valign="top"><a href="#is_key-2">is_key/2</a></td><td></td></tr><tr><td valign="top"><a href="#join_notify-2">join_notify/2</a></td><td></td></tr><tr><td valign="top"><a href="#keys-1">keys/1</a></td><td></td></tr><tr><td valign="top"><a href="#lookup_association-3">lookup_association/3</a></td><td>Look up all the peers that have a given association type
<code>AssocTyp</code> and address <code>AssocAddress</code> in their associations.</td></tr><tr><td valign="top"><a href="#put-2">put/2</a></td><td></td></tr><tr><td valign="top"><a href="#register_session-3">register_session/3</a></td><td></td></tr><tr><td valign="top"><a href="#remove-2">remove/2</a></td><td></td></tr><tr><td valign="top"><a href="#stale_time-1">stale_time/1</a></td><td></td></tr><tr><td valign="top"><a href="#start_link-2">start_link/2</a></td><td></td></tr><tr><td valign="top"><a href="#terminate-2">terminate/2</a></td><td></td></tr><tr><td valign="top"><a href="#unregister_session-2">unregister_session/2</a></td><td></td></tr><tr><td valign="top"><a href="#update_nat_type-2">update_nat_type/2</a></td><td></td></tr><tr><td valign="top"><a href="#values-1">values/1</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="add_association-3"></a>

### add_association/3 ###

<pre><code>
add_association(Peerbook::<a href="#type-peerbook">peerbook()</a>, AssocType::string(), Assoc::<a href="libp2p_peer.md#type-association">libp2p_peer:association()</a>) -&gt; ok
</code></pre>
<br />

Adds an association under the given type to for the swarm this
peerbook is part of. Note that the association _must_ have its
signature be valid for the address of the swarm this peerbook is
part of.

Associations are gossiped with the peer record for the swarm.

Note that the given association will replace an existing
association with the given type and address of the association.

<a name="blacklist_listen_addr-3"></a>

### blacklist_listen_addr/3 ###

<pre><code>
blacklist_listen_addr(Handle::<a href="#type-peerbook">peerbook()</a>, ID::<a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>, ListenAddr::string()) -&gt; ok | {error, not_found}
</code></pre>
<br />

<a name="changed_listener-1"></a>

### changed_listener/1 ###

`changed_listener(Peerbook) -> any()`

<a name="get-2"></a>

### get/2 ###

<pre><code>
get(Peerbook::<a href="#type-peerbook">peerbook()</a>, ID::<a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>) -&gt; {ok, <a href="libp2p_peer.md#type-peer">libp2p_peer:peer()</a>} | {error, term()}
</code></pre>
<br />

<a name="handle_call-3"></a>

### handle_call/3 ###

`handle_call(Msg, From, State) -> any()`

<a name="handle_cast-2"></a>

### handle_cast/2 ###

`handle_cast(Msg, State) -> any()`

<a name="handle_gossip_data-2"></a>

### handle_gossip_data/2 ###

<pre><code>
handle_gossip_data(Data::binary(), Handle::<a href="#type-peerbook">peerbook()</a>) -&gt; ok
</code></pre>
<br />

<a name="handle_info-2"></a>

### handle_info/2 ###

`handle_info(Msg, State) -> any()`

<a name="init-1"></a>

### init/1 ###

`init(X1) -> any()`

<a name="init_gossip_data-1"></a>

### init_gossip_data/1 ###

<pre><code>
init_gossip_data(Handle::<a href="#type-peerbook">peerbook()</a>) -&gt; <a href="libp2p_group_gossip_handler.md#type-init_result">libp2p_group_gossip_handler:init_result()</a>
</code></pre>
<br />

<a name="is_key-2"></a>

### is_key/2 ###

<pre><code>
is_key(Handle::<a href="#type-peerbook">peerbook()</a>, ID::<a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>) -&gt; boolean()
</code></pre>
<br />

<a name="join_notify-2"></a>

### join_notify/2 ###

<pre><code>
join_notify(Peerbook::<a href="#type-peerbook">peerbook()</a>, Joiner::pid()) -&gt; ok
</code></pre>
<br />

<a name="keys-1"></a>

### keys/1 ###

<pre><code>
keys(Handle::<a href="#type-peerbook">peerbook()</a>) -&gt; [<a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>]
</code></pre>
<br />

<a name="lookup_association-3"></a>

### lookup_association/3 ###

<pre><code>
lookup_association(Handle::<a href="#type-peerbook">peerbook()</a>, AssocType::string(), AssocAddress::<a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>) -&gt; [<a href="libp2p_peer.md#type-peer">libp2p_peer:peer()</a>]
</code></pre>
<br />

Look up all the peers that have a given association type
`AssocTyp` and address `AssocAddress` in their associations.

<a name="put-2"></a>

### put/2 ###

<pre><code>
put(Peerbook::<a href="#type-peerbook">peerbook()</a>, PeerList::[<a href="libp2p_peer.md#type-peer">libp2p_peer:peer()</a>]) -&gt; ok | {error, term()}
</code></pre>
<br />

<a name="register_session-3"></a>

### register_session/3 ###

<pre><code>
register_session(Peerbook::<a href="#type-peerbook">peerbook()</a>, SessionPid::pid(), Identify::<a href="libp2p_identify.md#type-identify">libp2p_identify:identify()</a>) -&gt; ok
</code></pre>
<br />

<a name="remove-2"></a>

### remove/2 ###

<pre><code>
remove(Peerbook::<a href="#type-peerbook">peerbook()</a>, ID::<a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>) -&gt; ok | {error, no_delete}
</code></pre>
<br />

<a name="stale_time-1"></a>

### stale_time/1 ###

<pre><code>
stale_time(Peerbook::<a href="#type-peerbook">peerbook()</a>) -&gt; pos_integer()
</code></pre>
<br />

<a name="start_link-2"></a>

### start_link/2 ###

`start_link(TID, SigFun) -> any()`

<a name="terminate-2"></a>

### terminate/2 ###

`terminate(Reason, State) -> any()`

<a name="unregister_session-2"></a>

### unregister_session/2 ###

<pre><code>
unregister_session(Peerbook::<a href="#type-peerbook">peerbook()</a>, SessionPid::pid()) -&gt; ok
</code></pre>
<br />

<a name="update_nat_type-2"></a>

### update_nat_type/2 ###

<pre><code>
update_nat_type(Peerbook::<a href="#type-peerbook">peerbook()</a>, NatType::<a href="libp2p_peer.md#type-nat_type">libp2p_peer:nat_type()</a>) -&gt; ok
</code></pre>
<br />

<a name="values-1"></a>

### values/1 ###

<pre><code>
values(Handle::<a href="#type-peerbook">peerbook()</a>) -&gt; [<a href="libp2p_peer.md#type-peer">libp2p_peer:peer()</a>]
</code></pre>
<br />

