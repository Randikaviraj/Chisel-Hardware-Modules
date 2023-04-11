package leros.aluaccu

import chisel3._
import chisel3.util._
import leros.alu.ALU

class AluAccu extends Module{
    val size = 32
    val io = IO(new Bundle{
        val din = Input(UInt(size.W))
        val imm = Input(UInt(8.W))
        val aluop = Input(UInt(3.W))
        val writeen = Input(Bool())
        val memdatasel = Input(Bool())
        val writeByte = Input(UInt(2.W))
        val accu = Output(UInt(size.W))
    })

    val accumelator = RegInit(0.U(size.W))

    val in2 = WireDefault(io.din)
    when(!io.memdatasel){
        val highimm = Wire(Vec(8,Bool()))
        for (i <- 0 until 8){
            highimm(i) := io.imm(7)
        }
        in2 := Cat(highimm.asUInt ,io.imm)
    }

    val alu = Module(new ALU(size))
    alu.io.aluop := io.aluop
    alu.io.in1 := accumelator
    alu.io.in2 := in2

    val byteone = WireDefault(alu.io.out(7,0))
    val bytetwo = WireDefault(alu.io.out(15,8))
    val bytethree = WireDefault(alu.io.out(23,16))
    val bytefour = WireDefault(alu.io.out(31,24))

    switch(io.writeByte){
        is(1.U){
            byteone := accumelator(7,0)
            bytetwo := alu.io.out(7,0)
            bytethree := accumelator(23,16)
            bytefour := accumelator(31,24)
        }
        is(2.U){
            byteone := accumelator(7,0)
            bytetwo := accumelator(15,8)
            bytethree := alu.io.out(7,0)
            bytefour := accumelator(31,24)
        }
        is(3.U){
            byteone := accumelator(7,0)
            bytetwo := accumelator(15,8)
            bytethree := accumelator(23,16)
            bytefour := alu.io.out(7,0)
        }
    }

    when(io.writeen){
        accumelator := bytefour ## bytethree  ##  bytetwo ## byteone
    }

    io.accu := accumelator

}