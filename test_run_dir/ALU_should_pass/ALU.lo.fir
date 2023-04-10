circuit ALU :
  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_aluop : UInt<3>
    input io_in1 : UInt<32>
    input io_in2 : UInt<32>
    output io_out : UInt<32>

    node _T = eq(UInt<1>("h0"), io_aluop) @[ALU.scala 26:21]
    node _T_1 = eq(UInt<1>("h1"), io_aluop) @[ALU.scala 26:21]
    node _io_out_T = add(io_in1, io_in2) @[ALU.scala 31:30]
    node _io_out_T_1 = tail(_io_out_T, 1) @[ALU.scala 31:30]
    node _T_2 = eq(UInt<2>("h2"), io_aluop) @[ALU.scala 26:21]
    node _io_out_T_2 = sub(io_in1, io_in2) @[ALU.scala 34:30]
    node _io_out_T_3 = tail(_io_out_T_2, 1) @[ALU.scala 34:30]
    node _T_3 = eq(UInt<2>("h3"), io_aluop) @[ALU.scala 26:21]
    node _io_out_T_4 = and(io_in1, io_in2) @[ALU.scala 37:30]
    node _T_4 = eq(UInt<3>("h4"), io_aluop) @[ALU.scala 26:21]
    node _io_out_T_5 = or(io_in1, io_in2) @[ALU.scala 40:30]
    node _T_5 = eq(UInt<3>("h5"), io_aluop) @[ALU.scala 26:21]
    node _io_out_T_6 = xor(io_in1, io_in2) @[ALU.scala 43:30]
    node _T_6 = eq(UInt<3>("h6"), io_aluop) @[ALU.scala 26:21]
    node _T_7 = eq(UInt<3>("h7"), io_aluop) @[ALU.scala 26:21]
    node _io_out_T_7 = dshr(io_in1, UInt<1>("h1")) @[ALU.scala 49:30]
    node _GEN_0 = mux(_T_7, _io_out_T_7, io_in1) @[ALU.scala 25:12 26:21 49:20]
    node _GEN_1 = mux(_T_6, io_in2, _GEN_0) @[ALU.scala 26:21 46:20]
    node _GEN_2 = mux(_T_5, _io_out_T_6, _GEN_1) @[ALU.scala 26:21 43:20]
    node _GEN_3 = mux(_T_4, _io_out_T_5, _GEN_2) @[ALU.scala 26:21 40:20]
    node _GEN_4 = mux(_T_3, _io_out_T_4, _GEN_3) @[ALU.scala 26:21 37:20]
    node _GEN_5 = mux(_T_2, _io_out_T_3, _GEN_4) @[ALU.scala 26:21 34:20]
    node _GEN_6 = mux(_T_1, _io_out_T_1, _GEN_5) @[ALU.scala 26:21 31:20]
    node _GEN_7 = mux(_T, io_in1, _GEN_6) @[ALU.scala 26:21 28:20]
    io_out <= _GEN_7
