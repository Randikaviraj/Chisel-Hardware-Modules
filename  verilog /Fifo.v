module Fifo(
  input        clock,
  input        reset,
  input        io_in_write,
  output       io_in_full,
  input  [7:0] io_in_din,
  input        io_out_read,
  output       io_out_empty,
  output [7:0] io_out_dout
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] buffer_0; // @[Fifo.scala 26:21]
  reg [7:0] buffer_9; // @[Fifo.scala 26:21]
  reg [3:0] indexer; // @[Fifo.scala 27:26]
  reg  full; // @[Fifo.scala 28:23]
  reg  empty; // @[Fifo.scala 29:24]
  wire [3:0] _indexer_T_1 = indexer - 4'h1; // @[Fifo.scala 42:28]
  wire  _T_4 = indexer == 4'h0; // @[Fifo.scala 43:22]
  wire  _T_7 = indexer == 4'h9; // @[Fifo.scala 53:22]
  wire [3:0] _indexer_T_3 = indexer + 4'h1; // @[Fifo.scala 57:32]
  wire  _GEN_22 = io_out_read & ~empty ? _T_7 : 1'h1; // @[Fifo.scala 37:11 47:38]
  wire  _GEN_35 = io_in_write & ~full & _T_4; // @[Fifo.scala 36:10 39:31]
  wire  _GEN_36 = io_in_write & ~full | _GEN_22; // @[Fifo.scala 37:11 39:31]
  assign io_in_full = full; // @[Fifo.scala 32:16]
  assign io_out_empty = empty; // @[Fifo.scala 33:18]
  assign io_out_dout = buffer_9; // @[Fifo.scala 61:17]
  always @(posedge clock) begin
    if (io_in_write & ~full) begin // @[Fifo.scala 39:31]
      if (4'h0 == indexer) begin // @[Fifo.scala 41:25]
        buffer_0 <= io_in_din; // @[Fifo.scala 41:25]
      end
    end
    if (io_in_write & ~full) begin // @[Fifo.scala 39:31]
      if (4'h9 == indexer) begin // @[Fifo.scala 41:25]
        buffer_9 <= io_in_din; // @[Fifo.scala 41:25]
      end
    end else if (io_out_read & ~empty) begin // @[Fifo.scala 47:38]
      buffer_9 <= buffer_0; // @[Fifo.scala 50:18]
    end
    if (reset) begin // @[Fifo.scala 27:26]
      indexer <= 4'h9; // @[Fifo.scala 27:26]
    end else if (io_in_write & ~full) begin // @[Fifo.scala 39:31]
      indexer <= _indexer_T_1; // @[Fifo.scala 42:17]
    end else if (io_out_read & ~empty) begin // @[Fifo.scala 47:38]
      if (!(indexer == 4'h9)) begin // @[Fifo.scala 53:41]
        indexer <= _indexer_T_3; // @[Fifo.scala 57:21]
      end
    end
    if (reset) begin // @[Fifo.scala 28:23]
      full <= 1'h0; // @[Fifo.scala 28:23]
    end else begin
      full <= _GEN_35;
    end
    empty <= reset | _GEN_36; // @[Fifo.scala 29:{24,24}]
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
  buffer_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  buffer_9 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  indexer = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  full = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  empty = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
