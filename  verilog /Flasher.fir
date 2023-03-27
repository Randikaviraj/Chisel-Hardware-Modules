circuit Flasher :
  module Flasher :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip start : UInt<1>, light : UInt<1>}

    reg timerstate : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Flasher.scala 19:29]
    reg timer : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[Flasher.scala 20:24]
    node timerDone = eq(timer, UInt<1>("h0")) @[Flasher.scala 21:27]
    wire timerLoad : UInt<1>
    timerLoad <= UInt<1>("h0")
    wire timerSelect : UInt<1>
    timerSelect <= UInt<1>("h0")
    node _T = asUInt(UInt<1>("h0")) @[Flasher.scala 26:23]
    node _T_1 = asUInt(timerstate) @[Flasher.scala 26:23]
    node _T_2 = eq(_T, _T_1) @[Flasher.scala 26:23]
    when _T_2 : @[Flasher.scala 26:23]
      when timerSelect : @[Flasher.scala 28:30]
        timer <= UInt<2>("h3") @[Flasher.scala 29:23]
      else :
        timer <= UInt<3>("h5") @[Flasher.scala 31:23]
      when timerLoad : @[Flasher.scala 33:28]
        timerstate <= UInt<1>("h1") @[Flasher.scala 34:28]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[Flasher.scala 26:23]
      node _T_4 = asUInt(timerstate) @[Flasher.scala 26:23]
      node _T_5 = eq(_T_3, _T_4) @[Flasher.scala 26:23]
      when _T_5 : @[Flasher.scala 26:23]
        node _T_6 = eq(timerDone, UInt<1>("h0")) @[Flasher.scala 38:18]
        when _T_6 : @[Flasher.scala 38:30]
          node _timer_T = sub(timer, UInt<1>("h1")) @[Flasher.scala 39:32]
          node _timer_T_1 = tail(_timer_T, 1) @[Flasher.scala 39:32]
          timer <= _timer_T_1 @[Flasher.scala 39:23]
        when timerDone : @[Flasher.scala 41:28]
          timerstate <= UInt<1>("h0") @[Flasher.scala 42:28]
    reg currentState : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[Flasher.scala 56:31]
    io.light <= UInt<1>("h0") @[Flasher.scala 58:14]
    node _T_7 = asUInt(UInt<1>("h0")) @[Flasher.scala 60:25]
    node _T_8 = asUInt(currentState) @[Flasher.scala 60:25]
    node _T_9 = eq(_T_7, _T_8) @[Flasher.scala 60:25]
    when _T_9 : @[Flasher.scala 60:25]
      when io.start : @[Flasher.scala 62:27]
        currentState <= UInt<1>("h1") @[Flasher.scala 63:30]
    else :
      node _T_10 = asUInt(UInt<1>("h1")) @[Flasher.scala 60:25]
      node _T_11 = asUInt(currentState) @[Flasher.scala 60:25]
      node _T_12 = eq(_T_10, _T_11) @[Flasher.scala 60:25]
      when _T_12 : @[Flasher.scala 60:25]
        timerLoad <= UInt<1>("h1") @[Flasher.scala 67:23]
        io.light <= UInt<1>("h1") @[Flasher.scala 68:22]
        when timerDone : @[Flasher.scala 69:28]
          currentState <= UInt<2>("h2") @[Flasher.scala 70:30]
      else :
        node _T_13 = asUInt(UInt<2>("h2")) @[Flasher.scala 60:25]
        node _T_14 = asUInt(currentState) @[Flasher.scala 60:25]
        node _T_15 = eq(_T_13, _T_14) @[Flasher.scala 60:25]
        when _T_15 : @[Flasher.scala 60:25]
          timerSelect <= UInt<1>("h1") @[Flasher.scala 74:25]
          timerLoad <= UInt<1>("h1") @[Flasher.scala 75:23]
          when timerDone : @[Flasher.scala 76:28]
            currentState <= UInt<2>("h3") @[Flasher.scala 77:30]
        else :
          node _T_16 = asUInt(UInt<2>("h3")) @[Flasher.scala 60:25]
          node _T_17 = asUInt(currentState) @[Flasher.scala 60:25]
          node _T_18 = eq(_T_16, _T_17) @[Flasher.scala 60:25]
          when _T_18 : @[Flasher.scala 60:25]
            timerLoad <= UInt<1>("h1") @[Flasher.scala 81:23]
            io.light <= UInt<1>("h1") @[Flasher.scala 82:22]
            when timerDone : @[Flasher.scala 83:28]
              currentState <= UInt<3>("h4") @[Flasher.scala 84:30]
          else :
            node _T_19 = asUInt(UInt<3>("h4")) @[Flasher.scala 60:25]
            node _T_20 = asUInt(currentState) @[Flasher.scala 60:25]
            node _T_21 = eq(_T_19, _T_20) @[Flasher.scala 60:25]
            when _T_21 : @[Flasher.scala 60:25]
              timerSelect <= UInt<1>("h1") @[Flasher.scala 88:25]
              timerLoad <= UInt<1>("h1") @[Flasher.scala 89:23]
              when timerDone : @[Flasher.scala 90:28]
                currentState <= UInt<1>("h0") @[Flasher.scala 91:30]

