circuit Fifo :
  module Fifo :
    input clock : Clock
    input reset : UInt<1>
    output io : { in : { flip write : UInt<1>, full : UInt<1>, flip din : UInt<8>}, out : { flip read : UInt<1>, empty : UInt<1>, dout : UInt<8>}}

    reg buffer : UInt<8>[10], clock with :
      reset => (UInt<1>("h0"), buffer) @[Fifo.scala 26:21]
    reg indexer : UInt, clock with :
      reset => (reset, UInt<4>("h9")) @[Fifo.scala 27:26]
    reg full : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Fifo.scala 28:23]
    reg empty : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[Fifo.scala 29:24]
    io.in.full <= full @[Fifo.scala 32:16]
    io.out.empty <= empty @[Fifo.scala 33:18]
    full <= UInt<1>("h0") @[Fifo.scala 36:10]
    empty <= UInt<1>("h1") @[Fifo.scala 37:11]
    node _T = eq(full, UInt<1>("h0")) @[Fifo.scala 39:25]
    node _T_1 = and(io.in.write, _T) @[Fifo.scala 39:22]
    when _T_1 : @[Fifo.scala 39:31]
      node _T_2 = or(indexer, UInt<4>("h0"))
      node _T_3 = bits(_T_2, 3, 0)
      buffer[_T_3] <= io.in.din @[Fifo.scala 41:25]
      node _indexer_T = sub(indexer, UInt<1>("h1")) @[Fifo.scala 42:28]
      node _indexer_T_1 = tail(_indexer_T, 1) @[Fifo.scala 42:28]
      indexer <= _indexer_T_1 @[Fifo.scala 42:17]
      node _T_4 = eq(indexer, UInt<1>("h0")) @[Fifo.scala 43:22]
      when _T_4 : @[Fifo.scala 43:30]
        full <= UInt<1>("h1") @[Fifo.scala 44:18]
    else :
      node _T_5 = eq(empty, UInt<1>("h0")) @[Fifo.scala 47:31]
      node _T_6 = and(io.out.read, _T_5) @[Fifo.scala 47:28]
      when _T_6 : @[Fifo.scala 47:38]
        buffer[1] <= buffer[0] @[Fifo.scala 50:18]
        buffer[2] <= buffer[0] @[Fifo.scala 50:18]
        buffer[3] <= buffer[0] @[Fifo.scala 50:18]
        buffer[4] <= buffer[0] @[Fifo.scala 50:18]
        buffer[5] <= buffer[0] @[Fifo.scala 50:18]
        buffer[6] <= buffer[0] @[Fifo.scala 50:18]
        buffer[7] <= buffer[0] @[Fifo.scala 50:18]
        buffer[8] <= buffer[0] @[Fifo.scala 50:18]
        buffer[9] <= buffer[0] @[Fifo.scala 50:18]
        node _T_7 = eq(indexer, UInt<4>("h9")) @[Fifo.scala 53:22]
        when _T_7 : @[Fifo.scala 53:41]
          empty <= UInt<1>("h1") @[Fifo.scala 54:19]
        else :
          empty <= UInt<1>("h0") @[Fifo.scala 56:19]
          node _indexer_T_2 = add(indexer, UInt<1>("h1")) @[Fifo.scala 57:32]
          node _indexer_T_3 = tail(_indexer_T_2, 1) @[Fifo.scala 57:32]
          indexer <= _indexer_T_3 @[Fifo.scala 57:21]
    io.out.dout <= buffer[UInt<4>("h9")] @[Fifo.scala 61:17]

