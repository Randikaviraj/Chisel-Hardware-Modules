module Flasher(
  input   clock,
  input   reset,
  input   io_start,
  output  io_light
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  timerstate; // @[Flasher.scala 19:29]
  reg [2:0] timer; // @[Flasher.scala 20:24]
  wire  timerDone = timer == 3'h0; // @[Flasher.scala 21:27]
  reg [2:0] currentState; // @[Flasher.scala 56:31]
  wire  _GEN_18 = 3'h3 == currentState ? 1'h0 : 3'h4 == currentState; // @[Flasher.scala 60:25]
  wire  _GEN_19 = 3'h2 == currentState | _GEN_18; // @[Flasher.scala 60:25 74:25]
  wire  _GEN_26 = 3'h1 == currentState ? 1'h0 : _GEN_19; // @[Flasher.scala 60:25]
  wire  timerSelect = 3'h0 == currentState ? 1'h0 : _GEN_26; // @[Flasher.scala 60:25]
  wire  _GEN_15 = 3'h3 == currentState | 3'h4 == currentState; // @[Flasher.scala 60:25 81:23]
  wire  _GEN_20 = 3'h2 == currentState | _GEN_15; // @[Flasher.scala 60:25 75:23]
  wire  _GEN_23 = 3'h1 == currentState | _GEN_20; // @[Flasher.scala 60:25 67:23]
  wire  timerLoad = 3'h0 == currentState ? 1'h0 : _GEN_23; // @[Flasher.scala 60:25]
  wire  _GEN_1 = timerLoad | timerstate; // @[Flasher.scala 33:28 34:28 19:29]
  wire [2:0] _timer_T_1 = timer - 3'h1; // @[Flasher.scala 39:32]
  wire [2:0] _GEN_10 = timerDone ? 3'h3 : currentState; // @[Flasher.scala 76:28 77:30 56:31]
  wire [2:0] _GEN_11 = timerDone ? 3'h4 : currentState; // @[Flasher.scala 83:28 84:30 56:31]
  wire [2:0] _GEN_12 = timerDone ? 3'h0 : currentState; // @[Flasher.scala 90:28 91:30 56:31]
  wire [2:0] _GEN_14 = 3'h4 == currentState ? _GEN_12 : currentState; // @[Flasher.scala 60:25 56:31]
  wire [2:0] _GEN_17 = 3'h3 == currentState ? _GEN_11 : _GEN_14; // @[Flasher.scala 60:25]
  wire  _GEN_22 = 3'h2 == currentState ? 1'h0 : 3'h3 == currentState; // @[Flasher.scala 58:14 60:25]
  wire  _GEN_24 = 3'h1 == currentState | _GEN_22; // @[Flasher.scala 60:25 68:22]
  assign io_light = 3'h0 == currentState ? 1'h0 : _GEN_24; // @[Flasher.scala 58:14 60:25]
  always @(posedge clock) begin
    if (reset) begin // @[Flasher.scala 19:29]
      timerstate <= 1'h0; // @[Flasher.scala 19:29]
    end else if (~timerstate) begin // @[Flasher.scala 26:23]
      timerstate <= _GEN_1;
    end else if (timerstate) begin // @[Flasher.scala 26:23]
      if (timerDone) begin // @[Flasher.scala 41:28]
        timerstate <= 1'h0; // @[Flasher.scala 42:28]
      end
    end
    if (reset) begin // @[Flasher.scala 20:24]
      timer <= 3'h0; // @[Flasher.scala 20:24]
    end else if (~timerstate) begin // @[Flasher.scala 26:23]
      if (timerSelect) begin // @[Flasher.scala 28:30]
        timer <= 3'h3; // @[Flasher.scala 29:23]
      end else begin
        timer <= 3'h5; // @[Flasher.scala 31:23]
      end
    end else if (timerstate) begin // @[Flasher.scala 26:23]
      if (~timerDone) begin // @[Flasher.scala 38:30]
        timer <= _timer_T_1; // @[Flasher.scala 39:23]
      end
    end
    if (reset) begin // @[Flasher.scala 56:31]
      currentState <= 3'h0; // @[Flasher.scala 56:31]
    end else if (3'h0 == currentState) begin // @[Flasher.scala 60:25]
      if (io_start) begin // @[Flasher.scala 62:27]
        currentState <= 3'h1; // @[Flasher.scala 63:30]
      end
    end else if (3'h1 == currentState) begin // @[Flasher.scala 60:25]
      if (timerDone) begin // @[Flasher.scala 69:28]
        currentState <= 3'h2; // @[Flasher.scala 70:30]
      end
    end else if (3'h2 == currentState) begin // @[Flasher.scala 60:25]
      currentState <= _GEN_10;
    end else begin
      currentState <= _GEN_17;
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
  timerstate = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  timer = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  currentState = _RAND_2[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
