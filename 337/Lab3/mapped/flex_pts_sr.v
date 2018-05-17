/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Jan 31 12:30:20 2018
/////////////////////////////////////////////////////////////


module flex_pts_sr ( clk, n_rst, shift_enable, load_enable, parallel_in, 
        serial_out );
  input [3:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30;
  wire   [2:0] tempS;

  DFFSR \tempS_reg[0]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[0])
         );
  DFFSR \tempS_reg[1]  ( .D(n20), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[1])
         );
  DFFSR \tempS_reg[2]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(tempS[2])
         );
  DFFSR \tempS_reg[3]  ( .D(n18), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        serial_out) );
  OAI21X1 U22 ( .A(n21), .B(n22), .C(n23), .Y(n20) );
  AOI22X1 U23 ( .A(tempS[0]), .B(n24), .C(tempS[1]), .D(n25), .Y(n23) );
  INVX1 U24 ( .A(parallel_in[1]), .Y(n22) );
  OAI21X1 U25 ( .A(n21), .B(n26), .C(n27), .Y(n19) );
  AOI22X1 U26 ( .A(tempS[1]), .B(n24), .C(tempS[2]), .D(n25), .Y(n27) );
  INVX1 U27 ( .A(parallel_in[2]), .Y(n26) );
  OAI21X1 U28 ( .A(n21), .B(n28), .C(n29), .Y(n18) );
  AOI22X1 U29 ( .A(tempS[2]), .B(n24), .C(serial_out), .D(n25), .Y(n29) );
  AND2X1 U30 ( .A(shift_enable), .B(n21), .Y(n24) );
  INVX1 U31 ( .A(parallel_in[3]), .Y(n28) );
  INVX1 U32 ( .A(load_enable), .Y(n21) );
  INVX1 U33 ( .A(n30), .Y(n17) );
  MUX2X1 U34 ( .B(parallel_in[0]), .A(tempS[0]), .S(n25), .Y(n30) );
  NOR2X1 U35 ( .A(load_enable), .B(shift_enable), .Y(n25) );
endmodule

