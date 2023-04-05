circuit RX :
  module RX :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip rxd : UInt<1>, chan : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}}

    reg cnt_reg : UInt<20>, clock with :
      reset => (reset, UInt<20>("h0")) @[UART.scala 60:26]
    reg bits_reg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[UART.scala 61:27]
    reg shift_reg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[UART.scala 62:28]
    reg valid_reg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[UART.scala 63:28]
    reg syncReg_REG : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[UART.scala 65:33]
    syncReg_REG <= io.rxd @[UART.scala 65:33]
    reg syncReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[UART.scala 65:25]
    syncReg <= syncReg_REG @[UART.scala 65:25]
    node _T = neq(cnt_reg, UInt<1>("h0")) @[UART.scala 67:18]
    when _T : @[UART.scala 67:26]
      node _cnt_reg_T = sub(cnt_reg, UInt<1>("h1")) @[UART.scala 68:28]
      node _cnt_reg_T_1 = tail(_cnt_reg_T, 1) @[UART.scala 68:28]
      cnt_reg <= _cnt_reg_T_1 @[UART.scala 68:17]
    else :
      node _T_1 = neq(bits_reg, UInt<1>("h0")) @[UART.scala 69:26]
      when _T_1 : @[UART.scala 69:34]
        node _bits_reg_T = sub(bits_reg, UInt<1>("h1")) @[UART.scala 70:30]
        node _bits_reg_T_1 = tail(_bits_reg_T, 1) @[UART.scala 70:30]
        bits_reg <= _bits_reg_T_1 @[UART.scala 70:18]
        cnt_reg <= UInt<2>("h3") @[UART.scala 71:17]
        node _shift_reg_T = bits(shift_reg, 7, 1) @[UART.scala 72:43]
        node _shift_reg_T_1 = cat(syncReg, _shift_reg_T) @[UART.scala 72:31]
        shift_reg <= _shift_reg_T_1 @[UART.scala 72:19]
        node _T_2 = eq(bits_reg, UInt<1>("h1")) @[UART.scala 74:23]
        when _T_2 : @[UART.scala 74:31]
          valid_reg <= UInt<1>("h1") @[UART.scala 75:23]
      else :
        node _T_3 = eq(syncReg, UInt<1>("h0")) @[UART.scala 78:24]
        when _T_3 : @[UART.scala 78:32]
          cnt_reg <= UInt<3>("h5") @[UART.scala 79:17]
          bits_reg <= UInt<4>("hb") @[UART.scala 80:18]
    node _T_4 = and(io.chan.ready, valid_reg) @[UART.scala 83:24]
    when _T_4 : @[UART.scala 83:37]
      valid_reg <= UInt<1>("h0") @[UART.scala 84:19]
    io.chan.bits <= shift_reg @[UART.scala 87:18]
    io.chan.valid <= valid_reg @[UART.scala 88:19]

