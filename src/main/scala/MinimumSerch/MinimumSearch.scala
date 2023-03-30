package minimum

import chisel3._
import chisel3.util._


class MinimumSearch(size : Int,bitlenghth : Int) extends Module{
    val io = IO(new Bundle{
        val in = Input(Vec(size,UInt(bitlenghth.W)))
        val out = Output(UInt(bitlenghth.W))
    })

    
    val minim = io.in.reduceTree((data1,data2)=>Mux(data1 < data2,data1,data2))
    io.out := minim
}