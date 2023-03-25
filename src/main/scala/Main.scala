import modules.And
import counter.Counter
import  alu.ALU
import  chisel3._


object  Main{
    def main(args: Array[String]) : Unit = {
        emitVerilog (new ALU, Array("--target-dir"," verilog "))
    }
}