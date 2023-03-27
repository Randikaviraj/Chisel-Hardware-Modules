circuit PopCounterDataPath :
  module PopCounterDataPath :
    input clock : Clock
    input reset : UInt<1>
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

