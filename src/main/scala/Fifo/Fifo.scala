package fifo

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum

class WriterIO[T <: Data : Manifest](private val gen : T) extends Bundle{
    val write = Input(Bool())
    val full = Output(Bool())
    val din = Input(gen)
}

class  ReaderIO[T <: Data : Manifest](private val gen : T) extends Bundle{
    val read = Input(Bool())
    val empty = Output(Bool())
    val dout = Output(gen)
}


class Fifo[T <: Data : Manifest](private val gen : T,fifosize :Int) extends Module{
    val io = IO(new Bundle{
        val in = new WriterIO(gen)
        val out = new ReaderIO(gen)
    })

    val buffer = Reg(Vec(fifosize,gen))
    val indexer = RegInit((fifosize-1).U)
    val full = RegInit(false.B)
    val empty = RegInit(true.B)


    io.in.full := full
    io.out.empty := empty
    

    full := false.B
    empty := true.B

    when(io.in.write && !full){

        buffer(indexer) := io.in.din
        indexer := indexer - 1.U
        when(indexer === 0.U){
            full := true.B
        }

    }.elsewhen(io.out.read && !empty){

        buffer.reduce((prev,next)=>{
            next := prev
            prev
        })
        when(indexer === (fifosize-1).U){
            empty := true.B
        }.otherwise{
            empty := false.B
            indexer := indexer + 1.U
        }
    }
    
    io.out.dout := buffer((fifosize-1).U)

}