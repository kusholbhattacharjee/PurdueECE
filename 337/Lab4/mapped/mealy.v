/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Feb  5 01:29:56 2018
/////////////////////////////////////////////////////////////


module mealy ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   N15, N16, n11, n12, n13, n14;
  wire   [2:0] current;

  DFFSR \current_reg[0]  ( .D(N15), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current[0]) );
  DFFSR \current_reg[1]  ( .D(N16), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current[1]) );
  NOR2X1 U16 ( .A(n11), .B(n12), .Y(o) );
  NAND2X1 U17 ( .A(current[1]), .B(current[0]), .Y(n12) );
  INVX1 U18 ( .A(n13), .Y(N16) );
  MUX2X1 U19 ( .B(current[1]), .A(i), .S(current[0]), .Y(n13) );
  NOR2X1 U20 ( .A(current[0]), .B(n14), .Y(N15) );
  XOR2X1 U21 ( .A(current[1]), .B(n11), .Y(n14) );
  INVX1 U22 ( .A(i), .Y(n11) );
endmodule

