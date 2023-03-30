module MinimumSearch(
  input        clock,
  input        reset,
  input  [7:0] io_in_0,
  input  [7:0] io_in_1,
  input  [7:0] io_in_2,
  input  [7:0] io_in_3,
  input  [7:0] io_in_4,
  input  [7:0] io_in_5,
  input  [7:0] io_in_6,
  input  [7:0] io_in_7,
  input  [7:0] io_in_8,
  input  [7:0] io_in_9,
  output [7:0] io_out
);
  wire [7:0] _minim_T_1 = io_in_6 < io_in_7 ? io_in_6 : io_in_7; // @[MinimumSearch.scala 14:52]
  wire [7:0] _minim_T_3 = io_in_8 < io_in_9 ? io_in_8 : io_in_9; // @[MinimumSearch.scala 14:52]
  wire [7:0] _minim_T_5 = io_in_0 < io_in_1 ? io_in_0 : io_in_1; // @[MinimumSearch.scala 14:52]
  wire [7:0] _minim_T_7 = io_in_2 < io_in_3 ? io_in_2 : io_in_3; // @[MinimumSearch.scala 14:52]
  wire [7:0] _minim_T_9 = io_in_4 < io_in_5 ? io_in_4 : io_in_5; // @[MinimumSearch.scala 14:52]
  wire [7:0] _minim_T_11 = _minim_T_1 < _minim_T_3 ? _minim_T_1 : _minim_T_3; // @[MinimumSearch.scala 14:52]
  wire [7:0] _minim_T_13 = _minim_T_5 < _minim_T_7 ? _minim_T_5 : _minim_T_7; // @[MinimumSearch.scala 14:52]
  wire [7:0] _minim_T_15 = _minim_T_9 < _minim_T_11 ? _minim_T_9 : _minim_T_11; // @[MinimumSearch.scala 14:52]
  assign io_out = _minim_T_13 < _minim_T_15 ? _minim_T_13 : _minim_T_15; // @[MinimumSearch.scala 14:52]
endmodule
