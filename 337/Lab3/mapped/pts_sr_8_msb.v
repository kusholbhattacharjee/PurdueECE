/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Jan 31 12:24:54 2018
/////////////////////////////////////////////////////////////


module flex_pts_sr_NUM_BITS8_SHIFT_MSB1 ( clk, n_rst, shift_enable, 
        load_enable, parallel_in, serial_out );
  input [7:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n28, n29, n30, n31, n32, n33, n34, n35, n36, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17;
  wire   [7:0] tempS;

  DFFSR \tempS_reg[0]  ( .D(n28), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[0])
         );
  DFFSR \tempS_reg[1]  ( .D(n36), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[1])
         );
  DFFSR \tempS_reg[2]  ( .D(n35), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[2])
         );
  DFFSR \tempS_reg[3]  ( .D(n34), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[3])
         );
  DFFSR \tempS_reg[4]  ( .D(n33), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[4])
         );
  DFFSR \tempS_reg[5]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[5])
         );
  DFFSR \tempS_reg[6]  ( .D(n31), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[6])
         );
  DFFSR \tempS_reg[7]  ( .D(n30), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[7])
         );
  LATCH serial_out_reg ( .CLK(n29), .D(tempS[7]), .Q(serial_out) );
  OAI21X1 U3 ( .A(n29), .B(n1), .C(n2), .Y(n36) );
  AOI22X1 U4 ( .A(tempS[0]), .B(n3), .C(tempS[1]), .D(n4), .Y(n2) );
  INVX1 U5 ( .A(parallel_in[1]), .Y(n1) );
  OAI21X1 U6 ( .A(n29), .B(n5), .C(n6), .Y(n35) );
  AOI22X1 U7 ( .A(tempS[1]), .B(n3), .C(tempS[2]), .D(n4), .Y(n6) );
  INVX1 U8 ( .A(parallel_in[2]), .Y(n5) );
  OAI21X1 U9 ( .A(n29), .B(n7), .C(n8), .Y(n34) );
  AOI22X1 U10 ( .A(tempS[2]), .B(n3), .C(tempS[3]), .D(n4), .Y(n8) );
  INVX1 U11 ( .A(parallel_in[3]), .Y(n7) );
  OAI21X1 U12 ( .A(n29), .B(n9), .C(n10), .Y(n33) );
  AOI22X1 U13 ( .A(tempS[3]), .B(n3), .C(tempS[4]), .D(n4), .Y(n10) );
  INVX1 U14 ( .A(parallel_in[4]), .Y(n9) );
  OAI21X1 U15 ( .A(n29), .B(n11), .C(n12), .Y(n32) );
  AOI22X1 U16 ( .A(tempS[4]), .B(n3), .C(tempS[5]), .D(n4), .Y(n12) );
  INVX1 U17 ( .A(parallel_in[5]), .Y(n11) );
  OAI21X1 U18 ( .A(n29), .B(n13), .C(n14), .Y(n31) );
  AOI22X1 U19 ( .A(tempS[5]), .B(n3), .C(tempS[6]), .D(n4), .Y(n14) );
  INVX1 U20 ( .A(parallel_in[6]), .Y(n13) );
  OAI21X1 U21 ( .A(n29), .B(n15), .C(n16), .Y(n30) );
  AOI22X1 U22 ( .A(tempS[6]), .B(n3), .C(tempS[7]), .D(n4), .Y(n16) );
  NOR2X1 U23 ( .A(n4), .B(load_enable), .Y(n3) );
  INVX1 U24 ( .A(parallel_in[7]), .Y(n15) );
  INVX1 U25 ( .A(load_enable), .Y(n29) );
  INVX1 U26 ( .A(n17), .Y(n28) );
  MUX2X1 U27 ( .B(parallel_in[0]), .A(tempS[0]), .S(n4), .Y(n17) );
  NOR2X1 U28 ( .A(shift_enable), .B(load_enable), .Y(n4) );
endmodule


module pts_sr_8_msb ( clk, n_rst, shift_enable, load_enable, parallel_in, 
        serial_out );
  input [7:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;


  flex_pts_sr_NUM_BITS8_SHIFT_MSB1 CORE ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_enable), .load_enable(load_enable), .parallel_in(
        parallel_in), .serial_out(serial_out) );
endmodule

