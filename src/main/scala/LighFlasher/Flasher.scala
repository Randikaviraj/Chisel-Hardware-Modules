package flasher

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum


class Flasher extends Module{
    val io = IO(new Bundle{
        val start = Input(Bool())
        val light = Output(Bool())
    })

    object TimerState extends  ChiselEnum{
        val timmerOff, timerRunning = Value
    }

    import TimerState._
    val timerstate = RegInit(timmerOff)
    val timer = RegInit(0.U(3.W))
    val timerDone = timer === 0.U
    val timerLoad = WireDefault(false.B)
    val timerSelect = WireDefault(false.B)


    switch(timerstate){
        is(timmerOff){
            when(timerSelect){
                timer := 3.U
            }.otherwise{
                timer := 5.U
            }
            when(timerLoad){
                timerstate := timerRunning
            }
        }
        is(timerRunning){
            when(!timerDone ){
                timer := timer -1.U
            }
            when(timerDone){
                timerstate := timmerOff
            }
        }
    }

    


    object State extends ChiselEnum{
        val off, flash1, space1, flash2, space2 = Value
    }

    import State._

    val currentState = RegInit(off)
    
    io.light := false.B

    switch(currentState){
        is(off){
            when(io.start){
                currentState := flash1
            }
        }
        is(flash1){
            timerLoad := true.B
            io.light := true.B
            when(timerDone){
                currentState := space1
            }
        }
        is(space1){
            timerSelect := true.B
            timerLoad := true.B
            when(timerDone){
                currentState := flash2
            }
        }
        is(flash2){
            timerLoad := true.B
            io.light := true.B
            when(timerDone){
                currentState := space2
            }
        }
        is(space2){
            timerSelect := true.B
            timerLoad := true.B
            when(timerDone){
                currentState := off
            }
        }
    }
}