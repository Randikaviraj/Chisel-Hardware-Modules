circuit Counter :
  module Register :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<32>, out : UInt<32>}

    reg reg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Counter.scala 21:22]
    reg <= io.in @[Counter.scala 22:9]
    io.out <= reg @[Counter.scala 23:12]

  module Adder :
    input clock : Clock
    input reset : Reset
    output io : { flip a : UInt<32>, flip b : UInt<32>, out : UInt<32>}

    node _io_out_T = add(io.a, io.b) @[Counter.scala 12:20]
    node _io_out_T_1 = tail(_io_out_T, 1) @[Counter.scala 12:20]
    io.out <= _io_out_T_1 @[Counter.scala 12:12]

  module Counter :
    input clock : Clock
    input reset : UInt<1>
    output io : { dout : UInt<32>}

    inst register of Register @[Counter.scala 32:26]
    register.clock <= clock
    register.reset <= reset
    inst adder of Adder @[Counter.scala 33:23]
    adder.clock <= clock
    adder.reset <= reset
    adder.io.a <= UInt<32>("h1") @[Counter.scala 34:16]
    adder.io.b <= register.io.out @[Counter.scala 35:16]
    io.dout <= register.io.out @[Counter.scala 36:13]
    node _next_T = eq(adder.io.out, UInt<32>("h64")) @[Counter.scala 38:33]
    node next = mux(_next_T, UInt<32>("h0"), adder.io.out) @[Counter.scala 38:19]
    register.io.in <= next @[Counter.scala 39:20]

