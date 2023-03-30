circuit MinimumSearch :
  module MinimumSearch :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<8>[10], out : UInt<8>}

    node _minim_T = lt(io.in[6], io.in[7]) @[MinimumSearch.scala 14:59]
    node _minim_T_1 = mux(_minim_T, io.in[6], io.in[7]) @[MinimumSearch.scala 14:52]
    node _minim_T_2 = lt(io.in[8], io.in[9]) @[MinimumSearch.scala 14:59]
    node _minim_T_3 = mux(_minim_T_2, io.in[8], io.in[9]) @[MinimumSearch.scala 14:52]
    node _minim_T_4 = lt(io.in[0], io.in[1]) @[MinimumSearch.scala 14:59]
    node _minim_T_5 = mux(_minim_T_4, io.in[0], io.in[1]) @[MinimumSearch.scala 14:52]
    node _minim_T_6 = lt(io.in[2], io.in[3]) @[MinimumSearch.scala 14:59]
    node _minim_T_7 = mux(_minim_T_6, io.in[2], io.in[3]) @[MinimumSearch.scala 14:52]
    node _minim_T_8 = lt(io.in[4], io.in[5]) @[MinimumSearch.scala 14:59]
    node _minim_T_9 = mux(_minim_T_8, io.in[4], io.in[5]) @[MinimumSearch.scala 14:52]
    node _minim_T_10 = lt(_minim_T_1, _minim_T_3) @[MinimumSearch.scala 14:59]
    node _minim_T_11 = mux(_minim_T_10, _minim_T_1, _minim_T_3) @[MinimumSearch.scala 14:52]
    node _minim_T_12 = lt(_minim_T_5, _minim_T_7) @[MinimumSearch.scala 14:59]
    node _minim_T_13 = mux(_minim_T_12, _minim_T_5, _minim_T_7) @[MinimumSearch.scala 14:52]
    node _minim_T_14 = lt(_minim_T_9, _minim_T_11) @[MinimumSearch.scala 14:59]
    node _minim_T_15 = mux(_minim_T_14, _minim_T_9, _minim_T_11) @[MinimumSearch.scala 14:52]
    node _minim_T_16 = lt(_minim_T_13, _minim_T_15) @[MinimumSearch.scala 14:59]
    node minim = mux(_minim_T_16, _minim_T_13, _minim_T_15) @[MinimumSearch.scala 14:52]
    io.out <= minim @[MinimumSearch.scala 15:12]

