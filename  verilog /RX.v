module RX(
  input        clock,
  input        reset,
  input        io_rxd,
  input        io_chan_ready,
  output       io_chan_valid,
  output [7:0] io_chan_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [19:0] cnt_reg; // @[UART.scala 60:26]
  reg [7:0] bits_reg; // @[UART.scala 61:27]
  reg [7:0] shift_reg; // @[UART.scala 62:28]
  reg  valid_reg; // @[UART.scala 63:28]
  reg  syncReg_REG; // @[UART.scala 65:33]
  reg  syncReg; // @[UART.scala 65:25]
  wire [19:0] _cnt_reg_T_1 = cnt_reg - 20'h1; // @[UART.scala 68:28]
  wire [7:0] _bits_reg_T_1 = bits_reg - 8'h1; // @[UART.scala 70:30]
  wire [7:0] _shift_reg_T_1 = {syncReg,shift_reg[7:1]}; // @[UART.scala 72:31]
  wire  _GEN_0 = bits_reg == 8'h1 | valid_reg; // @[UART.scala 74:31 75:23 63:28]
  assign io_chan_valid = valid_reg; // @[UART.scala 88:19]
  assign io_chan_bits = shift_reg; // @[UART.scala 87:18]
  always @(posedge clock) begin
    if (reset) begin // @[UART.scala 60:26]
      cnt_reg <= 20'h0; // @[UART.scala 60:26]
    end else if (cnt_reg != 20'h0) begin // @[UART.scala 67:26]
      cnt_reg <= _cnt_reg_T_1; // @[UART.scala 68:17]
    end else if (bits_reg != 8'h0) begin // @[UART.scala 69:34]
      cnt_reg <= 20'h3; // @[UART.scala 71:17]
    end else if (~syncReg) begin // @[UART.scala 78:32]
      cnt_reg <= 20'h5; // @[UART.scala 79:17]
    end
    if (reset) begin // @[UART.scala 61:27]
      bits_reg <= 8'h0; // @[UART.scala 61:27]
    end else if (!(cnt_reg != 20'h0)) begin // @[UART.scala 67:26]
      if (bits_reg != 8'h0) begin // @[UART.scala 69:34]
        bits_reg <= _bits_reg_T_1; // @[UART.scala 70:18]
      end else if (~syncReg) begin // @[UART.scala 78:32]
        bits_reg <= 8'hb; // @[UART.scala 80:18]
      end
    end
    if (reset) begin // @[UART.scala 62:28]
      shift_reg <= 8'h0; // @[UART.scala 62:28]
    end else if (!(cnt_reg != 20'h0)) begin // @[UART.scala 67:26]
      if (bits_reg != 8'h0) begin // @[UART.scala 69:34]
        shift_reg <= _shift_reg_T_1; // @[UART.scala 72:19]
      end
    end
    if (reset) begin // @[UART.scala 63:28]
      valid_reg <= 1'h0; // @[UART.scala 63:28]
    end else if (io_chan_ready & valid_reg) begin // @[UART.scala 83:37]
      valid_reg <= 1'h0; // @[UART.scala 84:19]
    end else if (!(cnt_reg != 20'h0)) begin // @[UART.scala 67:26]
      if (bits_reg != 8'h0) begin // @[UART.scala 69:34]
        valid_reg <= _GEN_0;
      end
    end
    syncReg_REG <= reset | io_rxd; // @[UART.scala 65:{33,33,33}]
    syncReg <= reset | syncReg_REG; // @[UART.scala 65:{25,25,25}]
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
  cnt_reg = _RAND_0[19:0];
  _RAND_1 = {1{`RANDOM}};
  bits_reg = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  shift_reg = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  valid_reg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  syncReg_REG = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  syncReg = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
