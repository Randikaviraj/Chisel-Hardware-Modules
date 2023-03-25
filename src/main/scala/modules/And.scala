package modules

import chisel3._

class  And extends Module{
    val io = IO(new Bundle{
        val in1 = Input(Bits(1.W))
        val in2 = Input(Bits(1.W))
        val out =Output(Bits(1.W))
    })

    io.out := io.in1 & io.in2 
}