import modules.And
import counter.Counter
import  chisel3._


object  Main{
    def main(args: Array[String]) : Unit = {
        emitVerilog (new Counter, Array("--target-dir"," verilog "))
    }
}