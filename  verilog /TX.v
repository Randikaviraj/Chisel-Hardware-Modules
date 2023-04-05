module TX(
  input        clock,
  input        reset,
  output       io_txd,
  output       io_chan_ready,
  input        io_chan_valid,
  input  [7:0] io_chan_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [19:0] cnt_reg; // @[UART.scala 19:26]
  reg [7:0] bits_reg; // @[UART.scala 20:27]
  reg [10:0] shift_reg; // @[UART.scala 21:28]
  wire  _io_chan_ready_T = cnt_reg == 20'h0; // @[UART.scala 23:31]
  wire  _io_chan_ready_T_1 = bits_reg == 8'h0; // @[UART.scala 23:54]
  wire [10:0] _shift_reg_T_1 = {2'h3,io_chan_bits,1'h0}; // @[UART.scala 33:55]
  wire [7:0] _bits_reg_T_1 = bits_reg - 8'h1; // @[UART.scala 38:34]
  wire [9:0] shiftwire = shift_reg[10:1]; // @[UART.scala 39:39]
  wire [10:0] _shift_reg_T_2 = {1'h1,shiftwire}; // @[UART.scala 40:35]
  wire [19:0] _cnt_reg_T_1 = cnt_reg - 20'h1; // @[UART.scala 44:28]
  assign io_txd = shift_reg[0]; // @[UART.scala 24:24]
  assign io_chan_ready = cnt_reg == 20'h0 & bits_reg == 8'h0; // @[UART.scala 23:40]
  always @(posedge clock) begin
    if (reset) begin // @[UART.scala 19:26]
      cnt_reg <= 20'h0; // @[UART.scala 19:26]
    end else if (_io_chan_ready_T) begin // @[UART.scala 26:26]
      cnt_reg <= 20'h3; // @[UART.scala 28:17]
    end else begin
      cnt_reg <= _cnt_reg_T_1; // @[UART.scala 44:17]
    end
    if (reset) begin // @[UART.scala 20:27]
      bits_reg <= 8'h0; // @[UART.scala 20:27]
    end else if (_io_chan_ready_T) begin // @[UART.scala 26:26]
      if (_io_chan_ready_T_1) begin // @[UART.scala 30:31]
        if (io_chan_valid) begin // @[UART.scala 31:32]
          bits_reg <= 8'hb; // @[UART.scala 32:26]
        end
      end else begin
        bits_reg <= _bits_reg_T_1; // @[UART.scala 38:22]
      end
    end
    if (reset) begin // @[UART.scala 21:28]
      shift_reg <= 11'h7ff; // @[UART.scala 21:28]
    end else if (_io_chan_ready_T) begin // @[UART.scala 26:26]
      if (_io_chan_ready_T_1) begin // @[UART.scala 30:31]
        if (io_chan_valid) begin // @[UART.scala 31:32]
          shift_reg <= _shift_reg_T_1; // @[UART.scala 33:27]
        end else begin
          shift_reg <= 11'h7ff; // @[UART.scala 35:27]
        end
      end else begin
        shift_reg <= _shift_reg_T_2; // @[UART.scala 40:23]
      end
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
  cnt_reg = _RAND_0[19:0];
  _RAND_1 = {1{`RANDOM}};
  bits_reg = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  shift_reg = _RAND_2[10:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
