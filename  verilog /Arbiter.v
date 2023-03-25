module Arbiter(
  input        clock,
  input        reset,
  input  [9:0] io_request,
  output       io_grant_0,
  output       io_grant_1,
  output       io_grant_2,
  output       io_grant_3,
  output       io_grant_4,
  output       io_grant_5,
  output       io_grant_6,
  output       io_grant_7,
  output       io_grant_8,
  output       io_grant_9
);
  assign io_grant_0 = io_request[0]; // @[Arbiter.scala 11:30]
  assign io_grant_1 = io_request[1] & io_grant_0; // @[Arbiter.scala 14:38]
  assign io_grant_2 = io_request[2] & io_grant_1; // @[Arbiter.scala 14:38]
  assign io_grant_3 = io_request[3] & io_grant_2; // @[Arbiter.scala 14:38]
  assign io_grant_4 = io_request[4] & io_grant_3; // @[Arbiter.scala 14:38]
  assign io_grant_5 = io_request[5] & io_grant_4; // @[Arbiter.scala 14:38]
  assign io_grant_6 = io_request[6] & io_grant_5; // @[Arbiter.scala 14:38]
  assign io_grant_7 = io_request[7] & io_grant_6; // @[Arbiter.scala 14:38]
  assign io_grant_8 = io_request[8] & io_grant_7; // @[Arbiter.scala 14:38]
  assign io_grant_9 = io_request[9] & io_grant_8; // @[Arbiter.scala 14:38]
endmodule
