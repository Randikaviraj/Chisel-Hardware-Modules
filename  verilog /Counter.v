module Register(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_; // @[Counter.scala 21:22]
  assign io_out = reg_; // @[Counter.scala 23:12]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 21:22]
      reg_ <= 32'h0; // @[Counter.scala 21:22]
    end else begin
      reg_ <= io_in; // @[Counter.scala 22:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Adder(
  input  [31:0] io_b,
  output [31:0] io_out
);
  assign io_out = 32'h1 + io_b; // @[Counter.scala 12:20]
endmodule
module Counter(
  input         clock,
  input         reset,
  output [31:0] io_dout
);
  wire  register_clock; // @[Counter.scala 32:26]
  wire  register_reset; // @[Counter.scala 32:26]
  wire [31:0] register_io_in; // @[Counter.scala 32:26]
  wire [31:0] register_io_out; // @[Counter.scala 32:26]
  wire [31:0] adder_io_b; // @[Counter.scala 33:23]
  wire [31:0] adder_io_out; // @[Counter.scala 33:23]
  Register register ( // @[Counter.scala 32:26]
    .clock(register_clock),
    .reset(register_reset),
    .io_in(register_io_in),
    .io_out(register_io_out)
  );
  Adder adder ( // @[Counter.scala 33:23]
    .io_b(adder_io_b),
    .io_out(adder_io_out)
  );
  assign io_dout = register_io_out; // @[Counter.scala 36:13]
  assign register_clock = clock;
  assign register_reset = reset;
  assign register_io_in = adder_io_out == 32'h64 ? 32'h0 : adder_io_out; // @[Counter.scala 38:19]
  assign adder_io_b = register_io_out; // @[Counter.scala 35:16]
endmodule
