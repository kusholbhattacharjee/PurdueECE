/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb 22 12:36:43 2018
/////////////////////////////////////////////////////////////


module decode ( clk, n_rst, d_plus, shift_enable, eop, d_orig );
  input clk, n_rst, d_plus, shift_enable, eop;
  output d_orig;
  wire   d_old, d_curr, current, n5, n6, n7, n9, n10, n11, n12;

  DFFSR d_curr_reg ( .D(current), .CLK(clk), .R(n6), .S(n7), .Q(d_curr) );
  DFFSR d_old_reg ( .D(n5), .CLK(clk), .R(n6), .S(n7), .Q(d_old) );
  NAND2X1 U12 ( .A(d_plus), .B(n9), .Y(n7) );
  INVX1 U13 ( .A(n_rst), .Y(n9) );
  OR2X1 U14 ( .A(n_rst), .B(d_plus), .Y(n6) );
  MUX2X1 U15 ( .B(n10), .A(n11), .S(shift_enable), .Y(n5) );
  NOR2X1 U16 ( .A(d_plus), .B(eop), .Y(n11) );
  XOR2X1 U17 ( .A(n10), .B(d_curr), .Y(d_orig) );
  INVX1 U18 ( .A(d_old), .Y(n10) );
  INVX1 U19 ( .A(n12), .Y(current) );
  AOI21X1 U20 ( .A(shift_enable), .B(eop), .C(d_plus), .Y(n12) );
endmodule

