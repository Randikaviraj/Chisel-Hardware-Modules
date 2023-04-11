import modules.And
import counter.Counter
import  alu.ALU
import  decoder.Decoder
import encoder.Encoder
import flasher.Flasher
import minimum.MinimumSearch
import fifo.Fifo
import  uart._
import popcounter._
import arbiter._
import  chisel3._
import leros.mem.Mem


object  Main{
    def main(args: Array[String]) : Unit = {
        emitVerilog (new Mem(false,1028,32) ,Array("--target-dir"," verilog "))
    }
}