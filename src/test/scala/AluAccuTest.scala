import chisel3._
import chiseltest._
import chiseltest.ChiselScalatestTester
import org.scalatest.flatspec.AnyFlatSpec

import leros.aluaccu.AluAccu


class AluAccuTest extends  AnyFlatSpec with ChiselScalatestTester{
    // Alu ops
    val nop = 0
    val add = 1
    val sub = 2
    val and = 3
    val or = 4
    val xor = 5
    val ld = 6
    val shr = 7

    "AluAccu" should "Pass" in{
        test(new AluAccu()){
            dut =>
                dut.io.din.poke(10.U)
                dut.io.aluop.poke(ld)
                dut.io.memdatasel.poke(true.B)
                dut.io.writeen.poke(true.B)
                dut.io.writeByte.poke(0.U)
                dut. clock.step (1)
                dut.io.accu.expect(10.U)

                dut.io.din.poke(10.U)
                dut.io.aluop.poke(add)
                dut.io.memdatasel.poke(true.B)
                dut.io.writeen.poke(true.B)
                dut.io.writeByte.poke(0.U)
                dut. clock.step (1)
                dut.io.accu.expect(20.U)

                dut.io.imm.poke(10.U)
                dut.io.aluop.poke(sub)
                dut.io.memdatasel.poke(false.B)
                dut.io.writeen.poke(true.B)
                dut.io.writeByte.poke(0.U)
                dut. clock.step (1)
                dut.io.accu.expect(10.U)

                dut.io.din.poke(10.U)
                dut.io.aluop.poke(ld)
                dut.io.memdatasel.poke(true.B)
                dut.io.writeen.poke(true.B)
                dut.io.writeByte.poke(2.U)
                dut. clock.step (1)
                dut.io.accu.expect("h0a000a".U)


        }
    }
}