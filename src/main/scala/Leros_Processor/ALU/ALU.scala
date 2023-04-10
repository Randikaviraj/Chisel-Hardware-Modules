package leros.alu

import chisel3._
import chisel3.util._



class ALU(size : Int) extends Module{
    val io = IO(new Bundle{
        val aluop = Input(UInt(3.W))
        val in1 = Input(UInt(size.W))
        val in2 = Input(UInt(size.W))
        val out = Output(UInt(size.W))
    })
    // Alu ops
    val nop = 0
    val add = 1
    val sub = 2
    val and = 3
    val or = 4
    val xor = 5
    val ld = 6
    val shr = 7

    io.out := io.in1 
    switch(io.aluop){
        is(nop.U){
            io.out := io.in1
        }
        is(add.U){
            io.out := io.in1 + io.in2
        }
        is(sub.U){
            io.out := io.in1 - io.in2
        }
        is(and.U){
            io.out := io.in1 & io.in2
        }
        is(or.U){
            io.out := io.in1 | io.in2
        }
        is(xor.U){
            io.out := io.in1 ^ io.in2
        }
        is(ld.U){
            io.out := io.in2
        }
        is(shr.U){
            io.out := io.in1 >> 1.U
        }
    }
}