circuit Arbiter :
  module Arbiter :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip request : UInt<10>, grant : UInt<1>[10]}

    node _io_grant_0_T = bits(io.request, 0, 0) @[Arbiter.scala 11:30]
    io.grant[0] <= _io_grant_0_T @[Arbiter.scala 11:17]
    node _io_grant_1_T = bits(io.request, 1, 1) @[Arbiter.scala 14:34]
    node _io_grant_1_T_1 = and(_io_grant_1_T, io.grant[0]) @[Arbiter.scala 14:38]
    io.grant[1] <= _io_grant_1_T_1 @[Arbiter.scala 14:21]
    node _io_grant_2_T = bits(io.request, 2, 2) @[Arbiter.scala 14:34]
    node _io_grant_2_T_1 = and(_io_grant_2_T, io.grant[1]) @[Arbiter.scala 14:38]
    io.grant[2] <= _io_grant_2_T_1 @[Arbiter.scala 14:21]
    node _io_grant_3_T = bits(io.request, 3, 3) @[Arbiter.scala 14:34]
    node _io_grant_3_T_1 = and(_io_grant_3_T, io.grant[2]) @[Arbiter.scala 14:38]
    io.grant[3] <= _io_grant_3_T_1 @[Arbiter.scala 14:21]
    node _io_grant_4_T = bits(io.request, 4, 4) @[Arbiter.scala 14:34]
    node _io_grant_4_T_1 = and(_io_grant_4_T, io.grant[3]) @[Arbiter.scala 14:38]
    io.grant[4] <= _io_grant_4_T_1 @[Arbiter.scala 14:21]
    node _io_grant_5_T = bits(io.request, 5, 5) @[Arbiter.scala 14:34]
    node _io_grant_5_T_1 = and(_io_grant_5_T, io.grant[4]) @[Arbiter.scala 14:38]
    io.grant[5] <= _io_grant_5_T_1 @[Arbiter.scala 14:21]
    node _io_grant_6_T = bits(io.request, 6, 6) @[Arbiter.scala 14:34]
    node _io_grant_6_T_1 = and(_io_grant_6_T, io.grant[5]) @[Arbiter.scala 14:38]
    io.grant[6] <= _io_grant_6_T_1 @[Arbiter.scala 14:21]
    node _io_grant_7_T = bits(io.request, 7, 7) @[Arbiter.scala 14:34]
    node _io_grant_7_T_1 = and(_io_grant_7_T, io.grant[6]) @[Arbiter.scala 14:38]
    io.grant[7] <= _io_grant_7_T_1 @[Arbiter.scala 14:21]
    node _io_grant_8_T = bits(io.request, 8, 8) @[Arbiter.scala 14:34]
    node _io_grant_8_T_1 = and(_io_grant_8_T, io.grant[7]) @[Arbiter.scala 14:38]
    io.grant[8] <= _io_grant_8_T_1 @[Arbiter.scala 14:21]
    node _io_grant_9_T = bits(io.request, 9, 9) @[Arbiter.scala 14:34]
    node _io_grant_9_T_1 = and(_io_grant_9_T, io.grant[8]) @[Arbiter.scala 14:38]
    io.grant[9] <= _io_grant_9_T_1 @[Arbiter.scala 14:21]

