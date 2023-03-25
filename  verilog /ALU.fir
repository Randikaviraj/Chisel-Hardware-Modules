circuit ALU :
  module ALU :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip data1 : UInt<16>, flip data2 : UInt<16>, flip select : UInt<2>, out : UInt<16>}

    io.out <= UInt<1>("h0") @[ALU.scala 14:12]
    node _T = eq(UInt<1>("h0"), io.select) @[ALU.scala 16:22]
    when _T : @[ALU.scala 16:22]
      node _io_out_T = add(io.data1, io.data2) @[ALU.scala 18:32]
      node _io_out_T_1 = tail(_io_out_T, 1) @[ALU.scala 18:32]
      io.out <= _io_out_T_1 @[ALU.scala 18:20]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.select) @[ALU.scala 16:22]
      when _T_1 : @[ALU.scala 16:22]
        node _io_out_T_2 = sub(io.data1, io.data2) @[ALU.scala 21:32]
        node _io_out_T_3 = tail(_io_out_T_2, 1) @[ALU.scala 21:32]
        io.out <= _io_out_T_3 @[ALU.scala 21:20]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.select) @[ALU.scala 16:22]
        when _T_2 : @[ALU.scala 16:22]
          node _io_out_T_4 = and(io.data1, io.data2) @[ALU.scala 24:32]
          io.out <= _io_out_T_4 @[ALU.scala 24:20]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.select) @[ALU.scala 16:22]
          when _T_3 : @[ALU.scala 16:22]
            node _io_out_T_5 = or(io.data1, io.data2) @[ALU.scala 27:32]
            io.out <= _io_out_T_5 @[ALU.scala 27:20]

