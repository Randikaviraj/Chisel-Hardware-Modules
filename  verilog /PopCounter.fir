circuit PopCounter :
  module PopCounterDataPath :
    input clock : Clock
    input reset : Reset
    output io : { flip din : UInt<8>, flip load : UInt<1>, popCount : UInt<8>, done : UInt<1>}

    reg dataReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[PopCounter.scala 15:26]
    reg counterReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[PopCounter.scala 16:29]
    reg popCountReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[PopCounter.scala 17:30]
    when io.load : @[PopCounter.scala 19:18]
      dataReg <= io.din @[PopCounter.scala 20:17]
      counterReg <= UInt<4>("h8") @[PopCounter.scala 21:20]
      popCountReg <= UInt<1>("h0") @[PopCounter.scala 22:21]
    node done = eq(counterReg, UInt<1>("h0")) @[PopCounter.scala 25:27]
    node _T = eq(done, UInt<1>("h0")) @[PopCounter.scala 27:10]
    when _T : @[PopCounter.scala 27:16]
      node _counterReg_T = sub(counterReg, UInt<1>("h1")) @[PopCounter.scala 28:34]
      node _counterReg_T_1 = tail(_counterReg_T, 1) @[PopCounter.scala 28:34]
      counterReg <= _counterReg_T_1 @[PopCounter.scala 28:20]
      node _popCountReg_T = bits(dataReg, 0, 0) @[PopCounter.scala 29:57]
      node _popCountReg_T_1 = cat(UInt<7>("h0"), _popCountReg_T) @[PopCounter.scala 29:47]
      node _popCountReg_T_2 = add(popCountReg, _popCountReg_T_1) @[PopCounter.scala 29:36]
      node _popCountReg_T_3 = tail(_popCountReg_T_2, 1) @[PopCounter.scala 29:36]
      popCountReg <= _popCountReg_T_3 @[PopCounter.scala 29:21]
      node _dataReg_T = bits(dataReg, 7, 1) @[PopCounter.scala 30:39]
      node _dataReg_T_1 = cat(UInt<1>("h0"), _dataReg_T) @[PopCounter.scala 30:29]
      dataReg <= _dataReg_T_1 @[PopCounter.scala 30:17]
    io.done <= done @[PopCounter.scala 33:13]
    io.popCount <= popCountReg @[PopCounter.scala 34:17]

  module FSM :
    input clock : Clock
    input reset : Reset
    output io : { flip dinvalid : UInt<1>, dinready : UInt<1>, flip done : UInt<1>, load : UInt<1>, popCountValid : UInt<1>, flip popCountReady : UInt<1>}

    reg state : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[PopCounter.scala 53:24]
    wire load : UInt<1>
    load <= UInt<1>("h0")
    wire dinready : UInt<1>
    dinready <= UInt<1>("h0")
    wire popCountValid : UInt<1>
    popCountValid <= UInt<1>("h0")
    node _T = asUInt(UInt<1>("h0")) @[PopCounter.scala 59:18]
    node _T_1 = asUInt(state) @[PopCounter.scala 59:18]
    node _T_2 = eq(_T, _T_1) @[PopCounter.scala 59:18]
    when _T_2 : @[PopCounter.scala 59:18]
      when io.dinvalid : @[PopCounter.scala 61:30]
        load <= UInt<1>("h1") @[PopCounter.scala 62:22]
        state <= UInt<1>("h1") @[PopCounter.scala 63:23]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[PopCounter.scala 59:18]
      node _T_4 = asUInt(state) @[PopCounter.scala 59:18]
      node _T_5 = eq(_T_3, _T_4) @[PopCounter.scala 59:18]
      when _T_5 : @[PopCounter.scala 59:18]
        dinready <= UInt<1>("h1") @[PopCounter.scala 67:22]
        when io.done : @[PopCounter.scala 68:26]
          state <= UInt<2>("h2") @[PopCounter.scala 69:23]
      else :
        node _T_6 = asUInt(UInt<2>("h2")) @[PopCounter.scala 59:18]
        node _T_7 = asUInt(state) @[PopCounter.scala 59:18]
        node _T_8 = eq(_T_6, _T_7) @[PopCounter.scala 59:18]
        when _T_8 : @[PopCounter.scala 59:18]
          popCountValid <= UInt<1>("h1") @[PopCounter.scala 73:27]
          when io.popCountReady : @[PopCounter.scala 74:35]
            state <= UInt<1>("h0") @[PopCounter.scala 75:23]
    io.load <= load @[PopCounter.scala 80:13]
    io.dinready <= dinready @[PopCounter.scala 81:17]
    io.popCountValid <= popCountValid @[PopCounter.scala 82:22]

  module PopCounter :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip din : UInt<8>, flip dinvalid : UInt<1>, dinready : UInt<1>, popCountValid : UInt<1>, flip popCountReady : UInt<1>, popCount : UInt<8>}

    inst datapath of PopCounterDataPath @[PopCounter.scala 95:26]
    datapath.clock <= clock
    datapath.reset <= reset
    inst fsm of FSM @[PopCounter.scala 96:21]
    fsm.clock <= clock
    fsm.reset <= reset
    fsm.io.dinvalid <= io.dinvalid @[PopCounter.scala 98:21]
    fsm.io.popCountReady <= io.popCountReady @[PopCounter.scala 99:26]
    io.dinready <= fsm.io.dinready @[PopCounter.scala 100:17]
    io.popCountValid <= fsm.io.popCountValid @[PopCounter.scala 101:22]
    io.popCount <= datapath.io.popCount @[PopCounter.scala 103:17]
    datapath.io.din <= io.din @[PopCounter.scala 104:21]
    datapath.io.load <= fsm.io.load @[PopCounter.scala 105:22]
    fsm.io.done <= datapath.io.done @[PopCounter.scala 106:17]

