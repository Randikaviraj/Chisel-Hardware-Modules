import modules.And
import counter.Counter
import  alu.ALU
import  decoder.Decoder
import encoder.Encoder
import flasher.Flasher
import minimum.MinimumSearch
import fifo.Fifo
import popcounter._
import arbiter._
import  chisel3._


object  Main{
    def main(args: Array[String]) : Unit = {
        emitVerilog (new Fifo(UInt(8.W),10) ,Array("--target-dir"," verilog "))
    }
}