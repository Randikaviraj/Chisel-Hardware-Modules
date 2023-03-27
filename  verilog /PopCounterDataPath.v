module PopCounterDataPath(
  input        clock,
  input        reset,
  input  [7:0] io_din,
  input        io_load,
  output [7:0] io_popCount,
  output       io_done
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] dataReg; // @[PopCounter.scala 15:26]
  reg [7:0] counterReg; // @[PopCounter.scala 16:29]
  reg [7:0] popCountReg; // @[PopCounter.scala 17:30]
  wire  done = counterReg == 8'h0; // @[PopCounter.scala 25:27]
  wire [7:0] _counterReg_T_1 = counterReg - 8'h1; // @[PopCounter.scala 28:34]
  wire [7:0] _popCountReg_T_1 = {7'h0,dataReg[0]}; // @[PopCounter.scala 29:47]
  wire [7:0] _popCountReg_T_3 = popCountReg + _popCountReg_T_1; // @[PopCounter.scala 29:36]
  wire [7:0] _dataReg_T_1 = {1'h0,dataReg[7:1]}; // @[PopCounter.scala 30:29]
  assign io_popCount = popCountReg; // @[PopCounter.scala 34:17]
  assign io_done = counterReg == 8'h0; // @[PopCounter.scala 25:27]
  always @(posedge clock) begin
    if (reset) begin // @[PopCounter.scala 15:26]
      dataReg <= 8'h0; // @[PopCounter.scala 15:26]
    end else if (~done) begin // @[PopCounter.scala 27:16]
      dataReg <= _dataReg_T_1; // @[PopCounter.scala 30:17]
    end else if (io_load) begin // @[PopCounter.scala 19:18]
      dataReg <= io_din; // @[PopCounter.scala 20:17]
    end
    if (reset) begin // @[PopCounter.scala 16:29]
      counterReg <= 8'h0; // @[PopCounter.scala 16:29]
    end else if (~done) begin // @[PopCounter.scala 27:16]
      counterReg <= _counterReg_T_1; // @[PopCounter.scala 28:20]
    end else if (io_load) begin // @[PopCounter.scala 19:18]
      counterReg <= 8'h8; // @[PopCounter.scala 21:20]
    end
    if (reset) begin // @[PopCounter.scala 17:30]
      popCountReg <= 8'h0; // @[PopCounter.scala 17:30]
    end else if (~done) begin // @[PopCounter.scala 27:16]
      popCountReg <= _popCountReg_T_3; // @[PopCounter.scala 29:21]
    end else if (io_load) begin // @[PopCounter.scala 19:18]
      popCountReg <= 8'h0; // @[PopCounter.scala 22:21]
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
  dataReg = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  counterReg = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  popCountReg = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
