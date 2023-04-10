import chisel3._
import chiseltest._
import chiseltest.ChiselScalatestTester
import org.scalatest.flatspec.AnyFlatSpec
import leros.alu.ALU


class  ALUTest extends AnyFlatSpec with ChiselScalatestTester{
    // Alu ops
    val nop = 0
    val add = 1
    val sub = 2
    val and = 3
    val or = 4
    val xor = 5
    val ld = 6
    val shr = 7

    def alu(a :Int, b: Int,op :Int): Int ={
        op match{
            case 0 => a
            case 1 => a + b
            case 2 => a - b
            case 3 => a & b
            case 4 => a | b
            case 5 => a ^ b
            case 6 => b
            case 7 => a >>> 1
            //case _: Int => -1
        }
    }

    val seq = Seq((11,2),(41,5),(17,10),(111,22))

    "ALU" should "pass" in{
        test(new ALU(32)){ dut =>
            for (data <- seq){
                dut.io.in1.poke(data._1.U)
                dut.io.in2.poke(data._2.U)
                dut.io.aluop.poke(add.U)
                dut.io.out.expect(alu(data._1,data._2,add).U)
                dut.io.in1.poke(data._1.U)
                dut.io.in2.poke(data._2.U)
                dut.io.aluop.poke(sub.U)
                dut.io.out.expect(alu(data._1,data._2,sub).U)
                dut.io.aluop.poke(xor.U)
                dut.io.out.expect(alu(data._1,data._2,xor).U)
            }
            println("SUCCESS!!") //
        }
    }
}