import chisel3._
import chiseltest._
import chiseltest.ChiselScalatestTester
import org.scalatest.flatspec.AnyFlatSpec


class Passthrough extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(4.W))
    val out = Output(UInt(4.W))
  })
  io.out := io.in
}

class SimpleTest extends AnyFlatSpec with ChiselScalatestTester {
    "DUT" should "pass" in {
        test(new Passthrough()) { c =>
            c.io.in.poke(0.U)     // Set our input to value 0
            c.io.out.expect(0.U)  // Assert that the output correctly has 0
            c.io.in.poke(1.U)     // Set our input to value 1
            c.io.out.expect(1.U)  // Assert that the output correctly has 1
            c.io.in.poke(2.U)     // Set our input to value 2
            c.io.out.expect(2.U)  // Assert that the output correctly has 2
        }
        println("SUCCESS!!") //
    }
}


