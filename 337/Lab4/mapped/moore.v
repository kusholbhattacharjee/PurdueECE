/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Feb  5 01:24:13 2018
/////////////////////////////////////////////////////////////


module moore ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28;
  wire   [2:0] current;
  wire   [2:0] next;

  DFFSR \current_reg[0]  ( .D(next[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current[0]) );
  DFFSR \current_reg[1]  ( .D(next[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current[1]) );
  DFFSR \current_reg[2]  ( .D(next[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current[2]) );
  NOR2X1 U23 ( .A(n18), .B(n19), .Y(o) );
  OR2X1 U24 ( .A(current[0]), .B(current[1]), .Y(n19) );
  OAI21X1 U25 ( .A(n20), .B(n21), .C(n22), .Y(next[2]) );
  OAI21X1 U26 ( .A(current[0]), .B(current[1]), .C(current[2]), .Y(n22) );
  NAND2X1 U27 ( .A(current[1]), .B(current[0]), .Y(n21) );
  OAI21X1 U28 ( .A(n20), .B(n23), .C(n24), .Y(next[1]) );
  OAI21X1 U29 ( .A(current[2]), .B(n25), .C(current[1]), .Y(n24) );
  MUX2X1 U30 ( .B(n26), .A(current[2]), .S(n25), .Y(n23) );
  NOR2X1 U31 ( .A(current[2]), .B(current[1]), .Y(n26) );
  MUX2X1 U32 ( .B(n25), .A(n27), .S(n18), .Y(next[0]) );
  INVX1 U33 ( .A(current[2]), .Y(n18) );
  NAND2X1 U34 ( .A(n28), .B(n25), .Y(n27) );
  XNOR2X1 U35 ( .A(n20), .B(current[1]), .Y(n28) );
  INVX1 U36 ( .A(i), .Y(n20) );
  INVX1 U37 ( .A(current[0]), .Y(n25) );
endmodule

