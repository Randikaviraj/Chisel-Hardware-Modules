package decoder

import chisel3._
import chisel3.util._

class  Decoder extends Module{
    val io = IO(new Bundle{
        val in = Input(UInt(2.W))
        val out = Output(UInt(4.W))
    })

    io.out := 0.U
    switch(io.in){
        is(0.U){
            io.out := 1.U
        }
        is(1.U){
            io.out := 2.U
        }
        is(2.U){
            io.out := 4.U
        }
        is(3.U){
            io.out := 8.U
        }
    }
}