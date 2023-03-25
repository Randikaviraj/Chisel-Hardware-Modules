package  counter

import chisel3._

class Adder extends Module{
    val io = IO(new Bundle{
        val a = Input(UInt(32.W))
        val b = Input(UInt(32.W))
        val out = Output(UInt(32.W))
    })

    io.out := io.a + io.b
}

class  Register extends  Module{
    val io = IO(new Bundle{
        val in = Input(UInt(32.W))
        val out = Output(UInt(32.W))
    })

    val reg = RegInit(0.U(32.W))
    reg := io.in
    io.out := reg

}

class Counter extends  Module{
    val io = IO(new Bundle{
        val dout = Output(UInt(32.W))
    })

    val register = Module(new Register())
    val adder = Module(new Adder())
    adder.io.a := 1.U(32.W)
    adder.io.b := register.io.out
    io.dout := register.io.out

    val next = Mux(adder.io.out === 100.U(32.W),0.U(32.W),adder.io.out)
    register.io.in := next
}