module Mem(
  input         clock,
  input         reset,
  input  [10:0] io_adress,
  output [31:0] io_rdData
);
  assign io_rdData = 32'h0; // @[Mem.scala 16:{15,15}]
endmodule
