/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Jan 31 12:25:00 2018
/////////////////////////////////////////////////////////////


module flex_pts_sr_NUM_BITS4_SHIFT_MSB0 ( clk, n_rst, shift_enable, 
        load_enable, parallel_in, serial_out );
  input [3:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n16, n17, n18, n19, n20, n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [3:0] tempS;

  DFFSR \tempS_reg[3]  ( .D(n16), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[3])
         );
  DFFSR \tempS_reg[2]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[2])
         );
  DFFSR \tempS_reg[1]  ( .D(n20), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[1])
         );
  DFFSR \tempS_reg[0]  ( .D(n18), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[0])
         );
  LATCH serial_out_reg ( .CLK(n17), .D(tempS[0]), .Q(serial_out) );
  OAI21X1 U3 ( .A(n17), .B(n1), .C(n2), .Y(n20) );
  AOI22X1 U4 ( .A(tempS[2]), .B(n3), .C(tempS[1]), .D(n4), .Y(n2) );
  INVX1 U5 ( .A(parallel_in[1]), .Y(n1) );
  OAI21X1 U6 ( .A(n17), .B(n5), .C(n6), .Y(n19) );
  AOI22X1 U7 ( .A(tempS[3]), .B(n3), .C(n4), .D(tempS[2]), .Y(n6) );
  INVX1 U8 ( .A(parallel_in[2]), .Y(n5) );
  OAI21X1 U9 ( .A(n17), .B(n7), .C(n8), .Y(n18) );
  AOI22X1 U10 ( .A(tempS[1]), .B(n3), .C(tempS[0]), .D(n4), .Y(n8) );
  AND2X1 U11 ( .A(shift_enable), .B(n17), .Y(n3) );
  INVX1 U12 ( .A(parallel_in[0]), .Y(n7) );
  INVX1 U13 ( .A(load_enable), .Y(n17) );
  INVX1 U14 ( .A(n9), .Y(n16) );
  MUX2X1 U15 ( .B(parallel_in[3]), .A(tempS[3]), .S(n4), .Y(n9) );
  NOR2X1 U16 ( .A(load_enable), .B(shift_enable), .Y(n4) );
endmodule


module pts_sr_4_lsb ( clk, n_rst, shift_enable, load_enable, parallel_in, 
        serial_out );
  input [3:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;


  flex_pts_sr_NUM_BITS4_SHIFT_MSB0 CORE ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_enable), .load_enable(load_enable), .parallel_in(
        parallel_in), .serial_out(serial_out) );
endmodule

