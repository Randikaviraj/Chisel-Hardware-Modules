circuit TX :
  module TX :
    input clock : Clock
    input reset : UInt<1>
    output io : { txd : UInt<1>, flip chan : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}}

    reg cnt_reg : UInt<20>, clock with :
      reset => (reset, UInt<20>("h0")) @[UART.scala 19:26]
    reg bits_reg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[UART.scala 20:27]
    reg shift_reg : UInt, clock with :
      reset => (reset, UInt<11>("h7ff")) @[UART.scala 21:28]
    node _io_chan_ready_T = eq(cnt_reg, UInt<1>("h0")) @[UART.scala 23:31]
    node _io_chan_ready_T_1 = eq(bits_reg, UInt<1>("h0")) @[UART.scala 23:54]
    node _io_chan_ready_T_2 = and(_io_chan_ready_T, _io_chan_ready_T_1) @[UART.scala 23:40]
    io.chan.ready <= _io_chan_ready_T_2 @[UART.scala 23:19]
    node _io_txd_T = bits(shift_reg, 0, 0) @[UART.scala 24:24]
    io.txd <= _io_txd_T @[UART.scala 24:12]
    node _T = eq(cnt_reg, UInt<1>("h0")) @[UART.scala 26:18]
    when _T : @[UART.scala 26:26]
      cnt_reg <= UInt<2>("h3") @[UART.scala 28:17]
      node _T_1 = eq(bits_reg, UInt<1>("h0")) @[UART.scala 30:23]
      when _T_1 : @[UART.scala 30:31]
        when io.chan.valid : @[UART.scala 31:32]
          bits_reg <= UInt<4>("hb") @[UART.scala 32:26]
          node _shift_reg_T = cat(UInt<2>("h3"), io.chan.bits) @[UART.scala 33:39]
          node _shift_reg_T_1 = cat(_shift_reg_T, UInt<1>("h0")) @[UART.scala 33:55]
          shift_reg <= _shift_reg_T_1 @[UART.scala 33:27]
        else :
          shift_reg <= UInt<11>("h7ff") @[UART.scala 35:27]
      else :
        node _bits_reg_T = sub(bits_reg, UInt<1>("h1")) @[UART.scala 38:34]
        node _bits_reg_T_1 = tail(_bits_reg_T, 1) @[UART.scala 38:34]
        bits_reg <= _bits_reg_T_1 @[UART.scala 38:22]
        node shiftwire = shr(shift_reg, 1) @[UART.scala 39:39]
        node _shift_reg_T_2 = cat(UInt<1>("h1"), shiftwire) @[UART.scala 40:35]
        shift_reg <= _shift_reg_T_2 @[UART.scala 40:23]
    else :
      node _cnt_reg_T = sub(cnt_reg, UInt<1>("h1")) @[UART.scala 44:28]
      node _cnt_reg_T_1 = tail(_cnt_reg_T, 1) @[UART.scala 44:28]
      cnt_reg <= _cnt_reg_T_1 @[UART.scala 44:17]

