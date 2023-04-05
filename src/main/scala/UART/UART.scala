package uart

import chisel3._
import chisel3.util._

class UARTIO extends DecoupledIO(UInt(8.W)){

}


class TX(frequency : Int, baudRate: Int) extends Module{
    val io = IO(new Bundle{
        val txd = Output(Bool())
        val chan = Flipped(new UARTIO())
    })

    val BIT_COUNT = (( frequency + baudRate / 2) / baudRate -1).asUInt()

    val cnt_reg = RegInit(0.U(20.W))
    val bits_reg = RegInit(0.U(8.W))
    val shift_reg = RegInit(0x7ff.U)

    io.chan.ready := (cnt_reg === 0.U) && ( bits_reg === 0.U)
    io.txd := shift_reg(0)

    when(cnt_reg === 0.U){

        cnt_reg := BIT_COUNT

        when(bits_reg === 0.U){
            when(io.chan.valid){
                bits_reg := 11.U
                shift_reg := 3.U(2.W) ## io.chan.bits ## 0.U(1.W)
            }.otherwise{
                shift_reg := 0x7ff.U
            }
        }.otherwise{
            bits_reg := bits_reg - 1.U
            val shiftwire = shift_reg >>1
            shift_reg := 1.U(1.W) ## shiftwire
        }

    }.otherwise{
        cnt_reg := cnt_reg -1.U
    }


}


class  RX(frequency : Int, baudRate :Int) extends  Module{
    val io = IO(new Bundle{
        val rxd = Input(Bool())
        val chan = new UARTIO()
    })

    val BIT_COUNT = (( frequency + baudRate / 2) / baudRate - 1).U
    val START_COUNT = ((3 * frequency / 2 + baudRate / 2) /baudRate - 1).U

    val cnt_reg = RegInit(0.U(20.W))
    val bits_reg = RegInit(0.U(8.W))
    val shift_reg = RegInit(0.U(8.W))
    val valid_reg = RegInit(false.B)

    val syncReg =RegNext(RegNext(io.rxd,1.U(1.W)),1.U(1.W))

    when(cnt_reg =/= 0.U){
        cnt_reg := cnt_reg -1.U
    }.elsewhen( bits_reg =/= 0.U){
        bits_reg := bits_reg - 1.U
        cnt_reg := BIT_COUNT
        shift_reg :=  syncReg ## shift_reg(7,1) 

        when(bits_reg === 1.U){
            valid_reg := true.B
        }

    }.elsewhen(syncReg === 0.U){
        cnt_reg := START_COUNT
        bits_reg := 11.U
    }

    when(io.chan.ready && valid_reg){
        valid_reg := false.B
    }

    io.chan.bits := shift_reg
    io.chan.valid := valid_reg
}
