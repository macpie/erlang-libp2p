

# Module libp2p_lager_metadata #
* [Data Types](#types)
* [Function Index](#index)
* [Function Details](#functions)

<a name="types"></a>

## Data Types ##




### <a name="type-md_type">md_type()</a> ###


<pre><code>
md_type() = pid | application | module | function | line | target | path | string | index | kind | group_id | session_local | session_remote
</code></pre>

<a name="index"></a>

## Function Index ##


<table width="100%" border="1" cellspacing="0" cellpadding="2" summary="function index"><tr><td valign="top"><a href="#from_strings-1">from_strings/1</a></td><td></td></tr><tr><td valign="top"><a href="#types-0">types/0</a></td><td></td></tr><tr><td valign="top"><a href="#update-1">update/1</a></td><td></td></tr></table>


<a name="functions"></a>

## Function Details ##

<a name="from_strings-1"></a>

### from_strings/1 ###

<pre><code>
from_strings(StrMD::[{string(), string()}]) -&gt; [{atom(), any()}]
</code></pre>
<br />

<a name="types-0"></a>

### types/0 ###

<pre><code>
types() -&gt; #{<a href="#type-md_type">md_type()</a> =&gt; <a href="cuttlefish_datatypes.md#type-datatype">cuttlefish_datatypes:datatype()</a>}
</code></pre>
<br />

<a name="update-1"></a>

### update/1 ###

<pre><code>
update(MD::[{<a href="#type-md_type">md_type()</a>, any()}]) -&gt; ok
</code></pre>
<br />

