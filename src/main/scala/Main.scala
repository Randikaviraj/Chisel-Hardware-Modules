import modules.And
import counter.Counter
import  alu.ALU
import  decoder.Decoder
import  chisel3._


object  Main{
    def main(args: Array[String]) : Unit = {
        emitVerilog (new Decoder, Array("--target-dir"," verilog "))
    }
}