circuit Encoder :
  module Encoder :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<16>, out : UInt<4>}

    wire vec : UInt<4>[16] @[Encoder.scala 11:19]
    vec[0] <= UInt<1>("h0") @[Encoder.scala 13:12]
    node _vec_1_T = bits(io.in, 1, 1) @[Encoder.scala 15:28]
    node _vec_1_T_1 = mux(_vec_1_T, UInt<1>("h1"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_1_T_2 = or(_vec_1_T_1, vec[0]) @[Encoder.scala 15:41]
    vec[1] <= _vec_1_T_2 @[Encoder.scala 15:16]
    node _vec_2_T = bits(io.in, 2, 2) @[Encoder.scala 15:28]
    node _vec_2_T_1 = mux(_vec_2_T, UInt<2>("h2"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_2_T_2 = or(_vec_2_T_1, vec[1]) @[Encoder.scala 15:41]
    vec[2] <= _vec_2_T_2 @[Encoder.scala 15:16]
    node _vec_3_T = bits(io.in, 3, 3) @[Encoder.scala 15:28]
    node _vec_3_T_1 = mux(_vec_3_T, UInt<2>("h3"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_3_T_2 = or(_vec_3_T_1, vec[2]) @[Encoder.scala 15:41]
    vec[3] <= _vec_3_T_2 @[Encoder.scala 15:16]
    node _vec_4_T = bits(io.in, 4, 4) @[Encoder.scala 15:28]
    node _vec_4_T_1 = mux(_vec_4_T, UInt<3>("h4"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_4_T_2 = or(_vec_4_T_1, vec[3]) @[Encoder.scala 15:41]
    vec[4] <= _vec_4_T_2 @[Encoder.scala 15:16]
    node _vec_5_T = bits(io.in, 5, 5) @[Encoder.scala 15:28]
    node _vec_5_T_1 = mux(_vec_5_T, UInt<3>("h5"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_5_T_2 = or(_vec_5_T_1, vec[4]) @[Encoder.scala 15:41]
    vec[5] <= _vec_5_T_2 @[Encoder.scala 15:16]
    node _vec_6_T = bits(io.in, 6, 6) @[Encoder.scala 15:28]
    node _vec_6_T_1 = mux(_vec_6_T, UInt<3>("h6"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_6_T_2 = or(_vec_6_T_1, vec[5]) @[Encoder.scala 15:41]
    vec[6] <= _vec_6_T_2 @[Encoder.scala 15:16]
    node _vec_7_T = bits(io.in, 7, 7) @[Encoder.scala 15:28]
    node _vec_7_T_1 = mux(_vec_7_T, UInt<3>("h7"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_7_T_2 = or(_vec_7_T_1, vec[6]) @[Encoder.scala 15:41]
    vec[7] <= _vec_7_T_2 @[Encoder.scala 15:16]
    node _vec_8_T = bits(io.in, 8, 8) @[Encoder.scala 15:28]
    node _vec_8_T_1 = mux(_vec_8_T, UInt<4>("h8"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_8_T_2 = or(_vec_8_T_1, vec[7]) @[Encoder.scala 15:41]
    vec[8] <= _vec_8_T_2 @[Encoder.scala 15:16]
    node _vec_9_T = bits(io.in, 9, 9) @[Encoder.scala 15:28]
    node _vec_9_T_1 = mux(_vec_9_T, UInt<4>("h9"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_9_T_2 = or(_vec_9_T_1, vec[8]) @[Encoder.scala 15:41]
    vec[9] <= _vec_9_T_2 @[Encoder.scala 15:16]
    node _vec_10_T = bits(io.in, 10, 10) @[Encoder.scala 15:28]
    node _vec_10_T_1 = mux(_vec_10_T, UInt<4>("ha"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_10_T_2 = or(_vec_10_T_1, vec[9]) @[Encoder.scala 15:41]
    vec[10] <= _vec_10_T_2 @[Encoder.scala 15:16]
    node _vec_11_T = bits(io.in, 11, 11) @[Encoder.scala 15:28]
    node _vec_11_T_1 = mux(_vec_11_T, UInt<4>("hb"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_11_T_2 = or(_vec_11_T_1, vec[10]) @[Encoder.scala 15:41]
    vec[11] <= _vec_11_T_2 @[Encoder.scala 15:16]
    node _vec_12_T = bits(io.in, 12, 12) @[Encoder.scala 15:28]
    node _vec_12_T_1 = mux(_vec_12_T, UInt<4>("hc"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_12_T_2 = or(_vec_12_T_1, vec[11]) @[Encoder.scala 15:41]
    vec[12] <= _vec_12_T_2 @[Encoder.scala 15:16]
    node _vec_13_T = bits(io.in, 13, 13) @[Encoder.scala 15:28]
    node _vec_13_T_1 = mux(_vec_13_T, UInt<4>("hd"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_13_T_2 = or(_vec_13_T_1, vec[12]) @[Encoder.scala 15:41]
    vec[13] <= _vec_13_T_2 @[Encoder.scala 15:16]
    node _vec_14_T = bits(io.in, 14, 14) @[Encoder.scala 15:28]
    node _vec_14_T_1 = mux(_vec_14_T, UInt<4>("he"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_14_T_2 = or(_vec_14_T_1, vec[13]) @[Encoder.scala 15:41]
    vec[14] <= _vec_14_T_2 @[Encoder.scala 15:16]
    node _vec_15_T = bits(io.in, 15, 15) @[Encoder.scala 15:28]
    node _vec_15_T_1 = mux(_vec_15_T, UInt<4>("hf"), UInt<1>("h0")) @[Encoder.scala 15:22]
    node _vec_15_T_2 = or(_vec_15_T_1, vec[14]) @[Encoder.scala 15:41]
    vec[15] <= _vec_15_T_2 @[Encoder.scala 15:16]
    io.out <= vec[15] @[Encoder.scala 18:12]

