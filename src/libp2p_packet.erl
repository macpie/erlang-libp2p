-module(libp2p_packet).

-type spec_type() :: u8 | u16 |  u16le | u32 |  u32le | varint.
-type spec() :: [spec_type()].

-export_type([spec/0, spec_type/0]).

-export([decode_header/2,
         spec_size/1,
         decode_packet/2]).

-spec decode_header(spec(), binary()) ->
                           {ok, Header::binary(), PacketSize::non_neg_integer(), Tail::binary()}
                               | {more, Expected::pos_integer()}.
decode_header(Spec, Bin) ->
    decode_header(Spec, Bin, <<>>, 0).

-spec decode_packet(spec(), binary()) -> {ok, Header::binary(), Data::binary(), Tail::binary()}
                                                    | {more, Expected::pos_integer()}.
decode_packet(Spec, Bin) ->
    case decode_header(Spec, Bin) of
        {ok, Header, PacketSize, Tail} when PacketSize =< byte_size(Tail) ->
            <<Packet:PacketSize/binary, Rest/binary>> = Tail,
            {ok, Header, Packet, Rest};
        {ok, _, PacketSize, Tail} ->
            {more, PacketSize - byte_size(Tail)};
        {more, N} ->
            {more, N}
    end.

decode_header([], Bin, Acc, PacketSize) ->
    {ok, Acc, PacketSize, Bin};
decode_header([u8 | Tail], <<V:8/unsigned-integer, Rest/binary>>, Acc, _) ->
    decode_header(Tail, Rest, <<Acc/binary, V:8/unsigned-integer>>, V);
decode_header([u16 | Tail], <<V:16/unsigned-integer-big, Rest/binary>>, Acc, _) ->
    decode_header(Tail, Rest, <<Acc/binary, V:16/unsigned-integer-big>>, V);
decode_header([u16le | Tail], <<V:16/unsigned-integer-little, Rest/binary>>, Acc, _) ->
    decode_header(Tail, Rest, <<Acc/binary, V:16/unsigned-integer-little>>, V);
decode_header([u32 | Tail], <<V:32/unsigned-integer-big, Rest/binary>>, Acc, _) ->
    decode_header(Tail, Rest, <<Acc/binary, V:32/unsigned-integer-big>>, V);
decode_header([u32le | Tail], <<V:32/unsigned-integer-little, Rest/binary>>, Acc, _) ->
    decode_header(Tail, Rest, <<Acc/binary, V:32/unsigned-integer-little>>, V);
decode_header(Spec=[varint | Tail], Bin, Acc, _) ->
    case decode_varint(Bin, 0, 0) of
        {more, Used} -> {more, Used + spec_size(Spec)};
        {V, Rest} ->
            VSize = byte_size(Bin) - byte_size(Rest),
            <<BinV:VSize/binary, _/binary>> = Bin,
            decode_header(Tail, Rest, <<Acc/binary, BinV/binary>>, V)
    end;
decode_header(Spec, Bin, _, _) ->
    SpecSize = spec_size(Spec, 0),
    {more, SpecSize - byte_size(Bin)}.


-spec spec_size(spec()) -> MinSize::non_neg_integer().
spec_size(Spec) ->
    spec_size(Spec, 0).

-spec spec_size(spec(), Acc::non_neg_integer()) -> MinSize::non_neg_integer().
spec_size([], Acc) ->
    Acc;
spec_size([u8 | Tail], Acc) ->
    spec_size(Tail, Acc + 1);
spec_size([u16 | Tail], Acc) ->
    spec_size(Tail, Acc + 2);
spec_size([u16le | Tail], Acc) ->
    spec_size(Tail, Acc + 2);
spec_size([u32 | Tail], Acc) ->
    spec_size(Tail, Acc + 4);
spec_size([u32le | Tail], Acc) ->
    spec_size(Tail, Acc + 4);
spec_size([varint | Tail], Acc) ->
    spec_size(Tail, Acc + 1).

-spec decode_varint(binary(), non_neg_integer(), non_neg_integer())
                   -> {non_neg_integer(), Rest::binary()} | {more, Used::non_neg_integer()}.
decode_varint(<<1:1, Number:7, Rest/binary>>, Position, Acc) ->
    decode_varint(Rest, Position + 7, (Number bsl Position) + Acc);
decode_varint(<<0:1, Number:7, Rest/binary>>, Position, Acc) ->
    {(Number bsl Position) + Acc, Rest};
decode_varint(<<>>, Position, _) ->
    {more, Position div 7}.