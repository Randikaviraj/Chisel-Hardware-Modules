module And(
  input   clock,
  input   reset,
  input   io_in1,
  input   io_in2,
  output  io_out
);
  assign io_out = io_in1 & io_in2; // @[And.scala 12:22]
endmodule
