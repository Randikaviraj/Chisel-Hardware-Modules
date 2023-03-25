package arbiter

import chisel3._

class Arbiter(val n : Int) extends Module{
    val io = IO(new Bundle{
        val request = Input(UInt(n.W))
        val grant = Output(Vec(n,Bool()))
    })

    io.grant(0) := io.request(0)

    for(i <- 1 until n){
        io.grant(i) := io.request(i) & io.grant(i-1)
    }
}