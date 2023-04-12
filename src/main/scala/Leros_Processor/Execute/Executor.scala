package leros.executor

import chisel3._
import chisel3.util._
import leros._

class Executor extends Module{
    val io = IO(new Bundle{
        val aluop = Input(UInt(3.W))
        val writeen = Input(Bool())
        val memdatasel = Input(Bool())
        val writeByte = Input(UInt(2.W))
        val wreEna = Input(Bool())
        val wrenAr = Input(Bool())
        val adresssel = Input(Bool())
        val bEn = Input(Bool())
        val imm = Input(UInt(8.W))
    })

    val datamem = Module(new Mem(true,256,32))
    val aluac = Module(new AluAccu)

    aluac.io.din := datamem.io.rdData
    aluac.io.aluop := io.aluop
    aluac.io.writeen := io.writeen
    aluac.io.memdatasel := io.memdatasel
    aluac.io.writeByte := io.writeByte

    datamem.io.wrData := aluac.io.accu
    datamem.io.wEna := io.wreEna

    val arReg = RegInit(0.U(32.W))

    when(io.wrenAr){
        arReg := aluac.io.accu
    }

    val adress = WireDefault(arReg)
    when(adresssel){
        adress := Cat(io.im(8) ## io.im(8),io.imm)
    }

}