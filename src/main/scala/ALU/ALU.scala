package alu

import chisel3._
import chisel3 .util._

class  ALU extends  Module{
    val io = IO(new Bundle{
        val data1 = Input(UInt(16.W))
        val data2 = Input(UInt(16.W))
        val select = Input(UInt(2.W))
        val out = Output(UInt(16.W))
    })

    io.out := 0.U

    switch(io.select){
        is(0.U){
            io.out := io.data1 + io.data2
        }
        is(1.U){
            io.out := io.data1 - io.data2
        }
        is(2.U){
            io.out := io.data1 & io.data2
        }
        is(3.U){
            io.out := io.data1 | io.data2
        }
        
    }
}