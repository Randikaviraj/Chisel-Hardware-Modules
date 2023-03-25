package encoder

import  chisel3._

class Encoder extends Module{
    val io = IO(new Bundle{
        val in = Input(UInt(16.W))
        val out = Output(UInt(4.W))
    })

    val vec = Wire(Vec(16,UInt(4.W)))

    vec(0) := 0.U
    for (i <- 1  until 16){
        vec(i) := Mux(io.in(i),i.U,0.U) | vec(i-1)
    }

    io.out := vec(15)
}