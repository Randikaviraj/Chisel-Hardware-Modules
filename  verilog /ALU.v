module ALU(
  input         clock,
  input         reset,
  input  [15:0] io_data1,
  input  [15:0] io_data2,
  input  [1:0]  io_select,
  output [15:0] io_out
);
  wire [15:0] _io_out_T_1 = io_data1 + io_data2; // @[ALU.scala 18:32]
  wire [15:0] _io_out_T_3 = io_data1 - io_data2; // @[ALU.scala 21:32]
  wire [15:0] _io_out_T_4 = io_data1 & io_data2; // @[ALU.scala 24:32]
  wire [15:0] _io_out_T_5 = io_data1 | io_data2; // @[ALU.scala 27:32]
  wire [15:0] _GEN_0 = 2'h3 == io_select ? _io_out_T_5 : 16'h0; // @[ALU.scala 14:12 16:22 27:20]
  wire [15:0] _GEN_1 = 2'h2 == io_select ? _io_out_T_4 : _GEN_0; // @[ALU.scala 16:22 24:20]
  wire [15:0] _GEN_2 = 2'h1 == io_select ? _io_out_T_3 : _GEN_1; // @[ALU.scala 16:22 21:20]
  assign io_out = 2'h0 == io_select ? _io_out_T_1 : _GEN_2; // @[ALU.scala 16:22 18:20]
endmodule
