

# Module libp2p_peer #
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

<a name="types"></a>

## Data Types ##




### <a name="type-association">association()</a> ###


<pre><code>
association() = #libp2p_association_pb{}
</code></pre>




### <a name="type-association_map">association_map()</a> ###


<pre><code>
association_map() = [{Type::string(), [<a href="#type-association">association()</a>]}]
</code></pre>




### <a name="type-metadata">metadata()</a> ###


<pre><code>
metadata() = [{string(), binary()}]
</code></pre>




### <a name="type-nat_type">nat_type()</a> ###


<pre><code>
nat_type() = <a href="libp2p_peer_pb.md#type-nat_type">libp2p_peer_pb:nat_type()</a>
</code></pre>




### <a name="type-peer">peer()</a> ###


<pre><code>
peer() = #libp2p_signed_peer_pb{}
</code></pre>




### <a name="type-peer_map">peer_map()</a> ###


<pre><code>
peer_map() = #{pubkey =&gt; <a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>, listen_addrs =&gt; [string()], connected =&gt; [binary()], nat_type =&gt; <a href="#type-nat_type">nat_type()</a>, network_id =&gt; binary(), associations =&gt; <a href="#type-association_map">association_map()</a>, signed_metadata =&gt; #{binary() =&gt; binary()}}
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#association_decode-2">association_decode/2</a></td><td>Decodes the given binary to an association and verifies it
against the given peer key.</td></tr><tr><td valign="top"><a href="#association_encode-1">association_encode/1</a></td><td>Encodes the given association to it's binary form.</td></tr><tr><td valign="top"><a href="#association_pubkey_bin-1">association_pubkey_bin/1</a></td><td>Gets the address for the given association.</td></tr><tr><td valign="top"><a href="#association_pubkey_bins-1">association_pubkey_bins/1</a></td><td>Returns a list of association keys.</td></tr><tr><td valign="top"><a href="#association_signature-1">association_signature/1</a></td><td>Gets the signature for the given association.</td></tr><tr><td valign="top"><a href="#association_verify-2">association_verify/2</a></td><td>Returns true if the association can be verified against the
given peer key.</td></tr><tr><td valign="top"><a href="#associations-1">associations/1</a></td><td>Get the associations for this peer.</td></tr><tr><td valign="top"><a href="#associations_get-2">associations_get/2</a></td><td>Gets the associations of the given <code>AssocType</code> for the given peer.</td></tr><tr><td valign="top"><a href="#associations_put-4">associations_put/4</a></td><td>Adds or replaces a given assocation for the given type to the
peer.</td></tr><tr><td valign="top"><a href="#associations_set-4">associations_set/4</a></td><td>Replaces all associations for a given association type in the
given peer.</td></tr><tr><td valign="top"><a href="#blacklist-1">blacklist/1</a></td><td>Gets the blacklist for this peer.</td></tr><tr><td valign="top"><a href="#blacklist_add-2">blacklist_add/2</a></td><td>Add a given listen address to the blacklist for the given
peer.</td></tr><tr><td valign="top"><a href="#blacklist_set-2">blacklist_set/2</a></td><td>Sets the blacklist for a given peer.</td></tr><tr><td valign="top"><a href="#cleared_listen_addrs-1">cleared_listen_addrs/1</a></td><td>Returns the listen addrs for this peer filtered using the
blacklist for the peer, if one is present.</td></tr><tr><td valign="top"><a href="#connected_peers-1">connected_peers/1</a></td><td>Gets the list of peer crypto addresses that the given peer was last
known to be connected to.</td></tr><tr><td valign="top"><a href="#decode-1">decode/1</a></td><td>Decodes a given binary into a peer.</td></tr><tr><td valign="top"><a href="#decode_list-1">decode_list/1</a></td><td>Decodes a given binary into a list of peers.</td></tr><tr><td valign="top"><a href="#decode_unsafe-1">decode_unsafe/1</a></td><td>Decodes a binary peer without verification, use with care.</td></tr><tr><td valign="top"><a href="#encode-1">encode/1</a></td><td>Encodes the given peer into its binary form.</td></tr><tr><td valign="top"><a href="#encode_list-1">encode_list/1</a></td><td>Encodes a given list of peer into a binary form.</td></tr><tr><td valign="top"><a href="#from_map-2">from_map/2</a></td><td></td></tr><tr><td valign="top"><a href="#has_public_ip-1">has_public_ip/1</a></td><td>Returns whether the peer is listening on a public, externally
visible IP address.</td></tr><tr><td valign="top"><a href="#is_association-3">is_association/3</a></td><td>Checks whether a given peer has an association stored with the
given assocation type and key.</td></tr><tr><td valign="top"><a href="#is_blacklisted-2">is_blacklisted/2</a></td><td>Returns whether a given listen address is blacklisted.</td></tr><tr><td valign="top"><a href="#is_dialable-1">is_dialable/1</a></td><td>Returns whether the peer is dialable.</td></tr><tr><td valign="top"><a href="#is_similar-2">is_similar/2</a></td><td>Returns whether a given <code>Target</code> is mostly equal to an <code>Other</code>
peer.</td></tr><tr><td valign="top"><a href="#is_stale-2">is_stale/2</a></td><td>Returns whether a given peer is stale relative to a given
stale delta time in milliseconds.</td></tr><tr><td valign="top"><a href="#listen_addrs-1">listen_addrs/1</a></td><td>Gets the list of peer multiaddrs that the given peer is
listening on.</td></tr><tr><td valign="top"><a href="#metadata-1">metadata/1</a></td><td>Gets the metadata map from the given peer.</td></tr><tr><td valign="top"><a href="#metadata_get-3">metadata_get/3</a></td><td>Gets the value for a stored <code>Key</code> in metadata.</td></tr><tr><td valign="top"><a href="#metadata_put-3">metadata_put/3</a></td><td>Updates the metadata for a given peer with the given key/value
pair.</td></tr><tr><td valign="top"><a href="#metadata_set-2">metadata_set/2</a></td><td>Replaces the full metadata for a given peer.</td></tr><tr><td valign="top"><a href="#mk_association-3">mk_association/3</a></td><td>Make an association for a given peer key.</td></tr><tr><td valign="top"><a href="#nat_type-1">nat_type/1</a></td><td>Gets the NAT type of the given peer.</td></tr><tr><td valign="top"><a href="#network_id-1">network_id/1</a></td><td>Returns the declared network id for the peer, if any.</td></tr><tr><td valign="top"><a href="#network_id_allowable-2">network_id_allowable/2</a></td><td></td></tr><tr><td valign="top"><a href="#pubkey_bin-1">pubkey_bin/1</a></td><td>Gets the public key for the given peer.</td></tr><tr><td valign="top"><a href="#signed_metadata-1">signed_metadata/1</a></td><td>Gets the signed metadata of the given peer.</td></tr><tr><td valign="top"><a href="#signed_metadata_get-3">signed_metadata_get/3</a></td><td>Gets a key from the signed metadata of the given peer.</td></tr><tr><td valign="top"><a href="#supersedes-2">supersedes/2</a></td><td>Returns whether a given <code>Target</code> is more recent than <code>Other</code></td></tr><tr><td valign="top"><a href="#timestamp-1">timestamp/1</a></td><td>Gets the timestamp of the given peer.</td></tr><tr><td valign="top"><a href="#verify-1">verify/1</a></td><td>Cryptographically verifies a given peer and it's
associations.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="association_decode-2"></a>

### association_decode/2 ###

<pre><code>
association_decode(Bin::binary(), PeerPubKeyBin::<a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>) -&gt; <a href="#type-association">association()</a>
</code></pre>
<br />

Decodes the given binary to an association and verifies it
against the given peer key.

<a name="association_encode-1"></a>

### association_encode/1 ###

<pre><code>
association_encode(Msg::<a href="#type-association">association()</a>) -&gt; binary()
</code></pre>
<br />

Encodes the given association to it's binary form

<a name="association_pubkey_bin-1"></a>

### association_pubkey_bin/1 ###

<pre><code>
association_pubkey_bin(Libp2p_association_pb::<a href="#type-association">association()</a>) -&gt; <a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>
</code></pre>
<br />

Gets the address for the given association

<a name="association_pubkey_bins-1"></a>

### association_pubkey_bins/1 ###

<pre><code>
association_pubkey_bins(Libp2p_signed_peer_pb::<a href="#type-peer">peer()</a>) -&gt; [{AssocType::string(), [AssocPubKeyBin::<a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>]}]
</code></pre>
<br />

Returns a list of association keys. This can be used, for example, to
compare to peer assocation records with eachother (like in is_similar/2)

<a name="association_signature-1"></a>

### association_signature/1 ###

<pre><code>
association_signature(Libp2p_association_pb::<a href="#type-association">association()</a>) -&gt; binary()
</code></pre>
<br />

Gets the signature for the given association

<a name="association_verify-2"></a>

### association_verify/2 ###

<pre><code>
association_verify(Assoc::<a href="#type-association">association()</a>, PeerPubKeyBin::<a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>) -&gt; true
</code></pre>
<br />

Returns true if the association can be verified against the
given peer key. This has to be the same peer key that was
used to construct the signature in the assocation and should be the
key of the peer record containing the given association.

<a name="associations-1"></a>

### associations/1 ###

<pre><code>
associations(Libp2p_signed_peer_pb::<a href="#type-peer">peer()</a>) -&gt; <a href="#type-association_map">association_map()</a>
</code></pre>
<br />

Get the associations for this peer. This returns a keyed list
with the association type as the key and a list of assocations as
the value for that type.

<a name="associations_get-2"></a>

### associations_get/2 ###

<pre><code>
associations_get(Libp2p_signed_peer_pb::<a href="#type-peer">peer()</a>, AssocType::string()) -&gt; [<a href="#type-association">association()</a>]
</code></pre>
<br />

Gets the associations of the given `AssocType` for the given peer.

<a name="associations_put-4"></a>

### associations_put/4 ###

<pre><code>
associations_put(Peer::<a href="#type-peer">peer()</a>, AssocType::string(), Assoc::<a href="#type-association">association()</a>, PeerSigFun::<a href="libp2p_crypto.md#type-sig_fun">libp2p_crypto:sig_fun()</a>) -&gt; <a href="#type-peer">peer()</a>
</code></pre>
<br />

Adds or replaces a given assocation for the given type to the
peer. The returned peer is signed with the provided signing
function.

<a name="associations_set-4"></a>

### associations_set/4 ###

<pre><code>
associations_set(Libp2p_signed_peer_pb::<a href="#type-peer">peer()</a>, AssocType::string(), NewAssocs::[<a href="#type-association">association()</a>], PeerSigFun::<a href="libp2p_crypto.md#type-sig_fun">libp2p_crypto:sig_fun()</a>) -&gt; <a href="#type-peer">peer()</a>
</code></pre>
<br />

Replaces all associations for a given association type in the
given peer.

<a name="blacklist-1"></a>

### blacklist/1 ###

<pre><code>
blacklist(Libp2p_signed_peer_pb::<a href="#type-peer">peer()</a>) -&gt; [string()]
</code></pre>
<br />

Gets the blacklist for this peer. This is a metadata based
feature that enables listen addresses to be blacklisted so they
will not be connected to until that address is removed from the
blacklist.

<a name="blacklist_add-2"></a>

### blacklist_add/2 ###

`blacklist_add(Peer, ListenAddr) -> any()`

Add a given listen address to the blacklist for the given
peer.

<a name="blacklist_set-2"></a>

### blacklist_set/2 ###

<pre><code>
blacklist_set(Peer::<a href="#type-peer">peer()</a>, BlackList::[string()]) -&gt; <a href="#type-peer">peer()</a>
</code></pre>
<br />

Sets the blacklist for a given peer. Note that currently no
validation is done against the existing listen addresses stored in
the peer. Blacklisting an address that the peer is not listening to
will have no effect anyway.

<a name="cleared_listen_addrs-1"></a>

### cleared_listen_addrs/1 ###

<pre><code>
cleared_listen_addrs(Peer::<a href="#type-peer">peer()</a>) -&gt; [string()]
</code></pre>
<br />

Returns the listen addrs for this peer filtered using the
blacklist for the peer, if one is present. This is just a
convenience function to clear the listen adddresses for a peer
with the blacklist stored in metadata.

<a name="connected_peers-1"></a>

### connected_peers/1 ###

<pre><code>
connected_peers(Libp2p_signed_peer_pb::<a href="#type-peer">peer()</a>) -&gt; [<a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>]
</code></pre>
<br />

Gets the list of peer crypto addresses that the given peer was last
known to be connected to.

<a name="decode-1"></a>

### decode/1 ###

<pre><code>
decode(Bin::binary()) -&gt; <a href="#type-peer">peer()</a>
</code></pre>
<br />

Decodes a given binary into a peer.

<a name="decode_list-1"></a>

### decode_list/1 ###

<pre><code>
decode_list(Bin::binary()) -&gt; [<a href="#type-peer">peer()</a>]
</code></pre>
<br />

Decodes a given binary into a list of peers.

<a name="decode_unsafe-1"></a>

### decode_unsafe/1 ###

<pre><code>
decode_unsafe(Bin::binary()) -&gt; <a href="#type-peer">peer()</a>
</code></pre>
<br />

Decodes a binary peer without verification, use with care.

<a name="encode-1"></a>

### encode/1 ###

<pre><code>
encode(Msg::<a href="#type-peer">peer()</a>) -&gt; binary()
</code></pre>
<br />

Encodes the given peer into its binary form.

<a name="encode_list-1"></a>

### encode_list/1 ###

<pre><code>
encode_list(List::[<a href="#type-peer">peer()</a>]) -&gt; binary()
</code></pre>
<br />

Encodes a given list of peer into a binary form. Since
encoding lists is primarily used for gossipping peers around, this
strips metadata from the peers as part of encoding.

<a name="from_map-2"></a>

### from_map/2 ###

<pre><code>
from_map(Map::<a href="#type-peer_map">peer_map()</a>, SigFun::fun((binary()) -&gt; binary())) -&gt; <a href="#type-peer">peer()</a>
</code></pre>
<br />

<a name="has_public_ip-1"></a>

### has_public_ip/1 ###

<pre><code>
has_public_ip(Peer::<a href="#type-peer">peer()</a>) -&gt; boolean()
</code></pre>
<br />

Returns whether the peer is listening on a public, externally
visible IP address.

<a name="is_association-3"></a>

### is_association/3 ###

<pre><code>
is_association(Peer::<a href="#type-peer">peer()</a>, AssocType::string(), AssocPubKeyBin::<a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>) -&gt; boolean()
</code></pre>
<br />

Checks whether a given peer has an association stored with the
given assocation type and key

<a name="is_blacklisted-2"></a>

### is_blacklisted/2 ###

<pre><code>
is_blacklisted(Peer::<a href="#type-peer">peer()</a>, ListenAddr::string()) -&gt; boolean()
</code></pre>
<br />

Returns whether a given listen address is blacklisted. Note
that a blacklisted address may not actually appear in the
listen_addrs for this peer.

<a name="is_dialable-1"></a>

### is_dialable/1 ###

`is_dialable(Peer) -> any()`

Returns whether the peer is dialable. A peer is dialable if it
has a public IP address or it is reachable via a relay address.

<a name="is_similar-2"></a>

### is_similar/2 ###

<pre><code>
is_similar(Target::<a href="#type-peer">peer()</a>, Other::<a href="#type-peer">peer()</a>) -&gt; boolean()
</code></pre>
<br />

Returns whether a given `Target` is mostly equal to an `Other`
peer. Similarity means equality for all fields, except for the
timestamp of the peers.

<a name="is_stale-2"></a>

### is_stale/2 ###

<pre><code>
is_stale(Libp2p_signed_peer_pb::<a href="#type-peer">peer()</a>, StaleMS::integer()) -&gt; boolean()
</code></pre>
<br />

Returns whether a given peer is stale relative to a given
stale delta time in milliseconds.

<a name="listen_addrs-1"></a>

### listen_addrs/1 ###

<pre><code>
listen_addrs(Libp2p_signed_peer_pb::<a href="#type-peer">peer()</a>) -&gt; [string()]
</code></pre>
<br />

Gets the list of peer multiaddrs that the given peer is
listening on.

<a name="metadata-1"></a>

### metadata/1 ###

<pre><code>
metadata(Libp2p_signed_peer_pb::<a href="#type-peer">peer()</a>) -&gt; <a href="#type-metadata">metadata()</a>
</code></pre>
<br />

Gets the metadata map from the given peer. The metadata for a
peer is `NOT` part of the signed peer since it can be read and
updated by anyone to annotate the given peer with extra information

<a name="metadata_get-3"></a>

### metadata_get/3 ###

<pre><code>
metadata_get(Peer::<a href="#type-peer">peer()</a>, Key::string(), Default::binary()) -&gt; binary()
</code></pre>
<br />

Gets the value for a stored `Key` in metadata. If not found,
the `Default` is returned.

<a name="metadata_put-3"></a>

### metadata_put/3 ###

<pre><code>
metadata_put(Peer::<a href="#type-peer">peer()</a>, Key::string(), Value::binary()) -&gt; <a href="#type-peer">peer()</a>
</code></pre>
<br />

Updates the metadata for a given peer with the given key/value
pair. The `Key` is expected to be a string, while `Value` is
expected to be a binary.

<a name="metadata_set-2"></a>

### metadata_set/2 ###

<pre><code>
metadata_set(Peer::<a href="#type-peer">peer()</a>, Metadata::<a href="#type-metadata">metadata()</a>) -&gt; <a href="#type-peer">peer()</a>
</code></pre>
<br />

Replaces the full metadata for a given peer

<a name="mk_association-3"></a>

### mk_association/3 ###

<pre><code>
mk_association(AssocPubKeyBin::<a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>, PeerPubKeyBin::<a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>, AssocSigFun::<a href="libp2p_crypto.md#type-sig_fun">libp2p_crypto:sig_fun()</a>) -&gt; <a href="#type-association">association()</a>
</code></pre>
<br />

Make an association for a given peer key. The returned
association contains the given assocation key and the given
peer key signed with the passed in association provided
signature function.

<a name="nat_type-1"></a>

### nat_type/1 ###

<pre><code>
nat_type(Libp2p_signed_peer_pb::<a href="#type-peer">peer()</a>) -&gt; <a href="#type-nat_type">nat_type()</a>
</code></pre>
<br />

Gets the NAT type of the given peer.

<a name="network_id-1"></a>

### network_id/1 ###

<pre><code>
network_id(Libp2p_signed_peer_pb::<a href="#type-peer">peer()</a>) -&gt; binary() | undefined
</code></pre>
<br />

Returns the declared network id for the peer, if any

<a name="network_id_allowable-2"></a>

### network_id_allowable/2 ###

`network_id_allowable(Peer, MyNetworkID) -> any()`

<a name="pubkey_bin-1"></a>

### pubkey_bin/1 ###

<pre><code>
pubkey_bin(Libp2p_signed_peer_pb::<a href="#type-peer">peer()</a>) -&gt; <a href="libp2p_crypto.md#type-pubkey_bin">libp2p_crypto:pubkey_bin()</a>
</code></pre>
<br />

Gets the public key for the given peer.

<a name="signed_metadata-1"></a>

### signed_metadata/1 ###

<pre><code>
signed_metadata(Libp2p_signed_peer_pb::<a href="#type-peer">peer()</a>) -&gt; map()
</code></pre>
<br />

Gets the signed metadata of the given peer

<a name="signed_metadata_get-3"></a>

### signed_metadata_get/3 ###

<pre><code>
signed_metadata_get(Peer::<a href="#type-peer">peer()</a>, Key::any(), Default::any()) -&gt; any()
</code></pre>
<br />

Gets a key from the signed metadata of the given peer

<a name="supersedes-2"></a>

### supersedes/2 ###

<pre><code>
supersedes(Target::<a href="#type-peer">peer()</a>, Other::<a href="#type-peer">peer()</a>) -&gt; boolean()
</code></pre>
<br />

Returns whether a given `Target` is more recent than `Other`

<a name="timestamp-1"></a>

### timestamp/1 ###

<pre><code>
timestamp(Libp2p_signed_peer_pb::<a href="#type-peer">peer()</a>) -&gt; integer()
</code></pre>
<br />

Gets the timestamp of the given peer.

<a name="verify-1"></a>

### verify/1 ###

<pre><code>
verify(Msg::<a href="#type-peer">peer()</a>) -&gt; true
</code></pre>
<br />

Cryptographically verifies a given peer and it's
associations. Returns true if the given peer can be verified or
throws an error if the peer or one of it's associations can't be
verified

