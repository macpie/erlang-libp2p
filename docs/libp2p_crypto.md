

# Module libp2p_crypto #
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

<a name="types"></a>

## Data Types ##




### <a name="type-ecdh_fun">ecdh_fun()</a> ###


<pre><code>
ecdh_fun() = fun((<a href="#type-pubkey">pubkey()</a>) -&gt; binary())
</code></pre>




### <a name="type-enacl_privkey">enacl_privkey()</a> ###


<pre><code>
enacl_privkey() = &lt;&lt;_:256&gt;&gt;
</code></pre>




### <a name="type-enacl_pubkey">enacl_pubkey()</a> ###


<pre><code>
enacl_pubkey() = &lt;&lt;_:256&gt;&gt;
</code></pre>




### <a name="type-key_map">key_map()</a> ###


<pre><code>
key_map() = #{secret =&gt; <a href="#type-privkey">privkey()</a>, public =&gt; <a href="#type-pubkey">pubkey()</a>}
</code></pre>




### <a name="type-key_type">key_type()</a> ###


<pre><code>
key_type() = ecc_compact | ed25519
</code></pre>




### <a name="type-privkey">privkey()</a> ###


<pre><code>
privkey() = {ecc_compact, <a href="ecc_compact.md#type-private_key">ecc_compact:private_key()</a>} | {ed25519, <a href="#type-enacl_privkey">enacl_privkey()</a>}
</code></pre>




### <a name="type-pubkey">pubkey()</a> ###


<pre><code>
pubkey() = {ecc_compact, <a href="ecc_compact.md#type-public_key">ecc_compact:public_key()</a>} | {ed25519, <a href="#type-enacl_pubkey">enacl_pubkey()</a>}
</code></pre>




### <a name="type-pubkey_bin">pubkey_bin()</a> ###


<pre><code>
pubkey_bin() = &lt;&lt;_:8, _:_*8&gt;&gt;
</code></pre>




### <a name="type-sig_fun">sig_fun()</a> ###


<pre><code>
sig_fun() = fun((binary()) -&gt; binary())
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#b58_to_bin-1">b58_to_bin/1</a></td><td></td></tr><tr><td valign="top"><a href="#b58_to_pubkey-1">b58_to_pubkey/1</a></td><td></td></tr><tr><td valign="top"><a href="#b58_to_version_bin-1">b58_to_version_bin/1</a></td><td></td></tr><tr><td valign="top"><a href="#bin_to_b58-1">bin_to_b58/1</a></td><td></td></tr><tr><td valign="top"><a href="#bin_to_b58-2">bin_to_b58/2</a></td><td></td></tr><tr><td valign="top"><a href="#bin_to_pubkey-1">bin_to_pubkey/1</a></td><td></td></tr><tr><td valign="top"><a href="#generate_keys-1">generate_keys/1</a></td><td>Generate keys suitable for a swarm.</td></tr><tr><td valign="top"><a href="#keys_from_bin-1">keys_from_bin/1</a></td><td></td></tr><tr><td valign="top"><a href="#keys_to_bin-1">keys_to_bin/1</a></td><td></td></tr><tr><td valign="top"><a href="#load_keys-1">load_keys/1</a></td><td>Load the private key from a pem encoded given filename.</td></tr><tr><td valign="top"><a href="#mk_ecdh_fun-1">mk_ecdh_fun/1</a></td><td></td></tr><tr><td valign="top"><a href="#mk_sig_fun-1">mk_sig_fun/1</a></td><td></td></tr><tr><td valign="top"><a href="#p2p_to_pubkey_bin-1">p2p_to_pubkey_bin/1</a></td><td></td></tr><tr><td valign="top"><a href="#pubkey_bin_to_p2p-1">pubkey_bin_to_p2p/1</a></td><td></td></tr><tr><td valign="top"><a href="#pubkey_to_b58-1">pubkey_to_b58/1</a></td><td></td></tr><tr><td valign="top"><a href="#pubkey_to_bin-1">pubkey_to_bin/1</a></td><td></td></tr><tr><td valign="top"><a href="#save_keys-2">save_keys/2</a></td><td>Store the given keys in a file.</td></tr><tr><td valign="top"><a href="#verify-3">verify/3</a></td><td>Verifies a digital signature, using sha256.</td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="b58_to_bin-1"></a>

### b58_to_bin/1 ###

<pre><code>
b58_to_bin(Str::string()) -&gt; binary()
</code></pre>
<br />

<a name="b58_to_pubkey-1"></a>

### b58_to_pubkey/1 ###

<pre><code>
b58_to_pubkey(Str::string()) -&gt; <a href="#type-pubkey">pubkey()</a>
</code></pre>
<br />

<a name="b58_to_version_bin-1"></a>

### b58_to_version_bin/1 ###

<pre><code>
b58_to_version_bin(Str::string()) -&gt; {Version::non_neg_integer(), binary()}
</code></pre>
<br />

<a name="bin_to_b58-1"></a>

### bin_to_b58/1 ###

<pre><code>
bin_to_b58(Bin::binary()) -&gt; string()
</code></pre>
<br />

<a name="bin_to_b58-2"></a>

### bin_to_b58/2 ###

<pre><code>
bin_to_b58(Version::non_neg_integer(), Bin::binary()) -&gt; string()
</code></pre>
<br />

<a name="bin_to_pubkey-1"></a>

### bin_to_pubkey/1 ###

<pre><code>
bin_to_pubkey(X1::<a href="#type-pubkey_bin">pubkey_bin()</a>) -&gt; <a href="#type-pubkey">pubkey()</a>
</code></pre>
<br />

<a name="generate_keys-1"></a>

### generate_keys/1 ###

<pre><code>
generate_keys(X1::<a href="#type-key_type">key_type()</a>) -&gt; <a href="#type-key_map">key_map()</a>
</code></pre>
<br />

Generate keys suitable for a swarm.  The returned private and
public key has the attribute that the public key is a compressable
public key.

<a name="keys_from_bin-1"></a>

### keys_from_bin/1 ###

<pre><code>
keys_from_bin(X1::binary()) -&gt; <a href="#type-key_map">key_map()</a>
</code></pre>
<br />

<a name="keys_to_bin-1"></a>

### keys_to_bin/1 ###

<pre><code>
keys_to_bin(X1::<a href="#type-key_map">key_map()</a>) -&gt; binary()
</code></pre>
<br />

<a name="load_keys-1"></a>

### load_keys/1 ###

<pre><code>
load_keys(FileName::string()) -&gt; {ok, <a href="#type-key_map">key_map()</a>} | {error, term()}
</code></pre>
<br />

Load the private key from a pem encoded given filename.
Returns the private and extracted public key stored in the file or
an error if any occorred.

<a name="mk_ecdh_fun-1"></a>

### mk_ecdh_fun/1 ###

<pre><code>
mk_ecdh_fun(X1::<a href="#type-privkey">privkey()</a>) -&gt; <a href="#type-ecdh_fun">ecdh_fun()</a>
</code></pre>
<br />

<a name="mk_sig_fun-1"></a>

### mk_sig_fun/1 ###

<pre><code>
mk_sig_fun(X1::<a href="#type-privkey">privkey()</a>) -&gt; <a href="#type-sig_fun">sig_fun()</a>
</code></pre>
<br />

<a name="p2p_to_pubkey_bin-1"></a>

### p2p_to_pubkey_bin/1 ###

<pre><code>
p2p_to_pubkey_bin(Str::string()) -&gt; <a href="#type-pubkey_bin">pubkey_bin()</a>
</code></pre>
<br />

<a name="pubkey_bin_to_p2p-1"></a>

### pubkey_bin_to_p2p/1 ###

<pre><code>
pubkey_bin_to_p2p(PubKey::<a href="#type-pubkey_bin">pubkey_bin()</a>) -&gt; string()
</code></pre>
<br />

<a name="pubkey_to_b58-1"></a>

### pubkey_to_b58/1 ###

<pre><code>
pubkey_to_b58(PubKey::<a href="#type-pubkey">pubkey()</a>) -&gt; string()
</code></pre>
<br />

<a name="pubkey_to_bin-1"></a>

### pubkey_to_bin/1 ###

<pre><code>
pubkey_to_bin(X1::<a href="#type-pubkey">pubkey()</a>) -&gt; <a href="#type-pubkey_bin">pubkey_bin()</a>
</code></pre>
<br />

<a name="save_keys-2"></a>

### save_keys/2 ###

<pre><code>
save_keys(KeysMap::<a href="#type-key_map">key_map()</a>, FileName::string()) -&gt; ok | {error, term()}
</code></pre>
<br />

Store the given keys in a file.  See @see key_folder/1 for a
utility function that returns a name and location for the keys that
are relative to the swarm data folder.

<a name="verify-3"></a>

### verify/3 ###

<pre><code>
verify(Bin::binary(), Signature::binary(), X3::<a href="#type-pubkey">pubkey()</a>) -&gt; boolean()
</code></pre>
<br />

Verifies a digital signature, using sha256.

