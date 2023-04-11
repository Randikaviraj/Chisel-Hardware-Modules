package leros.mem

import chisel3._
import chisel3.util._

class  Mem(datamem : Boolean,size : Int,dwidth:Int) extends Module{
    val io = IO(new Bundle{
        val adress = Input(UInt(log2Ceil(size).W))
        val wdData = Input(UInt((if (datamem) dwidth else 0).W))
        val wEna = Input(UInt((if (datamem) 1 else 0).W))
        val rdData =Output(UInt(dwidth.W))
    })

    val regFile = RegInit(VecInit(Seq.fill(size)(0.U(dwidth.W))))

    io.rdData := regFile(io.adress)

    if(datamem){
        when(io.wEna.asBool){
            regFile(io.adress) := io.wdData
        }
    }
}