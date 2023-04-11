circuit AluAccu :
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

  module AluAccu :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<32>
    input io_imm : UInt<8>
    input io_aluop : UInt<3>
    input io_writeen : UInt<1>
    input io_memdatasel : UInt<1>
    input io_writeByte : UInt<2>
    output io_accu : UInt<32>

    inst alu of ALU @[AluAccu.scala 30:21]
    reg accumelator : UInt<32>, clock with :
      reset => (UInt<1>("h0"), accumelator) @[AluAccu.scala 19:30]
    node _T = eq(io_memdatasel, UInt<1>("h0")) @[AluAccu.scala 22:10]
    node _highimm_0_T = bits(io_imm, 7, 7) @[AluAccu.scala 25:33]
    node _highimm_1_T = bits(io_imm, 7, 7) @[AluAccu.scala 25:33]
    node _highimm_2_T = bits(io_imm, 7, 7) @[AluAccu.scala 25:33]
    node _highimm_3_T = bits(io_imm, 7, 7) @[AluAccu.scala 25:33]
    node _highimm_4_T = bits(io_imm, 7, 7) @[AluAccu.scala 25:33]
    node _highimm_5_T = bits(io_imm, 7, 7) @[AluAccu.scala 25:33]
    node _highimm_6_T = bits(io_imm, 7, 7) @[AluAccu.scala 25:33]
    node _highimm_7_T = bits(io_imm, 7, 7) @[AluAccu.scala 25:33]
    node highimm_1 = _highimm_1_T @[AluAccu.scala 23:27 25:24]
    node highimm_0 = _highimm_0_T @[AluAccu.scala 23:27 25:24]
    node in2_lo_lo = cat(highimm_1, highimm_0) @[AluAccu.scala 27:28]
    node highimm_3 = _highimm_3_T @[AluAccu.scala 23:27 25:24]
    node highimm_2 = _highimm_2_T @[AluAccu.scala 23:27 25:24]
    node in2_lo_hi = cat(highimm_3, highimm_2) @[AluAccu.scala 27:28]
    node in2_lo = cat(in2_lo_hi, in2_lo_lo) @[AluAccu.scala 27:28]
    node highimm_5 = _highimm_5_T @[AluAccu.scala 23:27 25:24]
    node highimm_4 = _highimm_4_T @[AluAccu.scala 23:27 25:24]
    node in2_hi_lo = cat(highimm_5, highimm_4) @[AluAccu.scala 27:28]
    node highimm_7 = _highimm_7_T @[AluAccu.scala 23:27 25:24]
    node highimm_6 = _highimm_6_T @[AluAccu.scala 23:27 25:24]
    node in2_hi_hi = cat(highimm_7, highimm_6) @[AluAccu.scala 27:28]
    node in2_hi = cat(in2_hi_hi, in2_hi_lo) @[AluAccu.scala 27:28]
    node _in2_T = cat(in2_hi, in2_lo) @[AluAccu.scala 27:28]
    node _in2_T_1 = cat(_in2_T, io_imm) @[Cat.scala 33:92]
    node _GEN_0 = mux(_T, _in2_T_1, io_din) @[AluAccu.scala 22:25 27:13]
    node _byteone_T = bits(alu.io_out, 7, 0) @[AluAccu.scala 35:41]
    node _bytetwo_T = bits(alu.io_out, 15, 8) @[AluAccu.scala 36:41]
    node _bytethree_T = bits(alu.io_out, 23, 16) @[AluAccu.scala 37:43]
    node _bytefour_T = bits(alu.io_out, 31, 24) @[AluAccu.scala 38:42]
    node _T_1 = eq(UInt<1>("h1"), io_writeByte) @[AluAccu.scala 40:25]
    node _byteone_T_1 = bits(accumelator, 7, 0) @[AluAccu.scala 42:35]
    node _bytetwo_T_1 = bits(alu.io_out, 7, 0) @[AluAccu.scala 43:34]
    node _bytethree_T_1 = bits(accumelator, 23, 16) @[AluAccu.scala 44:37]
    node _bytefour_T_1 = bits(accumelator, 31, 24) @[AluAccu.scala 45:36]
    node _T_2 = eq(UInt<2>("h2"), io_writeByte) @[AluAccu.scala 40:25]
    node _byteone_T_2 = bits(accumelator, 7, 0) @[AluAccu.scala 48:35]
    node _bytetwo_T_2 = bits(accumelator, 15, 8) @[AluAccu.scala 49:35]
    node _bytethree_T_2 = bits(alu.io_out, 7, 0) @[AluAccu.scala 50:36]
    node _bytefour_T_2 = bits(accumelator, 31, 24) @[AluAccu.scala 51:36]
    node _T_3 = eq(UInt<2>("h3"), io_writeByte) @[AluAccu.scala 40:25]
    node _byteone_T_3 = bits(accumelator, 7, 0) @[AluAccu.scala 54:35]
    node _bytetwo_T_3 = bits(accumelator, 15, 8) @[AluAccu.scala 55:35]
    node _bytethree_T_3 = bits(accumelator, 23, 16) @[AluAccu.scala 56:37]
    node _bytefour_T_3 = bits(alu.io_out, 7, 0) @[AluAccu.scala 57:35]
    node _GEN_1 = mux(_T_3, _byteone_T_3, _byteone_T) @[AluAccu.scala 40:25 54:21]
    node _GEN_2 = mux(_T_3, _bytetwo_T_3, _bytetwo_T) @[AluAccu.scala 40:25 55:21]
    node _GEN_3 = mux(_T_3, _bytethree_T_3, _bytethree_T) @[AluAccu.scala 40:25 56:23]
    node _GEN_4 = mux(_T_3, _bytefour_T_3, _bytefour_T) @[AluAccu.scala 40:25 57:22]
    node _GEN_5 = mux(_T_2, _byteone_T_2, _GEN_1) @[AluAccu.scala 40:25 48:21]
    node _GEN_6 = mux(_T_2, _bytetwo_T_2, _GEN_2) @[AluAccu.scala 40:25 49:21]
    node _GEN_7 = mux(_T_2, _bytethree_T_2, _GEN_3) @[AluAccu.scala 40:25 50:23]
    node _GEN_8 = mux(_T_2, _bytefour_T_2, _GEN_4) @[AluAccu.scala 40:25 51:22]
    node _GEN_9 = mux(_T_1, _byteone_T_1, _GEN_5) @[AluAccu.scala 40:25 42:21]
    node _GEN_10 = mux(_T_1, _bytetwo_T_1, _GEN_6) @[AluAccu.scala 40:25 43:21]
    node _GEN_11 = mux(_T_1, _bytethree_T_1, _GEN_7) @[AluAccu.scala 40:25 44:23]
    node _GEN_12 = mux(_T_1, _bytefour_T_1, _GEN_8) @[AluAccu.scala 40:25 45:22]
    node bytefour = _GEN_12
    node bytethree = _GEN_11
    node _accumelator_T = cat(bytefour, bytethree) @[AluAccu.scala 62:33]
    node bytetwo = _GEN_10
    node _accumelator_T_1 = cat(_accumelator_T, bytetwo) @[AluAccu.scala 62:47]
    node byteone = _GEN_9
    node _accumelator_T_2 = cat(_accumelator_T_1, byteone) @[AluAccu.scala 62:59]
    node _GEN_13 = mux(io_writeen, _accumelator_T_2, accumelator) @[AluAccu.scala 61:21 62:21 19:30]
    node in2 = _GEN_0
    io_accu <= accumelator @[AluAccu.scala 65:13]
    accumelator <= mux(reset, UInt<32>("h0"), _GEN_13) @[AluAccu.scala 19:{30,30}]
    alu.clock <= clock
    alu.reset <= reset
    alu.io_aluop <= io_aluop @[AluAccu.scala 31:18]
    alu.io_in1 <= accumelator @[AluAccu.scala 32:16]
    alu.io_in2 <= in2 @[AluAccu.scala 33:16]
