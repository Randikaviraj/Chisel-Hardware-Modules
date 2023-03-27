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
module FSM(
  input   clock,
  input   reset,
  input   io_dinvalid,
  output  io_dinready,
  input   io_done,
  output  io_load,
  output  io_popCountValid,
  input   io_popCountReady
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[PopCounter.scala 53:24]
  wire [1:0] _GEN_3 = io_popCountReady ? 2'h0 : state; // @[PopCounter.scala 74:35 75:23 53:24]
  wire  _GEN_8 = 2'h1 == state ? 1'h0 : 2'h2 == state; // @[PopCounter.scala 59:18]
  assign io_dinready = 2'h0 == state ? 1'h0 : 2'h1 == state; // @[PopCounter.scala 59:18]
  assign io_load = 2'h0 == state & io_dinvalid; // @[PopCounter.scala 59:18]
  assign io_popCountValid = 2'h0 == state ? 1'h0 : _GEN_8; // @[PopCounter.scala 59:18]
  always @(posedge clock) begin
    if (reset) begin // @[PopCounter.scala 53:24]
      state <= 2'h0; // @[PopCounter.scala 53:24]
    end else if (2'h0 == state) begin // @[PopCounter.scala 59:18]
      if (io_dinvalid) begin // @[PopCounter.scala 61:30]
        state <= 2'h1; // @[PopCounter.scala 63:23]
      end
    end else if (2'h1 == state) begin // @[PopCounter.scala 59:18]
      if (io_done) begin // @[PopCounter.scala 68:26]
        state <= 2'h2; // @[PopCounter.scala 69:23]
      end
    end else if (2'h2 == state) begin // @[PopCounter.scala 59:18]
      state <= _GEN_3;
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
  state = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PopCounter(
  input        clock,
  input        reset,
  input  [7:0] io_din,
  input        io_dinvalid,
  output       io_dinready,
  output       io_popCountValid,
  input        io_popCountReady,
  output [7:0] io_popCount
);
  wire  datapath_clock; // @[PopCounter.scala 95:26]
  wire  datapath_reset; // @[PopCounter.scala 95:26]
  wire [7:0] datapath_io_din; // @[PopCounter.scala 95:26]
  wire  datapath_io_load; // @[PopCounter.scala 95:26]
  wire [7:0] datapath_io_popCount; // @[PopCounter.scala 95:26]
  wire  datapath_io_done; // @[PopCounter.scala 95:26]
  wire  fsm_clock; // @[PopCounter.scala 96:21]
  wire  fsm_reset; // @[PopCounter.scala 96:21]
  wire  fsm_io_dinvalid; // @[PopCounter.scala 96:21]
  wire  fsm_io_dinready; // @[PopCounter.scala 96:21]
  wire  fsm_io_done; // @[PopCounter.scala 96:21]
  wire  fsm_io_load; // @[PopCounter.scala 96:21]
  wire  fsm_io_popCountValid; // @[PopCounter.scala 96:21]
  wire  fsm_io_popCountReady; // @[PopCounter.scala 96:21]
  PopCounterDataPath datapath ( // @[PopCounter.scala 95:26]
    .clock(datapath_clock),
    .reset(datapath_reset),
    .io_din(datapath_io_din),
    .io_load(datapath_io_load),
    .io_popCount(datapath_io_popCount),
    .io_done(datapath_io_done)
  );
  FSM fsm ( // @[PopCounter.scala 96:21]
    .clock(fsm_clock),
    .reset(fsm_reset),
    .io_dinvalid(fsm_io_dinvalid),
    .io_dinready(fsm_io_dinready),
    .io_done(fsm_io_done),
    .io_load(fsm_io_load),
    .io_popCountValid(fsm_io_popCountValid),
    .io_popCountReady(fsm_io_popCountReady)
  );
  assign io_dinready = fsm_io_dinready; // @[PopCounter.scala 100:17]
  assign io_popCountValid = fsm_io_popCountValid; // @[PopCounter.scala 101:22]
  assign io_popCount = datapath_io_popCount; // @[PopCounter.scala 103:17]
  assign datapath_clock = clock;
  assign datapath_reset = reset;
  assign datapath_io_din = io_din; // @[PopCounter.scala 104:21]
  assign datapath_io_load = fsm_io_load; // @[PopCounter.scala 105:22]
  assign fsm_clock = clock;
  assign fsm_reset = reset;
  assign fsm_io_dinvalid = io_dinvalid; // @[PopCounter.scala 98:21]
  assign fsm_io_done = datapath_io_done; // @[PopCounter.scala 106:17]
  assign fsm_io_popCountReady = io_popCountReady; // @[PopCounter.scala 99:26]
endmodule
