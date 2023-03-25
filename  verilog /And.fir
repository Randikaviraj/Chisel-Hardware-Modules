circuit And :
  module And :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in1 : UInt<1>, flip in2 : UInt<1>, out : UInt<1>}

    node _io_out_T = and(io.in1, io.in2) @[And.scala 12:22]
    io.out <= _io_out_T @[And.scala 12:12]

