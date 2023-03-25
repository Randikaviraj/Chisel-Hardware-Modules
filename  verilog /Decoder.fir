circuit Decoder :
  module Decoder :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<2>, out : UInt<4>}

    io.out <= UInt<1>("h0") @[Decoder.scala 12:12]
    node _T = eq(UInt<1>("h0"), io.in) @[Decoder.scala 13:18]
    when _T : @[Decoder.scala 13:18]
      io.out <= UInt<1>("h1") @[Decoder.scala 15:20]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.in) @[Decoder.scala 13:18]
      when _T_1 : @[Decoder.scala 13:18]
        io.out <= UInt<2>("h2") @[Decoder.scala 18:20]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.in) @[Decoder.scala 13:18]
        when _T_2 : @[Decoder.scala 13:18]
          io.out <= UInt<3>("h4") @[Decoder.scala 21:20]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.in) @[Decoder.scala 13:18]
          when _T_3 : @[Decoder.scala 13:18]
            io.out <= UInt<4>("h8") @[Decoder.scala 24:20]

