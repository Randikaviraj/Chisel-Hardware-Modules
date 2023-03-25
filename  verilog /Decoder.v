module Decoder(
  input        clock,
  input        reset,
  input  [1:0] io_in,
  output [3:0] io_out
);
  wire [3:0] _GEN_0 = 2'h3 == io_in ? 4'h8 : 4'h0; // @[Decoder.scala 12:12 13:18 24:20]
  wire [3:0] _GEN_1 = 2'h2 == io_in ? 4'h4 : _GEN_0; // @[Decoder.scala 13:18 21:20]
  wire [3:0] _GEN_2 = 2'h1 == io_in ? 4'h2 : _GEN_1; // @[Decoder.scala 13:18 18:20]
  assign io_out = 2'h0 == io_in ? 4'h1 : _GEN_2; // @[Decoder.scala 13:18 15:20]
endmodule
