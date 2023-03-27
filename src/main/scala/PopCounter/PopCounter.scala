package popcounter

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum

class  PopCounterDataPath extends Module{
    val io = IO(new Bundle{
        val din = Input(UInt(8.W))
        val load = Input(Bool())
        val popCount = Output(UInt(8.W))
        val done = Output(Bool())
    })

    val dataReg = RegInit(0.U(8.W))
    val counterReg = RegInit(0.U(8.W))
    val popCountReg = RegInit(0.U(8.W))

    when(io.load){
        dataReg := io.din
        counterReg := 8.U
        popCountReg := 0.U
    }

    val done = counterReg === 0.U

    when(!done){
        counterReg := counterReg - 1.U
        popCountReg := popCountReg + 0.U(7.W) ## dataReg(0)
        dataReg := 0.U(1.W) ## dataReg(7,1)
    }

    io.done := done
    io.popCount := popCountReg
}

class  FSM extends  Module{
    val io = IO(new Bundle{
        val dinvalid = Input(Bool())
        val dinready = Output(Bool())
        val done = Input(Bool())
        val load = Output(Bool())
        val popCountValid = Output(Bool())
        val popCountReady = Input(Bool())
        
    })

    object State extends ChiselEnum{
        val idle,count,done = Value
    }
    import State._

    val state = RegInit(idle)

    val load = WireDefault(false.B)
    val dinready = WireDefault(false.B)
    val popCountValid = WireDefault(false.B)

    switch(state){
        is(idle){
            when(io.dinvalid){
                load := true.B
                state := count
            }
        }
        is(count){
            dinready := true.B
            when(io.done){
                state := done
            }
        }
        is(done){
            popCountValid := true.B
            when(io.popCountReady){
                state := idle
            }
        }
    }

    io.load := load
    io.dinready := dinready
    io.popCountValid := popCountValid
}

class PopCounter extends Module{
    val io = IO(new Bundle{
        val din = Input(UInt(8.W))
        val dinvalid = Input(Bool())
        val dinready = Output(Bool())
        val popCountValid =Output(Bool())
        val popCountReady = Input(Bool())
        val popCount = Output(UInt(8.W))
    })

    val datapath = Module(new PopCounterDataPath)
    val fsm = Module(new FSM)

    fsm.io.dinvalid := io.dinvalid
    fsm.io.popCountReady := io.popCountReady
    io.dinready := fsm.io.dinready
    io.popCountValid := fsm.io.popCountValid

    io.popCount := datapath.io.popCount
    datapath.io.din := io.din
    datapath.io.load := fsm.io.load
    fsm.io.done := datapath.io.done

}

