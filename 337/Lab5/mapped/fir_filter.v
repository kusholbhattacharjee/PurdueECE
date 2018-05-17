/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb 15 17:51:52 2018
/////////////////////////////////////////////////////////////


module controller ( clk, n_reset, dr, lc, overflow, cnt_up, clear, err, 
        modwait, op, src1, src2, dest );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_reset, dr, lc, overflow;
  output cnt_up, clear, err, modwait;
  wire   next_mod, n100, n133, n134, n135, n136, n137, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n35, n36, n37, n38, n40, n41,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160;
  wire   [4:0] state;

  DFFSR \state_reg[0]  ( .D(n137), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[1]  ( .D(n133), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[4]  ( .D(n136), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[4]) );
  DFFSR \state_reg[2]  ( .D(n134), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[2]) );
  DFFSR \state_reg[3]  ( .D(n135), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        state[3]) );
  DFFSR temp_mod_reg ( .D(next_mod), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        modwait) );
  INVX2 U9 ( .A(n46), .Y(n67) );
  AND2X2 U10 ( .A(n107), .B(n73), .Y(n7) );
  AND2X2 U11 ( .A(n132), .B(n131), .Y(n8) );
  OR2X2 U12 ( .A(lc), .B(n100), .Y(n9) );
  AND2X2 U13 ( .A(n76), .B(n75), .Y(n10) );
  BUFX2 U14 ( .A(n147), .Y(n11) );
  INVX1 U15 ( .A(n47), .Y(n12) );
  INVX1 U16 ( .A(n47), .Y(n96) );
  INVX1 U17 ( .A(n46), .Y(n13) );
  AND2X2 U18 ( .A(n109), .B(n108), .Y(n14) );
  AND2X1 U19 ( .A(n109), .B(n108), .Y(n43) );
  INVX1 U20 ( .A(n38), .Y(n15) );
  INVX1 U21 ( .A(n38), .Y(n16) );
  INVX2 U22 ( .A(n38), .Y(n115) );
  BUFX2 U23 ( .A(n142), .Y(n17) );
  BUFX2 U24 ( .A(n108), .Y(n18) );
  INVX1 U25 ( .A(overflow), .Y(n84) );
  BUFX2 U26 ( .A(n109), .Y(n19) );
  BUFX2 U27 ( .A(n35), .Y(n20) );
  INVX1 U28 ( .A(n16), .Y(n21) );
  AND2X2 U29 ( .A(n16), .B(n125), .Y(n36) );
  BUFX2 U30 ( .A(n107), .Y(n22) );
  INVX1 U31 ( .A(n156), .Y(n23) );
  BUFX2 U32 ( .A(n13), .Y(n24) );
  AND2X2 U33 ( .A(n18), .B(n148), .Y(n33) );
  BUFX2 U34 ( .A(n106), .Y(n25) );
  OR2X2 U35 ( .A(src2[2]), .B(n29), .Y(src2[1]) );
  INVX1 U36 ( .A(src2[2]), .Y(n153) );
  BUFX2 U37 ( .A(n37), .Y(n26) );
  INVX2 U38 ( .A(n144), .Y(n145) );
  NAND2X1 U39 ( .A(n27), .B(n7), .Y(n28) );
  NAND2X1 U40 ( .A(n28), .B(overflow), .Y(n74) );
  INVX1 U41 ( .A(src1[3]), .Y(n27) );
  AND2X2 U42 ( .A(n147), .B(n143), .Y(n32) );
  NAND2X1 U43 ( .A(n7), .B(n142), .Y(n29) );
  BUFX2 U44 ( .A(n36), .Y(n30) );
  AND2X1 U45 ( .A(n153), .B(n120), .Y(n31) );
  AND2X1 U46 ( .A(n148), .B(n76), .Y(n77) );
  OR2X1 U47 ( .A(n129), .B(n128), .Y(dest[0]) );
  AND2X2 U48 ( .A(n38), .B(n125), .Y(n35) );
  INVX2 U49 ( .A(state[4]), .Y(n106) );
  AND2X2 U50 ( .A(state[0]), .B(n115), .Y(n37) );
  INVX4 U51 ( .A(n40), .Y(n156) );
  BUFX4 U52 ( .A(state[2]), .Y(n38) );
  INVX4 U53 ( .A(n32), .Y(src2[2]) );
  BUFX4 U54 ( .A(state[1]), .Y(n40) );
  BUFX2 U55 ( .A(state[3]), .Y(n41) );
  NAND2X1 U56 ( .A(n31), .B(n119), .Y(n122) );
  NOR2X1 U57 ( .A(n49), .B(n44), .Y(src1[3]) );
  NAND2X1 U58 ( .A(n38), .B(state[0]), .Y(n44) );
  INVX2 U59 ( .A(n44), .Y(n51) );
  NAND3X1 U60 ( .A(n23), .B(n41), .C(n25), .Y(n45) );
  INVX2 U61 ( .A(n45), .Y(n160) );
  NAND2X1 U62 ( .A(n51), .B(n160), .Y(n76) );
  INVX2 U63 ( .A(state[3]), .Y(n82) );
  NAND3X1 U64 ( .A(state[4]), .B(n156), .C(n82), .Y(n46) );
  INVX2 U65 ( .A(state[0]), .Y(n125) );
  NAND2X1 U66 ( .A(n24), .B(n30), .Y(n75) );
  NAND2X1 U67 ( .A(n20), .B(n160), .Y(n88) );
  NAND2X1 U68 ( .A(n10), .B(n88), .Y(n100) );
  NAND2X1 U69 ( .A(n67), .B(n35), .Y(n109) );
  NAND3X1 U70 ( .A(state[4]), .B(n40), .C(n82), .Y(n47) );
  NAND2X1 U71 ( .A(n35), .B(n12), .Y(n150) );
  NAND3X1 U72 ( .A(n41), .B(n106), .C(n156), .Y(n48) );
  INVX2 U73 ( .A(n48), .Y(n57) );
  NAND2X1 U74 ( .A(n36), .B(n57), .Y(n73) );
  NAND3X1 U75 ( .A(n109), .B(n150), .C(n73), .Y(n56) );
  NAND3X1 U76 ( .A(n82), .B(n106), .C(n156), .Y(n49) );
  INVX2 U77 ( .A(n49), .Y(n70) );
  NAND3X1 U78 ( .A(n106), .B(n40), .C(n82), .Y(n50) );
  INVX2 U79 ( .A(n50), .Y(n69) );
  NAND2X1 U80 ( .A(n51), .B(n69), .Y(n142) );
  NAND2X1 U81 ( .A(n27), .B(n142), .Y(n85) );
  INVX2 U82 ( .A(n85), .Y(n54) );
  NAND2X1 U83 ( .A(n160), .B(n26), .Y(n127) );
  NAND2X1 U84 ( .A(n160), .B(n30), .Y(n154) );
  NAND2X1 U85 ( .A(n127), .B(n154), .Y(n59) );
  INVX2 U86 ( .A(n59), .Y(n132) );
  NAND2X1 U87 ( .A(n13), .B(n51), .Y(n149) );
  NAND2X1 U88 ( .A(n132), .B(n149), .Y(n90) );
  INVX2 U89 ( .A(n90), .Y(n110) );
  NAND2X1 U90 ( .A(n20), .B(n57), .Y(n102) );
  INVX2 U91 ( .A(n102), .Y(n52) );
  NAND2X1 U92 ( .A(n37), .B(n96), .Y(n144) );
  NAND2X1 U93 ( .A(n51), .B(n57), .Y(n58) );
  NAND2X1 U94 ( .A(n144), .B(n58), .Y(n129) );
  NOR2X1 U95 ( .A(n52), .B(n129), .Y(n53) );
  NAND3X1 U96 ( .A(n54), .B(n110), .C(n53), .Y(n55) );
  OR2X1 U97 ( .A(n56), .B(n55), .Y(op[0]) );
  NAND2X1 U98 ( .A(n69), .B(n36), .Y(n147) );
  NAND2X1 U99 ( .A(n70), .B(n37), .Y(n143) );
  NAND2X1 U100 ( .A(n26), .B(n57), .Y(n157) );
  INVX2 U101 ( .A(dr), .Y(n63) );
  NAND2X1 U102 ( .A(n70), .B(n30), .Y(n66) );
  INVX2 U103 ( .A(n66), .Y(n98) );
  NOR2X1 U104 ( .A(n100), .B(n98), .Y(n61) );
  NAND2X1 U105 ( .A(n102), .B(n58), .Y(n139) );
  NOR2X1 U106 ( .A(n139), .B(n59), .Y(n60) );
  MUX2X1 U107 ( .B(n61), .A(n60), .S(lc), .Y(n62) );
  OAI21X1 U108 ( .A(n63), .B(n9), .C(n62), .Y(n64) );
  OAI21X1 U109 ( .A(dr), .B(n157), .C(n64), .Y(n65) );
  INVX2 U110 ( .A(n65), .Y(n121) );
  NAND2X1 U111 ( .A(n35), .B(n69), .Y(n107) );
  NAND2X1 U112 ( .A(n24), .B(n26), .Y(n131) );
  NAND3X1 U113 ( .A(n22), .B(n131), .C(n157), .Y(n68) );
  NOR2X1 U114 ( .A(n98), .B(n68), .Y(n72) );
  NAND2X1 U115 ( .A(n69), .B(n37), .Y(n108) );
  NAND2X1 U116 ( .A(n35), .B(n70), .Y(n148) );
  NAND2X1 U117 ( .A(n33), .B(n153), .Y(n138) );
  NOR3X1 U118 ( .A(n100), .B(op[0]), .C(n138), .Y(n71) );
  NAND2X1 U119 ( .A(n72), .B(n71), .Y(n95) );
  NAND2X1 U120 ( .A(n121), .B(n95), .Y(n86) );
  INVX2 U121 ( .A(n86), .Y(n126) );
  OAI21X1 U122 ( .A(dr), .B(n131), .C(n74), .Y(n118) );
  NAND3X1 U123 ( .A(n88), .B(n127), .C(n75), .Y(n117) );
  NAND2X1 U124 ( .A(lc), .B(n98), .Y(n92) );
  NAND3X1 U125 ( .A(n77), .B(n154), .C(n92), .Y(n78) );
  NOR2X1 U126 ( .A(n117), .B(n78), .Y(n79) );
  OAI21X1 U127 ( .A(n17), .B(n84), .C(n79), .Y(n80) );
  OAI21X1 U128 ( .A(n118), .B(n80), .C(n121), .Y(n81) );
  OAI21X1 U129 ( .A(n126), .B(n82), .C(n81), .Y(n135) );
  INVX2 U130 ( .A(n131), .Y(n83) );
  NAND2X1 U131 ( .A(n83), .B(dr), .Y(n94) );
  AOI22X1 U132 ( .A(n23), .B(n86), .C(n85), .D(n84), .Y(n87) );
  AND2X2 U133 ( .A(n94), .B(n87), .Y(n93) );
  NAND3X1 U134 ( .A(n11), .B(n18), .C(n88), .Y(n89) );
  NOR2X1 U135 ( .A(n90), .B(n89), .Y(n91) );
  NAND3X1 U136 ( .A(n93), .B(n92), .C(n91), .Y(n133) );
  NAND3X1 U137 ( .A(n95), .B(n144), .C(n94), .Y(n104) );
  NAND2X1 U138 ( .A(n12), .B(n30), .Y(n155) );
  INVX2 U139 ( .A(lc), .Y(n97) );
  INVX2 U140 ( .A(n157), .Y(err) );
  AOI21X1 U141 ( .A(n98), .B(n97), .C(err), .Y(n99) );
  NAND3X1 U142 ( .A(n19), .B(n155), .C(n99), .Y(n101) );
  INVX2 U143 ( .A(n101), .Y(n116) );
  NAND3X1 U144 ( .A(n116), .B(n102), .C(n149), .Y(n103) );
  NOR2X1 U145 ( .A(n104), .B(n103), .Y(n105) );
  MUX2X1 U146 ( .B(n25), .A(n105), .S(n121), .Y(n136) );
  OAI21X1 U147 ( .A(overflow), .B(n22), .C(n144), .Y(n113) );
  NAND3X1 U148 ( .A(n110), .B(n153), .C(n14), .Y(n111) );
  INVX2 U149 ( .A(n111), .Y(n130) );
  NAND2X1 U150 ( .A(n10), .B(n130), .Y(n112) );
  OAI21X1 U151 ( .A(n113), .B(n112), .C(n121), .Y(n114) );
  OAI21X1 U152 ( .A(n126), .B(n15), .C(n114), .Y(n134) );
  NAND3X1 U153 ( .A(n116), .B(n150), .C(n17), .Y(n123) );
  INVX2 U154 ( .A(n117), .Y(n120) );
  INVX2 U155 ( .A(n118), .Y(n119) );
  OAI21X1 U156 ( .A(n123), .B(n122), .C(n121), .Y(n124) );
  OAI21X1 U157 ( .A(n126), .B(n125), .C(n124), .Y(n137) );
  NAND3X1 U158 ( .A(n149), .B(n131), .C(n127), .Y(n128) );
  NAND2X1 U159 ( .A(n148), .B(n130), .Y(dest[1]) );
  NAND2X1 U160 ( .A(n8), .B(n150), .Y(dest[2]) );
  INVX2 U161 ( .A(n138), .Y(n141) );
  INVX2 U162 ( .A(n139), .Y(n140) );
  NAND2X1 U163 ( .A(n141), .B(n140), .Y(dest[3]) );
  NAND2X1 U164 ( .A(n11), .B(n148), .Y(src2[0]) );
  NAND3X1 U165 ( .A(n33), .B(n7), .C(n142), .Y(src2[3]) );
  NAND3X1 U166 ( .A(n143), .B(n150), .C(n14), .Y(src1[0]) );
  NOR2X1 U167 ( .A(src1[3]), .B(n145), .Y(n146) );
  NAND3X1 U168 ( .A(n147), .B(n43), .C(n146), .Y(src1[1]) );
  NAND3X1 U169 ( .A(n150), .B(n149), .C(n148), .Y(src1[2]) );
  INVX2 U170 ( .A(dest[3]), .Y(n151) );
  NAND2X1 U171 ( .A(n151), .B(n8), .Y(op[1]) );
  INVX2 U172 ( .A(src2[3]), .Y(n152) );
  NAND2X1 U173 ( .A(n153), .B(n152), .Y(op[2]) );
  INVX2 U174 ( .A(n154), .Y(clear) );
  INVX2 U175 ( .A(n155), .Y(cnt_up) );
  NAND2X1 U176 ( .A(n30), .B(n156), .Y(n158) );
  OAI21X1 U177 ( .A(n41), .B(n158), .C(n157), .Y(n159) );
  AOI21X1 U178 ( .A(n21), .B(n160), .C(n159), .Y(next_mod) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;

  wire   [10:2] carry;

  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(SUM[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_1 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N18, N19, N20, N21,
         N22, N23, N24, N25, N26, N27, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, N53, N52, N51, N50, N49,
         N48, N47, N46, N45, N44, \mult_add_36_aco/b , n1, n2, n4, n5, n6, n18,
         n19, n20, n21, n22, n23, n24;

  DFFSR \count_out_reg[9]  ( .D(n1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[8]  ( .D(n2), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[7]  ( .D(n4), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[6]  ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[5]  ( .D(n6), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[4]  ( .D(n18), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(n19), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(n20), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n21), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[0]  ( .D(n22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(n61), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U28 ( .A(\mult_add_36_aco/b ), .B(n23), .C(n31), .Y(n61) );
  NAND2X1 U29 ( .A(n32), .B(n33), .Y(n31) );
  NOR2X1 U30 ( .A(n34), .B(n35), .Y(n33) );
  NAND3X1 U31 ( .A(n36), .B(n37), .C(n38), .Y(n35) );
  XNOR2X1 U32 ( .A(rollover_val[3]), .B(N8), .Y(n38) );
  XNOR2X1 U33 ( .A(rollover_val[9]), .B(N14), .Y(n37) );
  XNOR2X1 U34 ( .A(rollover_val[5]), .B(N10), .Y(n36) );
  NAND2X1 U35 ( .A(n39), .B(n40), .Y(n34) );
  XNOR2X1 U36 ( .A(rollover_val[7]), .B(N12), .Y(n40) );
  NOR2X1 U37 ( .A(N15), .B(n41), .Y(n39) );
  NOR2X1 U38 ( .A(n42), .B(n43), .Y(n32) );
  NAND3X1 U39 ( .A(n44), .B(n45), .C(n46), .Y(n43) );
  XNOR2X1 U40 ( .A(rollover_val[1]), .B(N6), .Y(n46) );
  XNOR2X1 U41 ( .A(rollover_val[0]), .B(N5), .Y(n45) );
  XNOR2X1 U42 ( .A(rollover_val[4]), .B(N9), .Y(n44) );
  NAND3X1 U43 ( .A(n47), .B(n48), .C(n49), .Y(n42) );
  XNOR2X1 U44 ( .A(rollover_val[6]), .B(N11), .Y(n49) );
  XNOR2X1 U45 ( .A(rollover_val[2]), .B(N7), .Y(n48) );
  XNOR2X1 U46 ( .A(rollover_val[8]), .B(N13), .Y(n47) );
  AOI22X1 U47 ( .A(N18), .B(n23), .C(count_out[0]), .D(n51), .Y(n50) );
  AOI22X1 U48 ( .A(N19), .B(n23), .C(count_out[1]), .D(n51), .Y(n52) );
  AOI22X1 U49 ( .A(N20), .B(n23), .C(count_out[2]), .D(n51), .Y(n53) );
  AOI22X1 U50 ( .A(N21), .B(n23), .C(count_out[3]), .D(n51), .Y(n54) );
  AOI22X1 U51 ( .A(N22), .B(n23), .C(count_out[4]), .D(n51), .Y(n55) );
  AOI22X1 U52 ( .A(N23), .B(n23), .C(count_out[5]), .D(n51), .Y(n56) );
  AOI22X1 U53 ( .A(N24), .B(n23), .C(count_out[6]), .D(n51), .Y(n57) );
  AOI22X1 U54 ( .A(N25), .B(n23), .C(count_out[7]), .D(n51), .Y(n58) );
  AOI22X1 U55 ( .A(N26), .B(n23), .C(count_out[8]), .D(n51), .Y(n59) );
  AOI22X1 U56 ( .A(N27), .B(n23), .C(count_out[9]), .D(n51), .Y(n60) );
  NOR2X1 U57 ( .A(clear), .B(n23), .Y(n51) );
  NAND2X1 U58 ( .A(count_enable), .B(n24), .Y(n41) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_37 ( .A({1'b0, count_out}), .SUM(
        {N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5}) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_1 add_36_aco ( .A({N53, N52, N51, N50, 
        N49, N48, N47, N46, N45, N44}), .SUM({N27, N26, N25, N24, N23, N22, 
        N21, N20, N19, N18}) );
  INVX2 U15 ( .A(n41), .Y(n23) );
  INVX2 U16 ( .A(rollover_flag), .Y(\mult_add_36_aco/b ) );
  AND2X1 U17 ( .A(count_out[0]), .B(\mult_add_36_aco/b ), .Y(N44) );
  AND2X1 U18 ( .A(count_out[1]), .B(\mult_add_36_aco/b ), .Y(N45) );
  AND2X1 U19 ( .A(count_out[2]), .B(\mult_add_36_aco/b ), .Y(N46) );
  AND2X1 U20 ( .A(count_out[3]), .B(\mult_add_36_aco/b ), .Y(N47) );
  AND2X1 U21 ( .A(count_out[4]), .B(\mult_add_36_aco/b ), .Y(N48) );
  AND2X1 U22 ( .A(count_out[5]), .B(\mult_add_36_aco/b ), .Y(N49) );
  AND2X1 U23 ( .A(count_out[6]), .B(\mult_add_36_aco/b ), .Y(N50) );
  AND2X1 U24 ( .A(count_out[7]), .B(\mult_add_36_aco/b ), .Y(N51) );
  AND2X1 U25 ( .A(count_out[8]), .B(\mult_add_36_aco/b ), .Y(N52) );
  AND2X1 U26 ( .A(\mult_add_36_aco/b ), .B(count_out[9]), .Y(N53) );
  INVX2 U27 ( .A(n60), .Y(n1) );
  INVX2 U59 ( .A(n59), .Y(n2) );
  INVX2 U60 ( .A(n58), .Y(n4) );
  INVX2 U61 ( .A(n57), .Y(n5) );
  INVX2 U62 ( .A(n56), .Y(n6) );
  INVX2 U63 ( .A(n55), .Y(n18) );
  INVX2 U64 ( .A(n54), .Y(n19) );
  INVX2 U65 ( .A(n53), .Y(n20) );
  INVX2 U66 ( .A(n52), .Y(n21) );
  INVX2 U67 ( .A(n50), .Y(n22) );
  INVX2 U68 ( .A(clear), .Y(n24) );
endmodule


module counter ( clk, n_reset, cnt_up, clear, one_k_samples );
  input clk, n_reset, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 count_var ( .clk(clk), .n_rst(n_reset), .clear(
        clear), .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module sync_low_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   temp;

  DFFSR temp_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(temp) );
  DFFSR sync_out_reg ( .D(temp), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module sync_low_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   temp;

  DFFSR temp_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(temp) );
  DFFSR sync_out_reg ( .D(temp), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module magnitude_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[15]), .B(A[15]), .Y(SUM[15]) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n33, n34;

  OAI21X1 U18 ( .A(n1), .B(n9), .C(n17), .Y(out[9]) );
  NAND2X1 U19 ( .A(in[16]), .B(N27), .Y(n17) );
  OAI21X1 U20 ( .A(n1), .B(n10), .C(n18), .Y(out[8]) );
  NAND2X1 U21 ( .A(N26), .B(in[16]), .Y(n18) );
  OAI21X1 U22 ( .A(n1), .B(n11), .C(n19), .Y(out[7]) );
  NAND2X1 U23 ( .A(N25), .B(in[16]), .Y(n19) );
  OAI21X1 U24 ( .A(n1), .B(n12), .C(n20), .Y(out[6]) );
  NAND2X1 U25 ( .A(N24), .B(in[16]), .Y(n20) );
  OAI21X1 U26 ( .A(n1), .B(n13), .C(n21), .Y(out[5]) );
  NAND2X1 U27 ( .A(N23), .B(in[16]), .Y(n21) );
  OAI21X1 U28 ( .A(n1), .B(n14), .C(n22), .Y(out[4]) );
  NAND2X1 U29 ( .A(N22), .B(in[16]), .Y(n22) );
  OAI21X1 U30 ( .A(n1), .B(n15), .C(n23), .Y(out[3]) );
  NAND2X1 U31 ( .A(N21), .B(in[16]), .Y(n23) );
  OAI21X1 U32 ( .A(n1), .B(n16), .C(n24), .Y(out[2]) );
  NAND2X1 U33 ( .A(N20), .B(n1), .Y(n24) );
  OAI21X1 U34 ( .A(n1), .B(n33), .C(n25), .Y(out[1]) );
  NAND2X1 U35 ( .A(N19), .B(n1), .Y(n25) );
  OAI21X1 U36 ( .A(n1), .B(n3), .C(n26), .Y(out[15]) );
  NAND2X1 U37 ( .A(N33), .B(in[16]), .Y(n26) );
  OAI21X1 U38 ( .A(n1), .B(n4), .C(n27), .Y(out[14]) );
  NAND2X1 U39 ( .A(N32), .B(n1), .Y(n27) );
  OAI21X1 U40 ( .A(n1), .B(n5), .C(n28), .Y(out[13]) );
  NAND2X1 U41 ( .A(N31), .B(in[16]), .Y(n28) );
  OAI21X1 U42 ( .A(n1), .B(n6), .C(n29), .Y(out[12]) );
  NAND2X1 U43 ( .A(N30), .B(in[16]), .Y(n29) );
  OAI21X1 U44 ( .A(in[16]), .B(n7), .C(n30), .Y(out[11]) );
  NAND2X1 U45 ( .A(N29), .B(in[16]), .Y(n30) );
  OAI21X1 U46 ( .A(in[16]), .B(n8), .C(n31), .Y(out[10]) );
  NAND2X1 U47 ( .A(N28), .B(in[16]), .Y(n31) );
  OAI21X1 U48 ( .A(in[16]), .B(n34), .C(n32), .Y(out[0]) );
  NAND2X1 U49 ( .A(N18), .B(in[16]), .Y(n32) );
  magnitude_DW01_inc_0 add_14 ( .A({n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, 
        n13, n14, n15, n16, n33, n34}), .SUM({N33, N32, N31, N30, N29, N28, 
        N27, N26, N25, N24, N23, N22, N21, N20, N19, N18}) );
  INVX2 U2 ( .A(n2), .Y(n1) );
  INVX2 U3 ( .A(in[16]), .Y(n2) );
  INVX1 U4 ( .A(in[12]), .Y(n6) );
  INVX2 U5 ( .A(in[15]), .Y(n3) );
  INVX2 U6 ( .A(in[14]), .Y(n4) );
  INVX2 U7 ( .A(in[13]), .Y(n5) );
  INVX2 U8 ( .A(in[11]), .Y(n7) );
  INVX2 U9 ( .A(in[10]), .Y(n8) );
  INVX2 U10 ( .A(in[9]), .Y(n9) );
  INVX2 U11 ( .A(in[8]), .Y(n10) );
  INVX2 U12 ( .A(in[7]), .Y(n11) );
  INVX2 U13 ( .A(in[6]), .Y(n12) );
  INVX2 U14 ( .A(in[5]), .Y(n13) );
  INVX2 U15 ( .A(in[4]), .Y(n14) );
  INVX2 U16 ( .A(in[3]), .Y(n15) );
  INVX2 U17 ( .A(in[2]), .Y(n16) );
  INVX2 U50 ( .A(in[1]), .Y(n33) );
  INVX2 U51 ( .A(in[0]), .Y(n34) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n2), .B(n3), .C(n1), .Y(w_en) );
  NOR2X1 U7 ( .A(n1), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n3), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n3), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n2), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n1), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n3), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[0]), .Y(n1) );
  INVX2 U4 ( .A(op[1]), .Y(n2) );
  INVX2 U5 ( .A(op[2]), .Y(n3) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n21, n22, n23, n24, n25, n27, n29, n30, n31, n32, n33, n35,
         n37, n38, n39, n40, n41, n43, n45, n46, n47, n48, n49, n51, n53, n54,
         n55, n56, n57, n59, n61, n62, n63, n64, n65, n67, n69, n70, n71, n72,
         n73, n74, n76, n78, n80, n82, n84, n86, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n105, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188;

  XNOR2X1 U5 ( .A(n173), .B(n1), .Y(DIFF[14]) );
  AOI21X1 U6 ( .A(n186), .B(n22), .C(n19), .Y(n17) );
  NAND2X1 U9 ( .A(n21), .B(n186), .Y(n1) );
  NAND2X1 U12 ( .A(A[14]), .B(n90), .Y(n21) );
  XOR2X1 U13 ( .A(n25), .B(n2), .Y(DIFF[13]) );
  OAI21X1 U14 ( .A(n25), .B(n23), .C(n24), .Y(n22) );
  NAND2X1 U15 ( .A(n24), .B(n76), .Y(n2) );
  NOR2X1 U17 ( .A(A[13]), .B(n91), .Y(n23) );
  NAND2X1 U18 ( .A(A[13]), .B(n91), .Y(n24) );
  XNOR2X1 U19 ( .A(n166), .B(n3), .Y(DIFF[12]) );
  AOI21X1 U20 ( .A(n185), .B(n30), .C(n27), .Y(n25) );
  NAND2X1 U23 ( .A(n29), .B(n185), .Y(n3) );
  NAND2X1 U26 ( .A(A[12]), .B(n92), .Y(n29) );
  XOR2X1 U27 ( .A(n33), .B(n4), .Y(DIFF[11]) );
  OAI21X1 U28 ( .A(n33), .B(n31), .C(n32), .Y(n30) );
  NAND2X1 U29 ( .A(n32), .B(n78), .Y(n4) );
  NOR2X1 U31 ( .A(A[11]), .B(n93), .Y(n31) );
  NAND2X1 U32 ( .A(A[11]), .B(n93), .Y(n32) );
  XNOR2X1 U33 ( .A(n171), .B(n5), .Y(DIFF[10]) );
  AOI21X1 U34 ( .A(n183), .B(n38), .C(n35), .Y(n33) );
  NAND2X1 U37 ( .A(n37), .B(n183), .Y(n5) );
  NAND2X1 U40 ( .A(A[10]), .B(n94), .Y(n37) );
  XOR2X1 U41 ( .A(n175), .B(n6), .Y(DIFF[9]) );
  OAI21X1 U42 ( .A(n41), .B(n39), .C(n40), .Y(n38) );
  NAND2X1 U43 ( .A(n40), .B(n80), .Y(n6) );
  NOR2X1 U45 ( .A(A[9]), .B(n95), .Y(n39) );
  NAND2X1 U46 ( .A(A[9]), .B(n95), .Y(n40) );
  XNOR2X1 U47 ( .A(n165), .B(n7), .Y(DIFF[8]) );
  AOI21X1 U48 ( .A(n182), .B(n46), .C(n43), .Y(n41) );
  NAND2X1 U51 ( .A(n45), .B(n182), .Y(n7) );
  NAND2X1 U54 ( .A(A[8]), .B(n96), .Y(n45) );
  XOR2X1 U55 ( .A(n49), .B(n8), .Y(DIFF[7]) );
  OAI21X1 U56 ( .A(n49), .B(n47), .C(n48), .Y(n46) );
  NAND2X1 U57 ( .A(n48), .B(n82), .Y(n8) );
  NOR2X1 U59 ( .A(A[7]), .B(n97), .Y(n47) );
  NAND2X1 U60 ( .A(A[7]), .B(n97), .Y(n48) );
  XNOR2X1 U61 ( .A(n54), .B(n9), .Y(DIFF[6]) );
  AOI21X1 U62 ( .A(n181), .B(n54), .C(n51), .Y(n49) );
  NAND2X1 U65 ( .A(n53), .B(n181), .Y(n9) );
  NAND2X1 U68 ( .A(A[6]), .B(n98), .Y(n53) );
  XOR2X1 U69 ( .A(n174), .B(n10), .Y(DIFF[5]) );
  OAI21X1 U70 ( .A(n57), .B(n55), .C(n56), .Y(n54) );
  NAND2X1 U71 ( .A(n56), .B(n84), .Y(n10) );
  NOR2X1 U73 ( .A(A[5]), .B(n99), .Y(n55) );
  NAND2X1 U74 ( .A(A[5]), .B(n99), .Y(n56) );
  XNOR2X1 U75 ( .A(n172), .B(n11), .Y(DIFF[4]) );
  AOI21X1 U76 ( .A(n180), .B(n62), .C(n59), .Y(n57) );
  NAND2X1 U79 ( .A(n61), .B(n180), .Y(n11) );
  NAND2X1 U82 ( .A(A[4]), .B(n100), .Y(n61) );
  XOR2X1 U83 ( .A(n65), .B(n12), .Y(DIFF[3]) );
  OAI21X1 U84 ( .A(n65), .B(n63), .C(n64), .Y(n62) );
  NAND2X1 U85 ( .A(n64), .B(n86), .Y(n12) );
  NOR2X1 U87 ( .A(A[3]), .B(n101), .Y(n63) );
  NAND2X1 U88 ( .A(A[3]), .B(n101), .Y(n64) );
  XNOR2X1 U89 ( .A(n70), .B(n13), .Y(DIFF[2]) );
  AOI21X1 U90 ( .A(n184), .B(n70), .C(n67), .Y(n65) );
  NAND2X1 U93 ( .A(n69), .B(n184), .Y(n13) );
  NAND2X1 U96 ( .A(A[2]), .B(n102), .Y(n69) );
  XOR2X1 U97 ( .A(n14), .B(n187), .Y(DIFF[1]) );
  OAI21X1 U98 ( .A(n71), .B(n187), .C(n72), .Y(n70) );
  NAND2X1 U99 ( .A(n72), .B(n88), .Y(n14) );
  NOR2X1 U101 ( .A(A[1]), .B(n103), .Y(n71) );
  NAND2X1 U102 ( .A(A[1]), .B(n103), .Y(n72) );
  XNOR2X1 U103 ( .A(n188), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U104 ( .A(A[0]), .B(n188), .Y(n73) );
  INVX1 U125 ( .A(B[4]), .Y(n100) );
  INVX1 U126 ( .A(B[9]), .Y(n95) );
  BUFX2 U127 ( .A(n73), .Y(n187) );
  INVX1 U128 ( .A(B[3]), .Y(n101) );
  INVX2 U129 ( .A(B[0]), .Y(n188) );
  INVX1 U130 ( .A(B[13]), .Y(n91) );
  INVX1 U131 ( .A(B[1]), .Y(n103) );
  INVX1 U132 ( .A(B[2]), .Y(n102) );
  INVX1 U133 ( .A(n46), .Y(n164) );
  INVX2 U134 ( .A(n164), .Y(n165) );
  BUFX2 U135 ( .A(n30), .Y(n166) );
  XOR2X1 U136 ( .A(n89), .B(A[15]), .Y(n167) );
  XOR2X1 U137 ( .A(n74), .B(n167), .Y(DIFF[15]) );
  NAND2X1 U138 ( .A(n74), .B(n89), .Y(n168) );
  NAND2X1 U139 ( .A(n74), .B(A[15]), .Y(n169) );
  NAND2X1 U140 ( .A(n89), .B(A[15]), .Y(n170) );
  NAND3X1 U141 ( .A(n169), .B(n168), .C(n170), .Y(n16) );
  INVX1 U142 ( .A(B[15]), .Y(n89) );
  INVX1 U143 ( .A(B[5]), .Y(n99) );
  BUFX2 U144 ( .A(n38), .Y(n171) );
  BUFX2 U145 ( .A(n62), .Y(n172) );
  BUFX2 U146 ( .A(n22), .Y(n173) );
  INVX1 U147 ( .A(B[10]), .Y(n94) );
  INVX1 U148 ( .A(B[8]), .Y(n96) );
  BUFX2 U149 ( .A(n57), .Y(n174) );
  BUFX2 U150 ( .A(n41), .Y(n175) );
  XOR2X1 U151 ( .A(B[16]), .B(n105), .Y(n176) );
  XOR2X1 U152 ( .A(n16), .B(n176), .Y(DIFF[16]) );
  NAND2X1 U153 ( .A(n16), .B(B[16]), .Y(n177) );
  NAND2X1 U154 ( .A(n16), .B(n105), .Y(n178) );
  NAND2X1 U155 ( .A(B[16]), .B(n105), .Y(n179) );
  NAND3X1 U156 ( .A(n179), .B(n177), .C(n178), .Y(n15) );
  OR2X2 U157 ( .A(A[4]), .B(n100), .Y(n180) );
  OR2X2 U158 ( .A(A[6]), .B(n98), .Y(n181) );
  OR2X2 U159 ( .A(A[8]), .B(n96), .Y(n182) );
  OR2X2 U160 ( .A(A[2]), .B(n102), .Y(n184) );
  OR2X2 U161 ( .A(A[12]), .B(n92), .Y(n185) );
  OR2X2 U162 ( .A(A[14]), .B(n90), .Y(n186) );
  OR2X1 U163 ( .A(A[10]), .B(n94), .Y(n183) );
  INVX2 U164 ( .A(B[6]), .Y(n98) );
  INVX2 U165 ( .A(B[7]), .Y(n97) );
  INVX2 U166 ( .A(B[11]), .Y(n93) );
  INVX2 U167 ( .A(B[12]), .Y(n92) );
  INVX2 U168 ( .A(B[14]), .Y(n90) );
  INVX2 U169 ( .A(n71), .Y(n88) );
  INVX2 U170 ( .A(n63), .Y(n86) );
  INVX2 U171 ( .A(n55), .Y(n84) );
  INVX2 U172 ( .A(n47), .Y(n82) );
  INVX2 U173 ( .A(n39), .Y(n80) );
  INVX2 U174 ( .A(n31), .Y(n78) );
  INVX2 U175 ( .A(n23), .Y(n76) );
  INVX2 U176 ( .A(n17), .Y(n74) );
  INVX2 U177 ( .A(n69), .Y(n67) );
  INVX2 U178 ( .A(n61), .Y(n59) );
  INVX2 U179 ( .A(n53), .Y(n51) );
  INVX2 U180 ( .A(n45), .Y(n43) );
  INVX2 U181 ( .A(n37), .Y(n35) );
  INVX2 U182 ( .A(n29), .Y(n27) );
  INVX2 U183 ( .A(n21), .Y(n19) );
  INVX2 U184 ( .A(A[17]), .Y(n105) );
  INVX2 U185 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n20, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34, n36,
         n38, n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n52, n54, n55,
         n56, n57, n58, n60, n62, n63, n64, n65, n66, n68, n70, n71, n72, n73,
         n75, n76, n78, n80, n82, n84, n86, n88, n90, n92, n93, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169;

  FAX1 U2 ( .A(n93), .B(n92), .C(n17), .YC(n16), .YS(SUM[16]) );
  FAX1 U3 ( .A(A[15]), .B(B[15]), .C(n76), .YC(n17), .YS(SUM[15]) );
  XNOR2X1 U5 ( .A(n23), .B(n1), .Y(SUM[14]) );
  AOI21X1 U6 ( .A(n168), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U9 ( .A(n22), .B(n168), .Y(n1) );
  NAND2X1 U12 ( .A(A[14]), .B(B[14]), .Y(n22) );
  XOR2X1 U13 ( .A(n26), .B(n2), .Y(SUM[13]) );
  OAI21X1 U14 ( .A(n26), .B(n24), .C(n25), .Y(n23) );
  NAND2X1 U15 ( .A(n25), .B(n78), .Y(n2) );
  NOR2X1 U17 ( .A(B[13]), .B(A[13]), .Y(n24) );
  NAND2X1 U18 ( .A(B[13]), .B(A[13]), .Y(n25) );
  XNOR2X1 U19 ( .A(n154), .B(n3), .Y(SUM[12]) );
  AOI21X1 U20 ( .A(n167), .B(n31), .C(n28), .Y(n26) );
  NAND2X1 U23 ( .A(n30), .B(n167), .Y(n3) );
  NAND2X1 U26 ( .A(A[12]), .B(B[12]), .Y(n30) );
  XOR2X1 U27 ( .A(n34), .B(n4), .Y(SUM[11]) );
  OAI21X1 U28 ( .A(n34), .B(n32), .C(n33), .Y(n31) );
  NAND2X1 U29 ( .A(n33), .B(n80), .Y(n4) );
  NOR2X1 U31 ( .A(B[11]), .B(A[11]), .Y(n32) );
  NAND2X1 U32 ( .A(B[11]), .B(A[11]), .Y(n33) );
  XNOR2X1 U33 ( .A(n39), .B(n5), .Y(SUM[10]) );
  AOI21X1 U34 ( .A(n166), .B(n39), .C(n36), .Y(n34) );
  NAND2X1 U37 ( .A(n38), .B(n166), .Y(n5) );
  NAND2X1 U40 ( .A(A[10]), .B(B[10]), .Y(n38) );
  XOR2X1 U41 ( .A(n161), .B(n6), .Y(SUM[9]) );
  OAI21X1 U42 ( .A(n42), .B(n40), .C(n41), .Y(n39) );
  NAND2X1 U43 ( .A(n41), .B(n82), .Y(n6) );
  NOR2X1 U45 ( .A(B[9]), .B(A[9]), .Y(n40) );
  NAND2X1 U46 ( .A(B[9]), .B(A[9]), .Y(n41) );
  XNOR2X1 U47 ( .A(n47), .B(n7), .Y(SUM[8]) );
  AOI21X1 U48 ( .A(n164), .B(n47), .C(n44), .Y(n42) );
  NAND2X1 U51 ( .A(n46), .B(n164), .Y(n7) );
  NAND2X1 U54 ( .A(A[8]), .B(B[8]), .Y(n46) );
  XOR2X1 U55 ( .A(n160), .B(n8), .Y(SUM[7]) );
  OAI21X1 U56 ( .A(n50), .B(n48), .C(n49), .Y(n47) );
  NAND2X1 U57 ( .A(n49), .B(n84), .Y(n8) );
  NOR2X1 U59 ( .A(B[7]), .B(A[7]), .Y(n48) );
  NAND2X1 U60 ( .A(B[7]), .B(A[7]), .Y(n49) );
  XNOR2X1 U61 ( .A(n55), .B(n9), .Y(SUM[6]) );
  AOI21X1 U62 ( .A(n163), .B(n55), .C(n52), .Y(n50) );
  NAND2X1 U65 ( .A(n54), .B(n163), .Y(n9) );
  NAND2X1 U68 ( .A(A[6]), .B(B[6]), .Y(n54) );
  XOR2X1 U69 ( .A(n159), .B(n10), .Y(SUM[5]) );
  OAI21X1 U70 ( .A(n58), .B(n56), .C(n57), .Y(n55) );
  NAND2X1 U71 ( .A(n57), .B(n86), .Y(n10) );
  NOR2X1 U73 ( .A(B[5]), .B(A[5]), .Y(n56) );
  NAND2X1 U74 ( .A(B[5]), .B(A[5]), .Y(n57) );
  XNOR2X1 U75 ( .A(n156), .B(n11), .Y(SUM[4]) );
  AOI21X1 U76 ( .A(n162), .B(n63), .C(n60), .Y(n58) );
  NAND2X1 U79 ( .A(n62), .B(n162), .Y(n11) );
  NAND2X1 U82 ( .A(A[4]), .B(B[4]), .Y(n62) );
  XOR2X1 U83 ( .A(n158), .B(n12), .Y(SUM[3]) );
  OAI21X1 U84 ( .A(n66), .B(n64), .C(n65), .Y(n63) );
  NAND2X1 U85 ( .A(n65), .B(n88), .Y(n12) );
  NOR2X1 U87 ( .A(B[3]), .B(A[3]), .Y(n64) );
  NAND2X1 U88 ( .A(B[3]), .B(A[3]), .Y(n65) );
  XNOR2X1 U89 ( .A(n71), .B(n13), .Y(SUM[2]) );
  AOI21X1 U90 ( .A(n165), .B(n71), .C(n68), .Y(n66) );
  NAND2X1 U93 ( .A(n70), .B(n165), .Y(n13) );
  NAND2X1 U96 ( .A(A[2]), .B(B[2]), .Y(n70) );
  XOR2X1 U97 ( .A(n14), .B(n157), .Y(SUM[1]) );
  OAI21X1 U98 ( .A(n72), .B(n75), .C(n73), .Y(n71) );
  NAND2X1 U99 ( .A(n73), .B(n90), .Y(n14) );
  NOR2X1 U101 ( .A(A[1]), .B(B[1]), .Y(n72) );
  NAND2X1 U102 ( .A(A[1]), .B(B[1]), .Y(n73) );
  NAND2X1 U107 ( .A(A[0]), .B(B[0]), .Y(n75) );
  OR2X1 U113 ( .A(A[8]), .B(B[8]), .Y(n164) );
  OR2X1 U114 ( .A(A[0]), .B(B[0]), .Y(n169) );
  AND2X2 U115 ( .A(n157), .B(n169), .Y(SUM[0]) );
  INVX1 U116 ( .A(n31), .Y(n153) );
  INVX2 U117 ( .A(n153), .Y(n154) );
  INVX1 U118 ( .A(n63), .Y(n155) );
  INVX2 U119 ( .A(n155), .Y(n156) );
  BUFX2 U120 ( .A(n75), .Y(n157) );
  OR2X2 U121 ( .A(A[10]), .B(B[10]), .Y(n166) );
  BUFX2 U122 ( .A(n66), .Y(n158) );
  BUFX2 U123 ( .A(n58), .Y(n159) );
  BUFX2 U124 ( .A(n50), .Y(n160) );
  BUFX2 U125 ( .A(n42), .Y(n161) );
  OR2X2 U126 ( .A(A[4]), .B(B[4]), .Y(n162) );
  OR2X2 U127 ( .A(A[6]), .B(B[6]), .Y(n163) );
  OR2X2 U128 ( .A(A[2]), .B(B[2]), .Y(n165) );
  OR2X2 U129 ( .A(A[12]), .B(B[12]), .Y(n167) );
  OR2X2 U130 ( .A(A[14]), .B(B[14]), .Y(n168) );
  INVX2 U131 ( .A(A[17]), .Y(n93) );
  INVX2 U132 ( .A(B[17]), .Y(n92) );
  INVX2 U133 ( .A(n72), .Y(n90) );
  INVX2 U134 ( .A(n64), .Y(n88) );
  INVX2 U135 ( .A(n56), .Y(n86) );
  INVX2 U136 ( .A(n48), .Y(n84) );
  INVX2 U137 ( .A(n40), .Y(n82) );
  INVX2 U138 ( .A(n32), .Y(n80) );
  INVX2 U139 ( .A(n24), .Y(n78) );
  INVX2 U140 ( .A(n18), .Y(n76) );
  INVX2 U141 ( .A(n70), .Y(n68) );
  INVX2 U142 ( .A(n62), .Y(n60) );
  INVX2 U143 ( .A(n54), .Y(n52) );
  INVX2 U144 ( .A(n46), .Y(n44) );
  INVX2 U145 ( .A(n38), .Y(n36) );
  INVX2 U146 ( .A(n30), .Y(n28) );
  INVX2 U147 ( .A(n22), .Y(n20) );
  INVX2 U148 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu_DW_mult_uns_2 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n7, n13, n16, n19, n25, n30, n31, n37, n40, n46, n48, n49, n51,
         n52, n53, n58, n59, n63, n65, n66, n67, n68, n69, n70, n72, n73, n74,
         n75, n77, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n109, n111, n112, n113, n114, n115, n116,
         n120, n122, n123, n124, n125, n126, n127, n128, n129, n130, n133,
         n134, n135, n136, n140, n142, n144, n145, n146, n147, n148, n149,
         n151, n154, n155, n156, n159, n160, n161, n162, n163, n164, n165,
         n166, n169, n170, n171, n172, n173, n174, n177, n178, n179, n181,
         n182, n183, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n197, n198, n199, n200, n201, n202, n205, n206, n207, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n248, n249, n250, n251, n256, n257, n258,
         n259, n264, n265, n266, n267, n275, n279, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n401, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n545, n548, n551, n552, n554, n555, n557,
         n560, n563, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618,
         n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629,
         n630, n631, n632, n633, n634, n635, n636, n637, n638, n639, n640,
         n641, n642, n643, n644, n645, n646, n647, n648, n649, n650, n651,
         n652, n653, n654, n655, n656, n657, n658, n659, n660, n661, n662,
         n663, n664, n665, n666, n667, n668, n669, n670, n671, n672, n673,
         n674, n675, n676, n677, n678, n679, n680, n681, n682, n683, n684,
         n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, n695,
         n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706,
         n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717,
         n718, n719, n720, n721, n722, n723, n724, n725, n730, n732, n741,
         n742, n743, n744, n745, n746, n747, n748, n749, n750, n751, n752,
         n753, n754, n755, n756, n757, n758, n759, n760, n761, n762, n763,
         n764, n765, n766, n767, n768, n769, n770, n771, n772, n773, n774,
         n775, n776, n777, n778, n779, n780, n781, n782, n783, n784, n785,
         n786, n787, n788, n789, n790, n791, n792, n793, n794, n795, n796,
         n797, n798, n799, n800, n801, n802, n803, n804, n805, n806, n807,
         n808, n809, n810, n811, n812, n813, n814, n815, n816, n817, n818,
         n819, n820, n821, n822, n823, n824, n825, n826, n827, n828, n829,
         n830, n831, n832, n833, n834, n835, n836, n837, n838, n839, n840,
         n841, n842, n843, n844, n845, n846, n847, n848, n849, n850, n851,
         n852, n853, n854, n855, n856, n857, n858, n859, n860, n861, n862,
         n863, n864, n865, n866, n867, n868, n869, n870, n871, n872, n873,
         n874, n875, n876, n877, n878, n879, n880, n881, n882, n883, n884,
         n885, n886, n887, n888, n889, n890, n891, n893, n894, n897, n898,
         n899, n900, n917, n918, n995, n996, n997, n998, n999, n1000, n1001,
         n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011,
         n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021,
         n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031,
         n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041,
         n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051,
         n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061,
         n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071,
         n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081,
         n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091,
         n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101,
         n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111,
         n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121,
         n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131,
         n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141,
         n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151,
         n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161,
         n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171,
         n1172, n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181,
         n1182, n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191,
         n1192, n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201,
         n1202, n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211,
         n1212, n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221,
         n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231,
         n1232, n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241,
         n1242, n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251,
         n1252, n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261,
         n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271,
         n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281,
         n1282, n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291,
         n1292, n1293, n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301,
         n1302, n1303, n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311,
         n1312, n1313, n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321,
         n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331,
         n1332, n1333, n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341,
         n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351,
         n1352, n1353, n1354, n1355, n1356, n1357, n1358, n1359, n1360, n1361,
         n1362, n1363;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n541 = a[30];
  assign n877 = b[15];
  assign n878 = b[14];
  assign n879 = b[13];
  assign n880 = b[12];
  assign n881 = b[11];
  assign n882 = b[10];
  assign n883 = b[9];
  assign n884 = b[8];
  assign n885 = b[7];
  assign n886 = b[6];
  assign n887 = b[5];
  assign n888 = b[4];
  assign n889 = b[3];
  assign n890 = b[2];
  assign n891 = b[1];

  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  AOI21X1 U60 ( .A(n1316), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1243), .B(n1280), .Y(n74) );
  OAI21X1 U62 ( .A(n1278), .B(n1243), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  AOI21X1 U76 ( .A(n1316), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n1280), .B(n89), .Y(n87) );
  OAI21X1 U78 ( .A(n1278), .B(n89), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  AOI21X1 U88 ( .A(n1316), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n1279), .Y(n96) );
  OAI21X1 U90 ( .A(n1277), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n1238), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n106), .B(n130), .Y(n104) );
  OAI21X1 U98 ( .A(n106), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1250), .B(n1003), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1250), .C(n109), .Y(n107) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  XOR2X1 U107 ( .A(n123), .B(n58), .Y(product[42]) );
  AOI21X1 U108 ( .A(n1316), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n1280), .B(n115), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1278), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n128), .B(n1003), .Y(n115) );
  AOI21X1 U112 ( .A(n1003), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U117 ( .A(n122), .B(n1003), .Y(n58) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  XOR2X1 U121 ( .A(n134), .B(n59), .Y(product[41]) );
  AOI21X1 U122 ( .A(n1316), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n126), .B(n1279), .Y(n124) );
  OAI21X1 U124 ( .A(n1277), .B(n126), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n130), .B(n1226), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NAND2X1 U131 ( .A(n133), .B(n279), .Y(n59) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  AOI21X1 U136 ( .A(n1316), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1227), .B(n1279), .Y(n135) );
  OAI21X1 U138 ( .A(n1278), .B(n1158), .C(n140), .Y(n136) );
  AOI21X1 U142 ( .A(n151), .B(n1244), .C(n142), .Y(n140) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  AOI21X1 U150 ( .A(n1316), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1280), .Y(n146) );
  OAI21X1 U152 ( .A(n1277), .B(n148), .C(n149), .Y(n147) );
  NOR2X1 U159 ( .A(n339), .B(n330), .Y(n148) );
  NAND2X1 U160 ( .A(n339), .B(n330), .Y(n149) );
  AOI21X1 U162 ( .A(n155), .B(n1316), .C(n156), .Y(n154) );
  NAND2X1 U165 ( .A(n159), .B(n171), .Y(n53) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n161), .B(n169), .C(n162), .Y(n160) );
  NOR2X1 U171 ( .A(n340), .B(n349), .Y(n161) );
  NAND2X1 U172 ( .A(n340), .B(n349), .Y(n162) );
  XOR2X1 U173 ( .A(n170), .B(n63), .Y(product[37]) );
  AOI21X1 U174 ( .A(n164), .B(n1316), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n1214), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n1214), .C(n169), .Y(n165) );
  NAND2X1 U179 ( .A(n169), .B(n283), .Y(n63) );
  NOR2X1 U181 ( .A(n350), .B(n361), .Y(n166) );
  NAND2X1 U182 ( .A(n350), .B(n361), .Y(n169) );
  AOI21X1 U184 ( .A(n1101), .B(n1316), .C(n1021), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n177), .B(n183), .C(n178), .Y(n172) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  XNOR2X1 U195 ( .A(n1316), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n285), .B(n1316), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n374), .B(n387), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n199), .B(n187), .Y(n185) );
  AOI21X1 U206 ( .A(n187), .B(n200), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n189), .B(n194), .Y(n187) );
  OAI21X1 U208 ( .A(n1122), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NOR2X1 U211 ( .A(n388), .B(n401), .Y(n189) );
  NAND2X1 U212 ( .A(n401), .B(n388), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n212), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1234), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n1234), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n402), .B(n415), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n402), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n199), .B(n212), .C(n1197), .Y(n198) );
  NOR2X1 U229 ( .A(n210), .B(n205), .Y(n199) );
  OAI21X1 U230 ( .A(n1225), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n1109), .B(n416), .Y(n205) );
  NAND2X1 U234 ( .A(n1109), .B(n416), .Y(n206) );
  XNOR2X1 U235 ( .A(n212), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n212), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n443), .B(n430), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n1224), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n444), .B(n457), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1247), .B(n1245), .Y(n223) );
  AOI21X1 U258 ( .A(n1245), .B(n1246), .C(n1248), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n1067), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1251), .B(n248), .C(n1252), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1253), .C(n1255), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1254), .C(n1256), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1259), .B(n1239), .C(n1240), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n601), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n305), .B(n574), .C(n585), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n602), .C(n586), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n315), .C(n310), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n587), .B(n619), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n319), .B(n575), .C(n603), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U321 ( .A(n604), .B(n327), .C(n325), .YC(n315), .YS(n316) );
  FAX1 U322 ( .A(n320), .B(n620), .C(n588), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n328), .B(n335), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U326 ( .A(n605), .B(n589), .C(n637), .YC(n325), .YS(n326) );
  FAX1 U327 ( .A(n337), .B(n576), .C(n621), .YC(n327), .YS(n328) );
  FAX1 U331 ( .A(n338), .B(n638), .C(n590), .YC(n335), .YS(n336) );
  FAX1 U335 ( .A(n639), .B(n348), .C(n357), .YC(n343), .YS(n344) );
  FAX1 U336 ( .A(n607), .B(n591), .C(n655), .YC(n345), .YS(n346) );
  FAX1 U338 ( .A(n354), .B(n352), .C(n363), .YC(n349), .YS(n350) );
  FAX1 U340 ( .A(n371), .B(n369), .C(n358), .YC(n353), .YS(n354) );
  FAX1 U341 ( .A(n608), .B(n624), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U342 ( .A(n360), .B(n656), .C(n592), .YC(n357), .YS(n358) );
  FAX1 U344 ( .A(n366), .B(n364), .C(n375), .YC(n361), .YS(n362) );
  FAX1 U348 ( .A(n609), .B(n593), .C(n673), .YC(n369), .YS(n370) );
  FAX1 U350 ( .A(n378), .B(n389), .C(n376), .YC(n373), .YS(n374) );
  FAX1 U354 ( .A(n658), .B(n610), .C(n642), .YC(n381), .YS(n382) );
  FAX1 U355 ( .A(n386), .B(n674), .C(n594), .YC(n383), .YS(n384) );
  FAX1 U361 ( .A(n675), .B(n709), .C(n643), .YC(n395), .YS(n396) );
  FAX1 U362 ( .A(n691), .B(n595), .C(n611), .YC(n397), .YS(n398) );
  FAX1 U363 ( .A(n579), .B(n659), .C(n627), .YC(n399), .YS(n400) );
  FAX1 U364 ( .A(n406), .B(n417), .C(n404), .YC(n401), .YS(n402) );
  FAX1 U366 ( .A(n423), .B(n410), .C(n412), .YC(n405), .YS(n406) );
  FAX1 U367 ( .A(n1000), .B(n414), .C(n425), .YC(n407), .YS(n408) );
  FAX1 U368 ( .A(n676), .B(n644), .C(n660), .YC(n409), .YS(n410) );
  FAX1 U374 ( .A(n441), .B(n995), .C(n437), .YC(n421), .YS(n422) );
  FAX1 U375 ( .A(n661), .B(n677), .C(n645), .YC(n423), .YS(n424) );
  FAX1 U376 ( .A(n629), .B(n613), .C(n597), .YC(n425), .YS(n426) );
  FAX1 U377 ( .A(n1276), .B(n581), .C(n693), .YC(n427), .YS(n428) );
  FAX1 U381 ( .A(n455), .B(n453), .C(n451), .YC(n435), .YS(n436) );
  FAX1 U382 ( .A(n662), .B(n646), .C(n630), .YC(n437), .YS(n438) );
  FAX1 U383 ( .A(n678), .B(n614), .C(n598), .YC(n439), .YS(n440) );
  FAX1 U384 ( .A(n582), .B(n710), .C(n694), .YC(n441), .YS(n442) );
  FAX1 U387 ( .A(n1012), .B(n1019), .C(n998), .YC(n447), .YS(n448) );
  FAX1 U388 ( .A(n647), .B(n456), .C(n467), .YC(n449), .YS(n450) );
  FAX1 U389 ( .A(n663), .B(n615), .C(n565), .YC(n451), .YS(n452) );
  HAX1 U391 ( .A(n711), .B(n695), .YC(n455), .YS(n456) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U395 ( .A(n664), .B(n648), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U396 ( .A(n680), .B(n616), .C(n632), .YC(n465), .YS(n466) );
  FAX1 U397 ( .A(n712), .B(n696), .C(n600), .YC(n467), .YS(n468) );
  FAX1 U401 ( .A(n681), .B(n649), .C(n665), .YC(n475), .YS(n476) );
  FAX1 U402 ( .A(n617), .B(n566), .C(n633), .YC(n477), .YS(n478) );
  HAX1 U403 ( .A(n713), .B(n697), .YC(n479), .YS(n480) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U405 ( .A(n490), .B(n488), .C(n495), .YC(n483), .YS(n484) );
  FAX1 U411 ( .A(n683), .B(n667), .C(n500), .YC(n495), .YS(n496) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n1046), .C(n508), .YC(n503), .YS(n504) );
  FAX1 U416 ( .A(n684), .B(n652), .C(n668), .YC(n505), .YS(n506) );
  FAX1 U417 ( .A(n716), .B(n700), .C(n636), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n669), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n685), .B(n568), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n717), .B(n701), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n686), .B(n670), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n718), .B(n702), .C(n654), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n687), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n719), .B(n703), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n688), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n720), .B(n704), .C(n672), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n570), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n721), .B(n705), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n722), .B(n706), .C(n690), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n918), .B(n1345), .Y(n573) );
  NOR2X1 U435 ( .A(n918), .B(n1343), .Y(n295) );
  NOR2X1 U436 ( .A(n918), .B(n1341), .Y(n574) );
  NOR2X1 U437 ( .A(n918), .B(n1339), .Y(n305) );
  NOR2X1 U438 ( .A(n918), .B(n730), .Y(n575) );
  NOR2X1 U439 ( .A(n918), .B(n1335), .Y(n319) );
  NOR2X1 U440 ( .A(n918), .B(n732), .Y(n576) );
  NOR2X1 U441 ( .A(n918), .B(n1331), .Y(n337) );
  NOR2X1 U442 ( .A(n918), .B(n1329), .Y(n577) );
  NOR2X1 U444 ( .A(n918), .B(n1325), .Y(n578) );
  NOR2X1 U446 ( .A(n918), .B(n1321), .Y(n579) );
  NOR2X1 U447 ( .A(n918), .B(n1319), .Y(n580) );
  NOR2X1 U448 ( .A(n918), .B(n1317), .Y(n581) );
  OAI22X1 U466 ( .A(n1135), .B(n757), .C(n918), .D(n1314), .Y(n565) );
  OAI22X1 U469 ( .A(n918), .B(n1135), .C(n741), .D(n1314), .Y(n584) );
  OAI22X1 U470 ( .A(n1312), .B(n741), .C(n742), .D(n1314), .Y(n585) );
  OAI22X1 U471 ( .A(n1312), .B(n742), .C(n743), .D(n1314), .Y(n586) );
  OAI22X1 U472 ( .A(n1135), .B(n743), .C(n744), .D(n1314), .Y(n587) );
  OAI22X1 U473 ( .A(n1135), .B(n744), .C(n745), .D(n1314), .Y(n588) );
  OAI22X1 U474 ( .A(n1135), .B(n745), .C(n746), .D(n1314), .Y(n589) );
  OAI22X1 U475 ( .A(n1135), .B(n746), .C(n747), .D(n1314), .Y(n590) );
  OAI22X1 U476 ( .A(n1312), .B(n747), .C(n748), .D(n1314), .Y(n591) );
  OAI22X1 U477 ( .A(n1312), .B(n748), .C(n749), .D(n1314), .Y(n592) );
  OAI22X1 U478 ( .A(n1135), .B(n749), .C(n750), .D(n1314), .Y(n593) );
  OAI22X1 U479 ( .A(n1312), .B(n750), .C(n751), .D(n1314), .Y(n594) );
  OAI22X1 U480 ( .A(n1135), .B(n751), .C(n752), .D(n1314), .Y(n595) );
  OAI22X1 U482 ( .A(n1312), .B(n753), .C(n754), .D(n1314), .Y(n597) );
  OAI22X1 U483 ( .A(n1312), .B(n754), .C(n755), .D(n1314), .Y(n598) );
  OAI22X1 U484 ( .A(n1312), .B(n755), .C(n1314), .D(n756), .Y(n599) );
  AND2X1 U485 ( .A(n1350), .B(n1311), .Y(n600) );
  XNOR2X1 U487 ( .A(n877), .B(n1347), .Y(n741) );
  XNOR2X1 U488 ( .A(n1344), .B(n1347), .Y(n742) );
  XNOR2X1 U489 ( .A(n1342), .B(n1347), .Y(n743) );
  XNOR2X1 U490 ( .A(n1340), .B(n1347), .Y(n744) );
  XNOR2X1 U491 ( .A(n1338), .B(n1347), .Y(n745) );
  XNOR2X1 U492 ( .A(n1336), .B(n1347), .Y(n746) );
  XNOR2X1 U493 ( .A(n1334), .B(n1347), .Y(n747) );
  XNOR2X1 U494 ( .A(n1332), .B(n1347), .Y(n748) );
  XNOR2X1 U495 ( .A(n1330), .B(n1347), .Y(n749) );
  XNOR2X1 U496 ( .A(n1328), .B(n1347), .Y(n750) );
  XNOR2X1 U497 ( .A(n1326), .B(n1348), .Y(n751) );
  XNOR2X1 U498 ( .A(n1324), .B(n1348), .Y(n752) );
  XNOR2X1 U499 ( .A(n1322), .B(n1348), .Y(n753) );
  XNOR2X1 U500 ( .A(n1320), .B(n1348), .Y(n754) );
  XNOR2X1 U501 ( .A(n1318), .B(n1348), .Y(n755) );
  XNOR2X1 U502 ( .A(n1349), .B(n1347), .Y(n756) );
  OR2X1 U503 ( .A(n1349), .B(n918), .Y(n757) );
  OAI22X1 U505 ( .A(n1308), .B(n774), .C(n1363), .D(n1310), .Y(n566) );
  OAI22X1 U508 ( .A(n1363), .B(n1308), .C(n758), .D(n1026), .Y(n602) );
  OAI22X1 U509 ( .A(n1308), .B(n758), .C(n759), .D(n1310), .Y(n603) );
  OAI22X1 U510 ( .A(n1308), .B(n759), .C(n760), .D(n1026), .Y(n604) );
  OAI22X1 U511 ( .A(n1308), .B(n760), .C(n761), .D(n1310), .Y(n605) );
  OAI22X1 U512 ( .A(n1308), .B(n761), .C(n762), .D(n1026), .Y(n606) );
  OAI22X1 U513 ( .A(n1308), .B(n762), .C(n763), .D(n1310), .Y(n607) );
  OAI22X1 U514 ( .A(n1308), .B(n763), .C(n764), .D(n1026), .Y(n608) );
  OAI22X1 U515 ( .A(n1308), .B(n764), .C(n765), .D(n1309), .Y(n609) );
  OAI22X1 U516 ( .A(n1308), .B(n765), .C(n766), .D(n1310), .Y(n610) );
  OAI22X1 U517 ( .A(n1308), .B(n766), .C(n767), .D(n1309), .Y(n611) );
  OAI22X1 U518 ( .A(n1308), .B(n767), .C(n768), .D(n1310), .Y(n612) );
  OAI22X1 U519 ( .A(n1308), .B(n768), .C(n769), .D(n1309), .Y(n613) );
  OAI22X1 U520 ( .A(n1308), .B(n769), .C(n770), .D(n1310), .Y(n614) );
  OAI22X1 U521 ( .A(n1308), .B(n770), .C(n771), .D(n1309), .Y(n615) );
  OAI22X1 U522 ( .A(n1308), .B(n771), .C(n772), .D(n1310), .Y(n616) );
  OAI22X1 U523 ( .A(n1308), .B(n772), .C(n1309), .D(n773), .Y(n617) );
  AND2X1 U524 ( .A(n1350), .B(n1307), .Y(n618) );
  XNOR2X1 U526 ( .A(n877), .B(n1362), .Y(n758) );
  XNOR2X1 U527 ( .A(n1344), .B(n1362), .Y(n759) );
  XNOR2X1 U528 ( .A(n1342), .B(n37), .Y(n760) );
  XNOR2X1 U529 ( .A(n1340), .B(n1362), .Y(n761) );
  XNOR2X1 U530 ( .A(n1338), .B(n1362), .Y(n762) );
  XNOR2X1 U531 ( .A(n1336), .B(n1362), .Y(n763) );
  XNOR2X1 U532 ( .A(n1334), .B(n1362), .Y(n764) );
  XNOR2X1 U533 ( .A(n1332), .B(n1362), .Y(n765) );
  XNOR2X1 U534 ( .A(n1330), .B(n1362), .Y(n766) );
  XNOR2X1 U535 ( .A(n1328), .B(n1362), .Y(n767) );
  XNOR2X1 U536 ( .A(n1326), .B(n1362), .Y(n768) );
  XNOR2X1 U537 ( .A(n1324), .B(n1362), .Y(n769) );
  XNOR2X1 U538 ( .A(n1322), .B(n1362), .Y(n770) );
  XNOR2X1 U539 ( .A(n1320), .B(n1362), .Y(n771) );
  XNOR2X1 U540 ( .A(n1318), .B(n1362), .Y(n772) );
  XNOR2X1 U541 ( .A(n1349), .B(n1362), .Y(n773) );
  OAI22X1 U544 ( .A(n1305), .B(n791), .C(n1361), .D(n1010), .Y(n567) );
  OAI22X1 U547 ( .A(n1361), .B(n1305), .C(n775), .D(n1001), .Y(n620) );
  OAI22X1 U548 ( .A(n1305), .B(n775), .C(n776), .D(n1009), .Y(n621) );
  OAI22X1 U549 ( .A(n1305), .B(n776), .C(n777), .D(n1010), .Y(n622) );
  OAI22X1 U550 ( .A(n1305), .B(n777), .C(n778), .D(n1001), .Y(n623) );
  OAI22X1 U551 ( .A(n1305), .B(n778), .C(n779), .D(n1001), .Y(n624) );
  OAI22X1 U552 ( .A(n1305), .B(n779), .C(n780), .D(n1001), .Y(n625) );
  OAI22X1 U553 ( .A(n1305), .B(n780), .C(n781), .D(n1010), .Y(n626) );
  OAI22X1 U554 ( .A(n1305), .B(n781), .C(n782), .D(n1001), .Y(n627) );
  OAI22X1 U555 ( .A(n1305), .B(n782), .C(n783), .D(n1010), .Y(n628) );
  OAI22X1 U556 ( .A(n1305), .B(n783), .C(n784), .D(n1001), .Y(n629) );
  OAI22X1 U557 ( .A(n1305), .B(n784), .C(n785), .D(n1010), .Y(n630) );
  OAI22X1 U559 ( .A(n1305), .B(n786), .C(n787), .D(n1009), .Y(n632) );
  OAI22X1 U560 ( .A(n1305), .B(n787), .C(n788), .D(n1010), .Y(n633) );
  OAI22X1 U561 ( .A(n1305), .B(n788), .C(n789), .D(n1010), .Y(n634) );
  OAI22X1 U562 ( .A(n1305), .B(n789), .C(n1010), .D(n790), .Y(n635) );
  AND2X1 U563 ( .A(n1350), .B(n1137), .Y(n636) );
  XNOR2X1 U565 ( .A(n877), .B(n1360), .Y(n775) );
  XNOR2X1 U566 ( .A(n1344), .B(n1360), .Y(n776) );
  XNOR2X1 U567 ( .A(n1342), .B(n1360), .Y(n777) );
  XNOR2X1 U568 ( .A(n1340), .B(n1360), .Y(n778) );
  XNOR2X1 U569 ( .A(n1338), .B(n1360), .Y(n779) );
  XNOR2X1 U570 ( .A(n1336), .B(n1360), .Y(n780) );
  XNOR2X1 U571 ( .A(n1334), .B(n1360), .Y(n781) );
  XNOR2X1 U573 ( .A(n1330), .B(n1360), .Y(n783) );
  XNOR2X1 U574 ( .A(n1328), .B(n1360), .Y(n784) );
  XNOR2X1 U575 ( .A(n1326), .B(n1360), .Y(n785) );
  XNOR2X1 U576 ( .A(n1324), .B(n1360), .Y(n786) );
  XNOR2X1 U577 ( .A(n1322), .B(n1360), .Y(n787) );
  XNOR2X1 U578 ( .A(n1320), .B(n1360), .Y(n788) );
  XNOR2X1 U579 ( .A(n1318), .B(n1360), .Y(n789) );
  XNOR2X1 U580 ( .A(n1349), .B(n1360), .Y(n790) );
  OR2X1 U581 ( .A(n1349), .B(n1361), .Y(n791) );
  OAI22X1 U583 ( .A(n1300), .B(n808), .C(n1359), .D(n1304), .Y(n568) );
  OAI22X1 U586 ( .A(n1359), .B(n1301), .C(n792), .D(n1304), .Y(n638) );
  OAI22X1 U587 ( .A(n1301), .B(n792), .C(n793), .D(n1304), .Y(n639) );
  OAI22X1 U588 ( .A(n1300), .B(n793), .C(n794), .D(n1304), .Y(n640) );
  OAI22X1 U589 ( .A(n1301), .B(n794), .C(n795), .D(n1303), .Y(n641) );
  OAI22X1 U590 ( .A(n1300), .B(n795), .C(n796), .D(n1304), .Y(n642) );
  OAI22X1 U591 ( .A(n1301), .B(n796), .C(n797), .D(n1303), .Y(n643) );
  OAI22X1 U592 ( .A(n1300), .B(n797), .C(n798), .D(n1303), .Y(n644) );
  OAI22X1 U593 ( .A(n1301), .B(n798), .C(n799), .D(n1304), .Y(n645) );
  OAI22X1 U594 ( .A(n1300), .B(n799), .C(n800), .D(n1303), .Y(n646) );
  OAI22X1 U595 ( .A(n1301), .B(n800), .C(n801), .D(n1304), .Y(n647) );
  OAI22X1 U596 ( .A(n1300), .B(n801), .C(n802), .D(n1304), .Y(n648) );
  OAI22X1 U597 ( .A(n1301), .B(n802), .C(n803), .D(n1304), .Y(n649) );
  OAI22X1 U598 ( .A(n1300), .B(n803), .C(n804), .D(n1304), .Y(n650) );
  OAI22X1 U599 ( .A(n1301), .B(n804), .C(n805), .D(n1304), .Y(n651) );
  OAI22X1 U600 ( .A(n1300), .B(n805), .C(n806), .D(n1304), .Y(n652) );
  OAI22X1 U601 ( .A(n1301), .B(n806), .C(n1304), .D(n807), .Y(n653) );
  AND2X1 U602 ( .A(n1350), .B(n552), .Y(n654) );
  XNOR2X1 U604 ( .A(n877), .B(n1111), .Y(n792) );
  XNOR2X1 U605 ( .A(n1344), .B(n1111), .Y(n793) );
  XNOR2X1 U606 ( .A(n1342), .B(n1111), .Y(n794) );
  XNOR2X1 U607 ( .A(n1340), .B(n1358), .Y(n795) );
  XNOR2X1 U608 ( .A(n1338), .B(n1111), .Y(n796) );
  XNOR2X1 U609 ( .A(n1336), .B(n1358), .Y(n797) );
  XNOR2X1 U610 ( .A(n1334), .B(n1111), .Y(n798) );
  XNOR2X1 U611 ( .A(n1332), .B(n1111), .Y(n799) );
  XNOR2X1 U612 ( .A(n1330), .B(n1111), .Y(n800) );
  XNOR2X1 U613 ( .A(n1328), .B(n1358), .Y(n801) );
  XNOR2X1 U614 ( .A(n1326), .B(n1111), .Y(n802) );
  XNOR2X1 U615 ( .A(n1324), .B(n1358), .Y(n803) );
  XNOR2X1 U616 ( .A(n1322), .B(n1111), .Y(n804) );
  XNOR2X1 U617 ( .A(n1320), .B(n1358), .Y(n805) );
  XNOR2X1 U618 ( .A(n1318), .B(n1111), .Y(n806) );
  XNOR2X1 U619 ( .A(n1349), .B(n1111), .Y(n807) );
  OR2X1 U620 ( .A(n1349), .B(n1359), .Y(n808) );
  OAI22X1 U622 ( .A(n1087), .B(n825), .C(n1161), .D(n1299), .Y(n569) );
  OAI22X1 U625 ( .A(n1161), .B(n1296), .C(n809), .D(n1299), .Y(n656) );
  OAI22X1 U626 ( .A(n1087), .B(n809), .C(n810), .D(n1299), .Y(n657) );
  OAI22X1 U627 ( .A(n1087), .B(n810), .C(n811), .D(n1299), .Y(n658) );
  OAI22X1 U628 ( .A(n1098), .B(n811), .C(n812), .D(n1299), .Y(n659) );
  OAI22X1 U629 ( .A(n1087), .B(n812), .C(n813), .D(n1298), .Y(n660) );
  OAI22X1 U630 ( .A(n1087), .B(n813), .C(n814), .D(n1237), .Y(n661) );
  OAI22X1 U631 ( .A(n1098), .B(n814), .C(n815), .D(n1299), .Y(n662) );
  OAI22X1 U632 ( .A(n1087), .B(n815), .C(n816), .D(n1298), .Y(n663) );
  OAI22X1 U633 ( .A(n1087), .B(n816), .C(n817), .D(n1237), .Y(n664) );
  OAI22X1 U634 ( .A(n1087), .B(n817), .C(n818), .D(n1237), .Y(n665) );
  OAI22X1 U635 ( .A(n1087), .B(n818), .C(n819), .D(n1298), .Y(n666) );
  OAI22X1 U636 ( .A(n1087), .B(n819), .C(n820), .D(n1237), .Y(n667) );
  OAI22X1 U637 ( .A(n1087), .B(n820), .C(n821), .D(n1298), .Y(n668) );
  OAI22X1 U638 ( .A(n1087), .B(n821), .C(n822), .D(n1237), .Y(n669) );
  OAI22X1 U639 ( .A(n1087), .B(n822), .C(n823), .D(n1298), .Y(n670) );
  OAI22X1 U640 ( .A(n1087), .B(n823), .C(n1299), .D(n824), .Y(n671) );
  AND2X1 U641 ( .A(n1350), .B(n555), .Y(n672) );
  XNOR2X1 U643 ( .A(n877), .B(n1273), .Y(n809) );
  XNOR2X1 U644 ( .A(n1344), .B(n1272), .Y(n810) );
  XNOR2X1 U645 ( .A(n1342), .B(n1271), .Y(n811) );
  XNOR2X1 U646 ( .A(n1340), .B(n1271), .Y(n812) );
  XNOR2X1 U647 ( .A(n1338), .B(n1273), .Y(n813) );
  XNOR2X1 U648 ( .A(n1336), .B(n1271), .Y(n814) );
  XNOR2X1 U649 ( .A(n1334), .B(n1271), .Y(n815) );
  XNOR2X1 U650 ( .A(n1332), .B(n1272), .Y(n816) );
  XNOR2X1 U651 ( .A(n1330), .B(n1272), .Y(n817) );
  XNOR2X1 U652 ( .A(n1328), .B(n1273), .Y(n818) );
  XNOR2X1 U653 ( .A(n1326), .B(n1273), .Y(n819) );
  XNOR2X1 U654 ( .A(n1324), .B(n1272), .Y(n820) );
  XNOR2X1 U655 ( .A(n1322), .B(n1273), .Y(n821) );
  XNOR2X1 U656 ( .A(n1320), .B(n1273), .Y(n822) );
  XNOR2X1 U657 ( .A(n1318), .B(n1272), .Y(n823) );
  XNOR2X1 U658 ( .A(n1349), .B(n1272), .Y(n824) );
  OAI22X1 U661 ( .A(n1042), .B(n842), .C(n1159), .D(n1024), .Y(n570) );
  OAI22X1 U664 ( .A(n1159), .B(n1042), .C(n826), .D(n1294), .Y(n674) );
  OAI22X1 U665 ( .A(n1042), .B(n826), .C(n827), .D(n1295), .Y(n675) );
  OAI22X1 U666 ( .A(n1042), .B(n827), .C(n828), .D(n1295), .Y(n676) );
  OAI22X1 U667 ( .A(n1042), .B(n828), .C(n829), .D(n1295), .Y(n677) );
  OAI22X1 U668 ( .A(n1042), .B(n829), .C(n830), .D(n1295), .Y(n678) );
  OAI22X1 U669 ( .A(n1042), .B(n830), .C(n831), .D(n1294), .Y(n679) );
  OAI22X1 U670 ( .A(n1042), .B(n831), .C(n832), .D(n1295), .Y(n680) );
  OAI22X1 U671 ( .A(n1042), .B(n832), .C(n833), .D(n1294), .Y(n681) );
  OAI22X1 U672 ( .A(n1042), .B(n833), .C(n834), .D(n1294), .Y(n682) );
  OAI22X1 U673 ( .A(n1042), .B(n834), .C(n835), .D(n1024), .Y(n683) );
  OAI22X1 U674 ( .A(n1042), .B(n835), .C(n836), .D(n1294), .Y(n684) );
  OAI22X1 U675 ( .A(n1042), .B(n836), .C(n837), .D(n1294), .Y(n685) );
  OAI22X1 U676 ( .A(n1042), .B(n837), .C(n838), .D(n1024), .Y(n686) );
  OAI22X1 U677 ( .A(n1042), .B(n838), .C(n839), .D(n1024), .Y(n687) );
  OAI22X1 U678 ( .A(n1042), .B(n839), .C(n840), .D(n1024), .Y(n688) );
  OAI22X1 U679 ( .A(n1042), .B(n840), .C(n1024), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n1350), .B(n1293), .Y(n690) );
  XNOR2X1 U682 ( .A(n877), .B(n1235), .Y(n826) );
  XNOR2X1 U683 ( .A(n1344), .B(n1235), .Y(n827) );
  XNOR2X1 U684 ( .A(n1342), .B(n1235), .Y(n828) );
  XNOR2X1 U685 ( .A(n1340), .B(n1355), .Y(n829) );
  XNOR2X1 U686 ( .A(n1338), .B(n1235), .Y(n830) );
  XNOR2X1 U687 ( .A(n1336), .B(n1355), .Y(n831) );
  XNOR2X1 U688 ( .A(n1334), .B(n1235), .Y(n832) );
  XNOR2X1 U689 ( .A(n1332), .B(n1236), .Y(n833) );
  XNOR2X1 U690 ( .A(n1330), .B(n1355), .Y(n834) );
  XNOR2X1 U691 ( .A(n1328), .B(n1235), .Y(n835) );
  XNOR2X1 U692 ( .A(n1326), .B(n1236), .Y(n836) );
  XNOR2X1 U693 ( .A(n1324), .B(n1355), .Y(n837) );
  XNOR2X1 U694 ( .A(n1322), .B(n1235), .Y(n838) );
  XNOR2X1 U695 ( .A(n1320), .B(n1235), .Y(n839) );
  XNOR2X1 U696 ( .A(n1318), .B(n1355), .Y(n840) );
  XNOR2X1 U697 ( .A(n1349), .B(n1235), .Y(n841) );
  OR2X1 U698 ( .A(n1349), .B(n1159), .Y(n842) );
  OAI22X1 U700 ( .A(n1290), .B(n859), .C(n1354), .D(n1292), .Y(n571) );
  OAI22X1 U703 ( .A(n1354), .B(n1209), .C(n843), .D(n1121), .Y(n692) );
  OAI22X1 U704 ( .A(n1209), .B(n843), .C(n844), .D(n1121), .Y(n693) );
  OAI22X1 U705 ( .A(n1290), .B(n844), .C(n845), .D(n1121), .Y(n694) );
  OAI22X1 U706 ( .A(n1209), .B(n845), .C(n846), .D(n1121), .Y(n695) );
  OAI22X1 U707 ( .A(n1290), .B(n846), .C(n847), .D(n1121), .Y(n696) );
  OAI22X1 U708 ( .A(n1209), .B(n847), .C(n848), .D(n1292), .Y(n697) );
  OAI22X1 U709 ( .A(n1290), .B(n848), .C(n849), .D(n1292), .Y(n698) );
  OAI22X1 U710 ( .A(n1209), .B(n849), .C(n850), .D(n1292), .Y(n699) );
  OAI22X1 U711 ( .A(n1290), .B(n850), .C(n851), .D(n1292), .Y(n700) );
  OAI22X1 U712 ( .A(n1209), .B(n851), .C(n852), .D(n1292), .Y(n701) );
  OAI22X1 U713 ( .A(n1290), .B(n852), .C(n853), .D(n1292), .Y(n702) );
  OAI22X1 U714 ( .A(n1209), .B(n853), .C(n854), .D(n1292), .Y(n703) );
  OAI22X1 U715 ( .A(n1290), .B(n854), .C(n855), .D(n1292), .Y(n704) );
  OAI22X1 U716 ( .A(n1209), .B(n855), .C(n856), .D(n1292), .Y(n705) );
  OAI22X1 U717 ( .A(n1290), .B(n856), .C(n857), .D(n1292), .Y(n706) );
  OAI22X1 U718 ( .A(n1209), .B(n857), .C(n1292), .D(n858), .Y(n707) );
  AND2X1 U719 ( .A(n1350), .B(n1208), .Y(n708) );
  XNOR2X1 U721 ( .A(n877), .B(n1353), .Y(n843) );
  XNOR2X1 U722 ( .A(n1344), .B(n1080), .Y(n844) );
  XNOR2X1 U723 ( .A(n1342), .B(n1353), .Y(n845) );
  XNOR2X1 U724 ( .A(n1340), .B(n1080), .Y(n846) );
  XNOR2X1 U725 ( .A(n1338), .B(n1080), .Y(n847) );
  XNOR2X1 U726 ( .A(n1336), .B(n1353), .Y(n848) );
  XNOR2X1 U727 ( .A(n1334), .B(n1080), .Y(n849) );
  XNOR2X1 U728 ( .A(n1332), .B(n1080), .Y(n850) );
  XNOR2X1 U729 ( .A(n1330), .B(n1080), .Y(n851) );
  XNOR2X1 U730 ( .A(n1328), .B(n1353), .Y(n852) );
  XNOR2X1 U731 ( .A(n1326), .B(n1080), .Y(n853) );
  XNOR2X1 U732 ( .A(n1324), .B(n1080), .Y(n854) );
  XNOR2X1 U733 ( .A(n1322), .B(n1080), .Y(n855) );
  XNOR2X1 U734 ( .A(n1320), .B(n1080), .Y(n856) );
  XNOR2X1 U735 ( .A(n1318), .B(n1353), .Y(n857) );
  XNOR2X1 U736 ( .A(n1349), .B(n1080), .Y(n858) );
  OR2X1 U737 ( .A(n1349), .B(n1354), .Y(n859) );
  OAI22X1 U739 ( .A(n1242), .B(n876), .C(n1233), .D(n1288), .Y(n572) );
  OAI22X1 U742 ( .A(n1242), .B(n1233), .C(n860), .D(n1288), .Y(n710) );
  OAI22X1 U743 ( .A(n1242), .B(n860), .C(n861), .D(n1288), .Y(n711) );
  OAI22X1 U744 ( .A(n1242), .B(n861), .C(n862), .D(n1289), .Y(n712) );
  OAI22X1 U745 ( .A(n1242), .B(n862), .C(n863), .D(n1288), .Y(n713) );
  OAI22X1 U746 ( .A(n1242), .B(n863), .C(n864), .D(n1288), .Y(n714) );
  OAI22X1 U747 ( .A(n1242), .B(n864), .C(n865), .D(n1288), .Y(n715) );
  OAI22X1 U748 ( .A(n1242), .B(n865), .C(n866), .D(n1288), .Y(n716) );
  OAI22X1 U749 ( .A(n1242), .B(n866), .C(n867), .D(n1288), .Y(n717) );
  OAI22X1 U750 ( .A(n1242), .B(n867), .C(n868), .D(n1288), .Y(n718) );
  OAI22X1 U751 ( .A(n1242), .B(n868), .C(n869), .D(n1288), .Y(n719) );
  OAI22X1 U752 ( .A(n1242), .B(n869), .C(n870), .D(n1288), .Y(n720) );
  OAI22X1 U753 ( .A(n1242), .B(n870), .C(n871), .D(n1288), .Y(n721) );
  OAI22X1 U754 ( .A(n1242), .B(n871), .C(n872), .D(n1288), .Y(n722) );
  OAI22X1 U755 ( .A(n1242), .B(n872), .C(n873), .D(n1288), .Y(n723) );
  OAI22X1 U756 ( .A(n1242), .B(n873), .C(n874), .D(n1288), .Y(n724) );
  OAI22X1 U757 ( .A(n1242), .B(n874), .C(n1288), .D(n875), .Y(n725) );
  XNOR2X1 U758 ( .A(n877), .B(n1205), .Y(n860) );
  XNOR2X1 U759 ( .A(n1344), .B(n1205), .Y(n861) );
  XNOR2X1 U760 ( .A(n1342), .B(n1205), .Y(n862) );
  XNOR2X1 U761 ( .A(n1340), .B(n1266), .Y(n863) );
  XNOR2X1 U762 ( .A(n1338), .B(n1266), .Y(n864) );
  XNOR2X1 U763 ( .A(n1336), .B(n1266), .Y(n865) );
  XNOR2X1 U764 ( .A(n1334), .B(n1266), .Y(n866) );
  XNOR2X1 U765 ( .A(n1332), .B(n1266), .Y(n867) );
  XNOR2X1 U766 ( .A(n1330), .B(n1266), .Y(n868) );
  XNOR2X1 U767 ( .A(n1328), .B(n1266), .Y(n869) );
  XNOR2X1 U768 ( .A(n1326), .B(n1266), .Y(n870) );
  XNOR2X1 U769 ( .A(n1324), .B(n1266), .Y(n871) );
  XNOR2X1 U770 ( .A(n1322), .B(n1266), .Y(n872) );
  XNOR2X1 U771 ( .A(n1320), .B(n1266), .Y(n873) );
  XNOR2X1 U772 ( .A(n1318), .B(n1266), .Y(n874) );
  XNOR2X1 U773 ( .A(n1349), .B(n1266), .Y(n875) );
  OR2X1 U774 ( .A(n1349), .B(n1233), .Y(n876) );
  NAND2X1 U801 ( .A(n46), .B(n893), .Y(n48) );
  XNOR2X1 U803 ( .A(n37), .B(a[29]), .Y(n46) );
  XOR2X1 U805 ( .A(n37), .B(a[27]), .Y(n894) );
  XOR2X1 U814 ( .A(n19), .B(a[21]), .Y(n897) );
  XOR2X1 U817 ( .A(n1235), .B(a[19]), .Y(n898) );
  XOR2X1 U820 ( .A(n7), .B(a[17]), .Y(n899) );
  XOR2X1 U823 ( .A(n1), .B(a[15]), .Y(n900) );
  INVX8 U828 ( .A(n1325), .Y(n1326) );
  BUFX4 U829 ( .A(n428), .Y(n995) );
  INVX4 U830 ( .A(n1023), .Y(n1024) );
  INVX8 U831 ( .A(n1331), .Y(n1332) );
  INVX8 U832 ( .A(n1333), .Y(n1334) );
  INVX4 U833 ( .A(n884), .Y(n1331) );
  OR2X1 U834 ( .A(n1305), .B(n785), .Y(n1231) );
  INVX8 U835 ( .A(n1307), .Y(n1308) );
  INVX4 U836 ( .A(n30), .Y(n1302) );
  BUFX4 U837 ( .A(n503), .Y(n996) );
  INVX4 U838 ( .A(n1045), .Y(n1046) );
  INVX8 U839 ( .A(n1361), .Y(n1360) );
  INVX8 U840 ( .A(n31), .Y(n1361) );
  INVX4 U841 ( .A(n1359), .Y(n1111) );
  INVX8 U842 ( .A(n25), .Y(n1359) );
  INVX4 U843 ( .A(n555), .Y(n1087) );
  INVX4 U844 ( .A(n37), .Y(n1363) );
  INVX4 U845 ( .A(n1265), .Y(n1266) );
  INVX2 U846 ( .A(n1), .Y(n1265) );
  INVX2 U847 ( .A(n886), .Y(n1327) );
  INVX2 U848 ( .A(n555), .Y(n1098) );
  INVX2 U849 ( .A(n1302), .Y(n1303) );
  BUFX2 U850 ( .A(n438), .Y(n1267) );
  BUFX2 U851 ( .A(n424), .Y(n1264) );
  INVX2 U852 ( .A(n1077), .Y(n1121) );
  INVX4 U853 ( .A(n1263), .Y(n1292) );
  INVX4 U854 ( .A(n1323), .Y(n1324) );
  INVX2 U855 ( .A(n1306), .Y(n1008) );
  INVX2 U856 ( .A(n413), .Y(n1058) );
  BUFX2 U857 ( .A(n380), .Y(n1269) );
  INVX2 U858 ( .A(n626), .Y(n1075) );
  BUFX2 U859 ( .A(n393), .Y(n1268) );
  INVX4 U860 ( .A(n1302), .Y(n1304) );
  INVX2 U861 ( .A(n657), .Y(n1022) );
  INVX2 U862 ( .A(n1013), .Y(n40) );
  INVX2 U863 ( .A(n40), .Y(n1307) );
  BUFX2 U864 ( .A(n435), .Y(n1274) );
  INVX4 U865 ( .A(n1137), .Y(n1305) );
  BUFX2 U866 ( .A(n477), .Y(n1270) );
  INVX4 U867 ( .A(n1346), .Y(n1347) );
  INVX2 U868 ( .A(n392), .Y(n1160) );
  INVX2 U869 ( .A(n48), .Y(n1313) );
  BUFX2 U870 ( .A(n52), .Y(n1278) );
  BUFX2 U871 ( .A(n53), .Y(n1280) );
  XNOR2X1 U872 ( .A(n997), .B(n692), .Y(n414) );
  XNOR2X1 U873 ( .A(n1276), .B(n580), .Y(n997) );
  BUFX4 U874 ( .A(n454), .Y(n998) );
  FAX1 U875 ( .A(n1012), .B(n1019), .C(n998), .YC(n999) );
  INVX2 U876 ( .A(n1041), .Y(n1309) );
  BUFX4 U877 ( .A(n427), .Y(n1000) );
  INVX2 U878 ( .A(n49), .Y(n1351) );
  INVX2 U879 ( .A(n877), .Y(n1345) );
  OR2X2 U880 ( .A(n1198), .B(n1136), .Y(n1001) );
  AND2X2 U881 ( .A(n715), .B(n699), .Y(n1002) );
  OR2X2 U882 ( .A(n308), .B(n313), .Y(n1003) );
  AND2X2 U883 ( .A(n178), .B(n284), .Y(n1004) );
  AND2X2 U884 ( .A(n162), .B(n282), .Y(n1005) );
  XOR2X1 U885 ( .A(n19), .B(a[23]), .Y(n1006) );
  INVX2 U886 ( .A(n1311), .Y(n1135) );
  INVX2 U887 ( .A(n46), .Y(n1311) );
  INVX2 U888 ( .A(n16), .Y(n1293) );
  INVX4 U889 ( .A(n1321), .Y(n1322) );
  INVX2 U890 ( .A(n885), .Y(n1329) );
  INVX4 U891 ( .A(n1335), .Y(n1336) );
  INVX2 U892 ( .A(n882), .Y(n1335) );
  INVX2 U893 ( .A(n887), .Y(n1325) );
  INVX4 U894 ( .A(n1339), .Y(n1340) );
  INVX2 U895 ( .A(n880), .Y(n1339) );
  INVX4 U896 ( .A(n7), .Y(n1354) );
  INVX2 U897 ( .A(n917), .Y(n1241) );
  INVX2 U898 ( .A(a[15]), .Y(n917) );
  INVX4 U899 ( .A(n1343), .Y(n1344) );
  INVX4 U900 ( .A(n1341), .Y(n1342) );
  INVX2 U901 ( .A(n879), .Y(n1341) );
  OR2X2 U902 ( .A(n292), .B(n293), .Y(n1007) );
  INVX2 U903 ( .A(n1008), .Y(n1009) );
  INVX4 U904 ( .A(n1008), .Y(n1010) );
  INVX2 U905 ( .A(n465), .Y(n1011) );
  INVX2 U906 ( .A(n1011), .Y(n1012) );
  BUFX4 U907 ( .A(n19), .Y(n1273) );
  INVX4 U908 ( .A(n563), .Y(n1275) );
  INVX8 U909 ( .A(n1275), .Y(n1276) );
  XOR2X1 U910 ( .A(n31), .B(a[27]), .Y(n1013) );
  XOR2X1 U911 ( .A(n459), .B(n448), .Y(n1014) );
  XOR2X1 U912 ( .A(n446), .B(n1014), .Y(n444) );
  NAND2X1 U913 ( .A(n446), .B(n459), .Y(n1015) );
  NAND2X1 U914 ( .A(n446), .B(n448), .Y(n1016) );
  NAND2X1 U915 ( .A(n459), .B(n448), .Y(n1017) );
  NAND3X1 U916 ( .A(n1016), .B(n1015), .C(n1017), .Y(n443) );
  INVX2 U917 ( .A(n452), .Y(n1018) );
  INVX4 U918 ( .A(n1018), .Y(n1019) );
  XNOR2X1 U919 ( .A(n1020), .B(n461), .Y(n446) );
  XNOR2X1 U920 ( .A(n463), .B(n450), .Y(n1020) );
  INVX2 U921 ( .A(n174), .Y(n1021) );
  XNOR2X1 U922 ( .A(n625), .B(n1022), .Y(n1059) );
  XOR2X1 U923 ( .A(n715), .B(n699), .Y(n500) );
  INVX2 U924 ( .A(n1294), .Y(n1023) );
  INVX1 U925 ( .A(n148), .Y(n1025) );
  INVX4 U926 ( .A(n1078), .Y(n1294) );
  XOR2X1 U927 ( .A(n341), .B(n343), .Y(n1154) );
  BUFX4 U928 ( .A(n19), .Y(n1271) );
  INVX1 U929 ( .A(n1271), .Y(n1161) );
  BUFX2 U930 ( .A(n1309), .Y(n1026) );
  BUFX4 U931 ( .A(n19), .Y(n1272) );
  XOR2X1 U932 ( .A(n336), .B(n345), .Y(n1027) );
  XOR2X1 U933 ( .A(n334), .B(n1027), .Y(n332) );
  NAND2X1 U934 ( .A(n334), .B(n336), .Y(n1028) );
  NAND2X1 U935 ( .A(n334), .B(n345), .Y(n1029) );
  NAND2X1 U936 ( .A(n336), .B(n345), .Y(n1030) );
  NAND3X1 U937 ( .A(n1029), .B(n1028), .C(n1030), .Y(n331) );
  XOR2X1 U938 ( .A(n359), .B(n577), .Y(n1031) );
  XOR2X1 U939 ( .A(n1031), .B(n623), .Y(n348) );
  NAND2X1 U940 ( .A(n359), .B(n577), .Y(n1032) );
  NAND2X1 U941 ( .A(n359), .B(n623), .Y(n1033) );
  NAND2X1 U942 ( .A(n577), .B(n623), .Y(n1034) );
  NAND3X1 U943 ( .A(n1032), .B(n1033), .C(n1034), .Y(n347) );
  XOR2X1 U944 ( .A(n622), .B(n606), .Y(n1035) );
  XOR2X1 U945 ( .A(n1035), .B(n347), .Y(n334) );
  NAND2X1 U946 ( .A(n622), .B(n606), .Y(n1036) );
  NAND2X1 U947 ( .A(n622), .B(n347), .Y(n1037) );
  NAND2X1 U948 ( .A(n606), .B(n347), .Y(n1038) );
  NAND3X1 U949 ( .A(n1036), .B(n1037), .C(n1038), .Y(n333) );
  OR2X2 U950 ( .A(n1349), .B(n1161), .Y(n825) );
  INVX1 U951 ( .A(n129), .Y(n127) );
  INVX1 U952 ( .A(n13), .Y(n1039) );
  INVX4 U953 ( .A(n13), .Y(n1357) );
  AND2X2 U954 ( .A(n894), .B(n40), .Y(n1040) );
  AND2X2 U955 ( .A(n894), .B(n40), .Y(n1041) );
  INVX4 U956 ( .A(n1208), .Y(n1209) );
  INVX4 U957 ( .A(n1100), .Y(n1299) );
  INVX4 U958 ( .A(n1293), .Y(n1042) );
  XNOR2X1 U959 ( .A(n95), .B(n1043), .Y(product[44]) );
  AND2X2 U960 ( .A(n94), .B(n91), .Y(n1043) );
  INVX2 U961 ( .A(n1296), .Y(n555) );
  XNOR2X1 U962 ( .A(n631), .B(n1044), .Y(n454) );
  XNOR2X1 U963 ( .A(n679), .B(n599), .Y(n1044) );
  INVX2 U964 ( .A(n1089), .Y(n1306) );
  INVX2 U965 ( .A(n513), .Y(n1045) );
  OR2X2 U966 ( .A(n1349), .B(n1363), .Y(n774) );
  XNOR2X1 U967 ( .A(n1047), .B(n494), .Y(n492) );
  XNOR2X1 U968 ( .A(n496), .B(n996), .Y(n1047) );
  XOR2X1 U969 ( .A(n476), .B(n478), .Y(n1048) );
  XOR2X1 U970 ( .A(n1048), .B(n485), .Y(n472) );
  XOR2X1 U971 ( .A(n474), .B(n483), .Y(n1049) );
  XOR2X1 U972 ( .A(n1049), .B(n472), .Y(n470) );
  NAND2X1 U973 ( .A(n476), .B(n478), .Y(n1050) );
  NAND2X1 U974 ( .A(n476), .B(n485), .Y(n1051) );
  NAND2X1 U975 ( .A(n478), .B(n485), .Y(n1052) );
  NAND3X1 U976 ( .A(n1050), .B(n1051), .C(n1052), .Y(n471) );
  NAND2X1 U977 ( .A(n474), .B(n483), .Y(n1053) );
  NAND2X1 U978 ( .A(n474), .B(n472), .Y(n1054) );
  NAND2X1 U979 ( .A(n483), .B(n472), .Y(n1055) );
  NAND3X1 U980 ( .A(n1053), .B(n1054), .C(n1055), .Y(n469) );
  XNOR2X1 U981 ( .A(n86), .B(n1056), .Y(product[45]) );
  AND2X2 U982 ( .A(n85), .B(n275), .Y(n1056) );
  INVX4 U983 ( .A(n1317), .Y(n1318) );
  INVX2 U984 ( .A(n891), .Y(n1317) );
  OR2X2 U985 ( .A(n1057), .B(n1006), .Y(n30) );
  XNOR2X1 U986 ( .A(n25), .B(a[23]), .Y(n1057) );
  XOR2X1 U987 ( .A(n1058), .B(n409), .Y(n1206) );
  INVX2 U988 ( .A(n1006), .Y(n1301) );
  XOR2X1 U989 ( .A(n372), .B(n1059), .Y(n368) );
  NAND2X1 U990 ( .A(n372), .B(n625), .Y(n1060) );
  NAND2X1 U991 ( .A(n372), .B(n657), .Y(n1061) );
  NAND2X1 U992 ( .A(n625), .B(n657), .Y(n1062) );
  NAND3X1 U993 ( .A(n1061), .B(n1060), .C(n1062), .Y(n367) );
  INVX4 U994 ( .A(n1319), .Y(n1320) );
  INVX2 U995 ( .A(n890), .Y(n1319) );
  XOR2X1 U996 ( .A(n440), .B(n442), .Y(n1063) );
  XOR2X1 U997 ( .A(n1267), .B(n1063), .Y(n434) );
  NAND2X1 U998 ( .A(n1267), .B(n440), .Y(n1064) );
  NAND2X1 U999 ( .A(n1267), .B(n442), .Y(n1065) );
  NAND2X1 U1000 ( .A(n440), .B(n442), .Y(n1066) );
  NAND3X1 U1001 ( .A(n1065), .B(n1064), .C(n1066), .Y(n433) );
  NOR2X1 U1002 ( .A(n501), .B(n492), .Y(n1067) );
  XOR2X1 U1003 ( .A(n507), .B(n505), .Y(n1068) );
  XOR2X1 U1004 ( .A(n1068), .B(n498), .Y(n494) );
  NAND2X1 U1005 ( .A(n507), .B(n505), .Y(n1069) );
  NAND2X1 U1006 ( .A(n507), .B(n498), .Y(n1070) );
  NAND2X1 U1007 ( .A(n505), .B(n498), .Y(n1071) );
  NAND3X1 U1008 ( .A(n1069), .B(n1070), .C(n1071), .Y(n493) );
  NAND2X1 U1009 ( .A(n496), .B(n996), .Y(n1072) );
  NAND2X1 U1010 ( .A(n496), .B(n494), .Y(n1073) );
  NAND2X1 U1011 ( .A(n996), .B(n494), .Y(n1074) );
  NAND3X1 U1012 ( .A(n1072), .B(n1073), .C(n1074), .Y(n491) );
  INVX2 U1013 ( .A(n1311), .Y(n1312) );
  XNOR2X1 U1014 ( .A(n1359), .B(a[25]), .Y(n1137) );
  XNOR2X1 U1015 ( .A(n399), .B(n1075), .Y(n1081) );
  XNOR2X1 U1016 ( .A(n1076), .B(n419), .Y(n404) );
  XNOR2X1 U1017 ( .A(n421), .B(n408), .Y(n1076) );
  AND2X2 U1018 ( .A(n1291), .B(n899), .Y(n1077) );
  XOR2X1 U1019 ( .A(n1361), .B(a[25]), .Y(n1198) );
  AND2X2 U1020 ( .A(n898), .B(n16), .Y(n1078) );
  AND2X2 U1021 ( .A(n898), .B(n16), .Y(n1079) );
  INVX2 U1022 ( .A(n104), .Y(n102) );
  INVX8 U1023 ( .A(n1354), .Y(n1080) );
  XOR2X1 U1024 ( .A(n397), .B(n1081), .Y(n380) );
  NAND2X1 U1025 ( .A(n397), .B(n399), .Y(n1082) );
  NAND2X1 U1026 ( .A(n397), .B(n626), .Y(n1083) );
  NAND2X1 U1027 ( .A(n399), .B(n626), .Y(n1084) );
  NAND3X1 U1028 ( .A(n1083), .B(n1082), .C(n1084), .Y(n379) );
  NAND3X1 U1029 ( .A(n1285), .B(n1286), .C(n1287), .Y(n1085) );
  NAND3X1 U1030 ( .A(n1282), .B(n1283), .C(n1284), .Y(n1086) );
  INVX2 U1031 ( .A(n1260), .Y(n1296) );
  INVX2 U1032 ( .A(n1262), .Y(n1289) );
  INVX1 U1033 ( .A(n100), .Y(n98) );
  BUFX2 U1034 ( .A(a[29]), .Y(n1088) );
  NOR2X1 U1035 ( .A(n1198), .B(n1136), .Y(n1089) );
  XOR2X1 U1036 ( .A(n1331), .B(n1360), .Y(n782) );
  INVX1 U1037 ( .A(n183), .Y(n181) );
  XOR2X1 U1038 ( .A(n634), .B(n682), .Y(n1090) );
  XOR2X1 U1039 ( .A(n1090), .B(n650), .Y(n488) );
  NAND2X1 U1040 ( .A(n682), .B(n634), .Y(n1091) );
  NAND2X1 U1041 ( .A(n682), .B(n650), .Y(n1092) );
  NAND2X1 U1042 ( .A(n634), .B(n650), .Y(n1093) );
  NAND3X1 U1043 ( .A(n1091), .B(n1092), .C(n1093), .Y(n487) );
  XOR2X1 U1044 ( .A(n480), .B(n489), .Y(n1094) );
  XOR2X1 U1045 ( .A(n1094), .B(n487), .Y(n474) );
  NAND2X1 U1046 ( .A(n480), .B(n489), .Y(n1095) );
  NAND2X1 U1047 ( .A(n480), .B(n487), .Y(n1096) );
  NAND2X1 U1048 ( .A(n489), .B(n487), .Y(n1097) );
  NAND3X1 U1049 ( .A(n1095), .B(n1096), .C(n1097), .Y(n473) );
  INVX1 U1050 ( .A(n1260), .Y(n1297) );
  INVX2 U1051 ( .A(n1359), .Y(n1358) );
  AND2X2 U1052 ( .A(n897), .B(n1297), .Y(n1099) );
  AND2X2 U1053 ( .A(n1297), .B(n897), .Y(n1100) );
  INVX2 U1054 ( .A(n173), .Y(n1101) );
  XOR2X1 U1055 ( .A(n439), .B(n1264), .Y(n1102) );
  XOR2X1 U1056 ( .A(n1102), .B(n426), .Y(n420) );
  NAND2X1 U1057 ( .A(n439), .B(n1264), .Y(n1103) );
  NAND2X1 U1058 ( .A(n439), .B(n426), .Y(n1104) );
  NAND2X1 U1059 ( .A(n1264), .B(n426), .Y(n1105) );
  NAND3X1 U1060 ( .A(n1103), .B(n1104), .C(n1105), .Y(n419) );
  NAND2X1 U1061 ( .A(n408), .B(n421), .Y(n1106) );
  NAND2X1 U1062 ( .A(n421), .B(n419), .Y(n1107) );
  NAND2X1 U1063 ( .A(n408), .B(n419), .Y(n1108) );
  NAND3X1 U1064 ( .A(n1106), .B(n1107), .C(n1108), .Y(n403) );
  NAND3X1 U1065 ( .A(n1173), .B(n1172), .C(n1171), .Y(n1109) );
  INVX2 U1066 ( .A(n1291), .Y(n1208) );
  INVX2 U1067 ( .A(n420), .Y(n1110) );
  XNOR2X1 U1068 ( .A(n431), .B(n1110), .Y(n1131) );
  NAND2X1 U1069 ( .A(n692), .B(n1276), .Y(n1112) );
  NAND2X1 U1070 ( .A(n692), .B(n580), .Y(n1113) );
  NAND2X1 U1071 ( .A(n1276), .B(n580), .Y(n1114) );
  NAND3X1 U1072 ( .A(n1113), .B(n1112), .C(n1114), .Y(n413) );
  XNOR2X1 U1073 ( .A(n1115), .B(n377), .Y(n364) );
  XNOR2X1 U1074 ( .A(n368), .B(n379), .Y(n1115) );
  XNOR2X1 U1075 ( .A(n1346), .B(n1088), .Y(n893) );
  XOR2X1 U1076 ( .A(n433), .B(n1274), .Y(n1116) );
  XOR2X1 U1077 ( .A(n422), .B(n1116), .Y(n418) );
  NAND2X1 U1078 ( .A(n422), .B(n433), .Y(n1117) );
  NAND2X1 U1079 ( .A(n422), .B(n1274), .Y(n1118) );
  NAND2X1 U1080 ( .A(n433), .B(n1274), .Y(n1119) );
  NAND3X1 U1081 ( .A(n1118), .B(n1117), .C(n1119), .Y(n417) );
  XNOR2X1 U1082 ( .A(n145), .B(n1120), .Y(product[40]) );
  AND2X2 U1083 ( .A(n144), .B(n1244), .Y(n1120) );
  XNOR2X1 U1084 ( .A(n179), .B(n1004), .Y(product[36]) );
  XNOR2X1 U1085 ( .A(n163), .B(n1005), .Y(product[38]) );
  INVX2 U1086 ( .A(n1261), .Y(n1290) );
  NOR2X1 U1087 ( .A(n401), .B(n388), .Y(n1122) );
  XOR2X1 U1088 ( .A(n464), .B(n468), .Y(n1123) );
  XOR2X1 U1089 ( .A(n473), .B(n1123), .Y(n460) );
  NAND2X1 U1090 ( .A(n473), .B(n464), .Y(n1124) );
  NAND2X1 U1091 ( .A(n473), .B(n468), .Y(n1125) );
  NAND2X1 U1092 ( .A(n464), .B(n468), .Y(n1126) );
  NAND3X1 U1093 ( .A(n1125), .B(n1124), .C(n1126), .Y(n459) );
  XOR2X1 U1094 ( .A(n714), .B(n618), .Y(n1127) );
  XOR2X1 U1095 ( .A(n698), .B(n1127), .Y(n490) );
  NAND2X1 U1096 ( .A(n698), .B(n714), .Y(n1128) );
  NAND2X1 U1097 ( .A(n698), .B(n618), .Y(n1129) );
  NAND2X1 U1098 ( .A(n714), .B(n618), .Y(n1130) );
  NAND3X1 U1099 ( .A(n1129), .B(n1128), .C(n1130), .Y(n489) );
  XOR2X1 U1100 ( .A(n418), .B(n1131), .Y(n416) );
  NAND2X1 U1101 ( .A(n418), .B(n431), .Y(n1132) );
  NAND2X1 U1102 ( .A(n418), .B(n420), .Y(n1133) );
  NAND2X1 U1103 ( .A(n431), .B(n420), .Y(n1134) );
  NAND3X1 U1104 ( .A(n1133), .B(n1132), .C(n1134), .Y(n415) );
  AND2X2 U1105 ( .A(n1350), .B(n1347), .Y(n582) );
  INVX2 U1106 ( .A(n1351), .Y(n1350) );
  INVX1 U1107 ( .A(n1039), .Y(n1356) );
  INVX4 U1108 ( .A(n1262), .Y(n1288) );
  XOR2X1 U1109 ( .A(n25), .B(a[25]), .Y(n1136) );
  XOR2X1 U1110 ( .A(n651), .B(n567), .Y(n1138) );
  XOR2X1 U1111 ( .A(n1138), .B(n1146), .Y(n498) );
  NAND2X1 U1112 ( .A(n651), .B(n567), .Y(n1139) );
  NAND2X1 U1113 ( .A(n651), .B(n635), .Y(n1140) );
  NAND2X1 U1114 ( .A(n567), .B(n635), .Y(n1141) );
  NAND3X1 U1115 ( .A(n1139), .B(n1140), .C(n1141), .Y(n497) );
  XOR2X1 U1116 ( .A(n666), .B(n1002), .Y(n1142) );
  XOR2X1 U1117 ( .A(n1142), .B(n497), .Y(n486) );
  NAND2X1 U1118 ( .A(n666), .B(n1002), .Y(n1143) );
  NAND2X1 U1119 ( .A(n666), .B(n497), .Y(n1144) );
  NAND2X1 U1120 ( .A(n1002), .B(n497), .Y(n1145) );
  NAND3X1 U1121 ( .A(n1143), .B(n1144), .C(n1145), .Y(n485) );
  BUFX2 U1122 ( .A(n635), .Y(n1146) );
  INVX1 U1123 ( .A(n1279), .Y(n155) );
  INVX4 U1124 ( .A(n1040), .Y(n1310) );
  XOR2X1 U1125 ( .A(n1270), .B(n475), .Y(n1147) );
  XOR2X1 U1126 ( .A(n1147), .B(n466), .Y(n462) );
  NAND2X1 U1127 ( .A(n1270), .B(n475), .Y(n1148) );
  NAND2X1 U1128 ( .A(n1270), .B(n466), .Y(n1149) );
  NAND2X1 U1129 ( .A(n475), .B(n466), .Y(n1150) );
  NAND3X1 U1130 ( .A(n1148), .B(n1149), .C(n1150), .Y(n461) );
  NAND2X1 U1131 ( .A(n463), .B(n450), .Y(n1151) );
  NAND2X1 U1132 ( .A(n463), .B(n461), .Y(n1152) );
  NAND2X1 U1133 ( .A(n450), .B(n461), .Y(n1153) );
  NAND3X1 U1134 ( .A(n1151), .B(n1152), .C(n1153), .Y(n445) );
  XOR2X1 U1135 ( .A(n332), .B(n1154), .Y(n330) );
  NAND2X1 U1136 ( .A(n332), .B(n341), .Y(n1155) );
  NAND2X1 U1137 ( .A(n332), .B(n343), .Y(n1156) );
  NAND2X1 U1138 ( .A(n341), .B(n343), .Y(n1157) );
  NAND3X1 U1139 ( .A(n1156), .B(n1155), .C(n1157), .Y(n329) );
  BUFX2 U1140 ( .A(n1238), .Y(n1158) );
  INVX1 U1141 ( .A(n1356), .Y(n1159) );
  XNOR2X1 U1142 ( .A(n403), .B(n1160), .Y(n1183) );
  XOR2X1 U1143 ( .A(n400), .B(n396), .Y(n1162) );
  XOR2X1 U1144 ( .A(n1162), .B(n398), .Y(n392) );
  NAND2X1 U1145 ( .A(n400), .B(n396), .Y(n1163) );
  NAND2X1 U1146 ( .A(n400), .B(n398), .Y(n1164) );
  NAND2X1 U1147 ( .A(n396), .B(n398), .Y(n1165) );
  NAND3X1 U1148 ( .A(n1163), .B(n1164), .C(n1165), .Y(n391) );
  XOR2X1 U1149 ( .A(n1269), .B(n1268), .Y(n1166) );
  XOR2X1 U1150 ( .A(n1166), .B(n391), .Y(n376) );
  NAND2X1 U1151 ( .A(n1269), .B(n1268), .Y(n1167) );
  NAND2X1 U1152 ( .A(n1269), .B(n391), .Y(n1168) );
  NAND2X1 U1153 ( .A(n1268), .B(n391), .Y(n1169) );
  NAND3X1 U1154 ( .A(n1167), .B(n1168), .C(n1169), .Y(n375) );
  XOR2X1 U1155 ( .A(n445), .B(n434), .Y(n1170) );
  XOR2X1 U1156 ( .A(n432), .B(n1170), .Y(n430) );
  NAND2X1 U1157 ( .A(n432), .B(n445), .Y(n1171) );
  NAND2X1 U1158 ( .A(n432), .B(n434), .Y(n1172) );
  NAND2X1 U1159 ( .A(n445), .B(n434), .Y(n1173) );
  NAND3X1 U1160 ( .A(n1173), .B(n1172), .C(n1171), .Y(n429) );
  INVX8 U1161 ( .A(n1313), .Y(n1314) );
  INVX4 U1162 ( .A(n1241), .Y(n1242) );
  INVX2 U1163 ( .A(n1261), .Y(n1291) );
  XOR2X1 U1164 ( .A(n351), .B(n344), .Y(n1174) );
  XOR2X1 U1165 ( .A(n342), .B(n1174), .Y(n340) );
  NAND2X1 U1166 ( .A(n342), .B(n1085), .Y(n1175) );
  NAND2X1 U1167 ( .A(n342), .B(n344), .Y(n1176) );
  NAND2X1 U1168 ( .A(n1085), .B(n344), .Y(n1177) );
  NAND3X1 U1169 ( .A(n1176), .B(n1175), .C(n1177), .Y(n339) );
  XOR2X1 U1170 ( .A(n355), .B(n346), .Y(n1178) );
  XOR2X1 U1171 ( .A(n353), .B(n1178), .Y(n342) );
  NAND2X1 U1172 ( .A(n353), .B(n355), .Y(n1179) );
  NAND2X1 U1173 ( .A(n353), .B(n346), .Y(n1180) );
  NAND2X1 U1174 ( .A(n355), .B(n346), .Y(n1181) );
  NAND3X1 U1175 ( .A(n1180), .B(n1179), .C(n1181), .Y(n341) );
  XOR2X1 U1176 ( .A(n407), .B(n394), .Y(n1182) );
  XOR2X1 U1177 ( .A(n1182), .B(n405), .Y(n390) );
  XOR2X1 U1178 ( .A(n1183), .B(n390), .Y(n388) );
  NAND2X1 U1179 ( .A(n407), .B(n394), .Y(n1184) );
  NAND2X1 U1180 ( .A(n407), .B(n405), .Y(n1185) );
  NAND2X1 U1181 ( .A(n394), .B(n405), .Y(n1186) );
  NAND3X1 U1182 ( .A(n1184), .B(n1185), .C(n1186), .Y(n389) );
  NAND2X1 U1183 ( .A(n392), .B(n403), .Y(n1187) );
  NAND2X1 U1184 ( .A(n392), .B(n390), .Y(n1188) );
  NAND2X1 U1185 ( .A(n403), .B(n390), .Y(n1189) );
  NAND3X1 U1186 ( .A(n1187), .B(n1188), .C(n1189), .Y(n387) );
  XOR2X1 U1187 ( .A(n395), .B(n384), .Y(n1190) );
  XOR2X1 U1188 ( .A(n1190), .B(n382), .Y(n378) );
  NAND2X1 U1189 ( .A(n395), .B(n384), .Y(n1191) );
  NAND2X1 U1190 ( .A(n395), .B(n382), .Y(n1192) );
  NAND2X1 U1191 ( .A(n384), .B(n382), .Y(n1193) );
  NAND3X1 U1192 ( .A(n1191), .B(n1192), .C(n1193), .Y(n377) );
  NAND2X1 U1193 ( .A(n368), .B(n379), .Y(n1194) );
  NAND2X1 U1194 ( .A(n368), .B(n377), .Y(n1195) );
  NAND2X1 U1195 ( .A(n379), .B(n377), .Y(n1196) );
  NAND3X1 U1196 ( .A(n1194), .B(n1195), .C(n1196), .Y(n363) );
  INVX1 U1197 ( .A(n202), .Y(n1197) );
  XNOR2X1 U1198 ( .A(n112), .B(n1199), .Y(product[43]) );
  AND2X2 U1199 ( .A(n111), .B(n1250), .Y(n1199) );
  XNOR2X1 U1200 ( .A(n7), .B(a[19]), .Y(n16) );
  XNOR2X1 U1201 ( .A(n73), .B(n1200), .Y(product[46]) );
  AND2X2 U1202 ( .A(n72), .B(n1007), .Y(n1200) );
  INVX1 U1203 ( .A(n1224), .Y(n290) );
  INVX8 U1204 ( .A(n1357), .Y(n1235) );
  XOR2X1 U1205 ( .A(n999), .B(n449), .Y(n1201) );
  XOR2X1 U1206 ( .A(n436), .B(n1201), .Y(n432) );
  NAND2X1 U1207 ( .A(n436), .B(n447), .Y(n1202) );
  NAND2X1 U1208 ( .A(n436), .B(n449), .Y(n1203) );
  NAND2X1 U1209 ( .A(n447), .B(n449), .Y(n1204) );
  NAND3X1 U1210 ( .A(n1204), .B(n1202), .C(n1203), .Y(n431) );
  BUFX2 U1211 ( .A(n1), .Y(n1205) );
  INVX8 U1212 ( .A(n1363), .Y(n1362) );
  XNOR2X1 U1213 ( .A(n1206), .B(n411), .Y(n394) );
  INVX1 U1214 ( .A(n1300), .Y(n552) );
  XNOR2X1 U1215 ( .A(n154), .B(n1207), .Y(product[39]) );
  AND2X2 U1216 ( .A(n149), .B(n1025), .Y(n1207) );
  XOR2X1 U1217 ( .A(n578), .B(n385), .Y(n1210) );
  XOR2X1 U1218 ( .A(n1210), .B(n641), .Y(n372) );
  NAND2X1 U1219 ( .A(n641), .B(n578), .Y(n1211) );
  NAND2X1 U1220 ( .A(n641), .B(n385), .Y(n1212) );
  NAND2X1 U1221 ( .A(n578), .B(n385), .Y(n1213) );
  NAND3X1 U1222 ( .A(n1212), .B(n1211), .C(n1213), .Y(n371) );
  INVX2 U1223 ( .A(n283), .Y(n1214) );
  INVX1 U1224 ( .A(n222), .Y(n221) );
  XOR2X1 U1225 ( .A(n628), .B(n612), .Y(n1215) );
  XOR2X1 U1226 ( .A(n1215), .B(n596), .Y(n412) );
  NAND2X1 U1227 ( .A(n628), .B(n612), .Y(n1216) );
  NAND2X1 U1228 ( .A(n628), .B(n596), .Y(n1217) );
  NAND2X1 U1229 ( .A(n612), .B(n596), .Y(n1218) );
  NAND3X1 U1230 ( .A(n1216), .B(n1217), .C(n1218), .Y(n411) );
  NAND2X1 U1231 ( .A(n413), .B(n409), .Y(n1219) );
  NAND2X1 U1232 ( .A(n413), .B(n411), .Y(n1220) );
  NAND2X1 U1233 ( .A(n409), .B(n411), .Y(n1221) );
  NAND3X1 U1234 ( .A(n1219), .B(n1220), .C(n1221), .Y(n393) );
  NOR2X1 U1235 ( .A(n1135), .B(n752), .Y(n1222) );
  NOR2X1 U1236 ( .A(n753), .B(n1314), .Y(n1223) );
  OR2X2 U1237 ( .A(n1222), .B(n1223), .Y(n596) );
  NOR2X1 U1238 ( .A(n457), .B(n444), .Y(n1224) );
  INVX1 U1239 ( .A(n1039), .Y(n1236) );
  NOR2X1 U1240 ( .A(n429), .B(n416), .Y(n1225) );
  NAND2X1 U1241 ( .A(n1244), .B(n281), .Y(n1226) );
  NAND2X1 U1242 ( .A(n1244), .B(n1025), .Y(n1227) );
  BUFX2 U1243 ( .A(n1352), .Y(n1233) );
  NAND2X1 U1244 ( .A(n631), .B(n679), .Y(n1228) );
  NAND2X1 U1245 ( .A(n631), .B(n599), .Y(n1229) );
  NAND2X1 U1246 ( .A(n679), .B(n599), .Y(n1230) );
  NAND3X1 U1247 ( .A(n1230), .B(n1228), .C(n1229), .Y(n453) );
  OR2X1 U1248 ( .A(n786), .B(n1001), .Y(n1232) );
  NAND2X1 U1249 ( .A(n1231), .B(n1232), .Y(n631) );
  INVX2 U1250 ( .A(n918), .Y(n1257) );
  INVX1 U1251 ( .A(n1), .Y(n1352) );
  INVX2 U1252 ( .A(n287), .Y(n1234) );
  INVX2 U1253 ( .A(n1099), .Y(n1237) );
  NAND2X1 U1254 ( .A(n1244), .B(n281), .Y(n1238) );
  OR2X2 U1255 ( .A(n1227), .B(n80), .Y(n1243) );
  OR2X2 U1256 ( .A(n470), .B(n481), .Y(n1245) );
  OR2X2 U1257 ( .A(n322), .B(n329), .Y(n1244) );
  OR2X2 U1258 ( .A(n302), .B(n307), .Y(n1250) );
  OR2X1 U1259 ( .A(n724), .B(n708), .Y(n1239) );
  AND2X1 U1260 ( .A(n724), .B(n708), .Y(n1240) );
  INVX4 U1261 ( .A(n1354), .Y(n1353) );
  INVX4 U1262 ( .A(n1351), .Y(n1349) );
  AND2X1 U1263 ( .A(n572), .B(n725), .Y(n1259) );
  INVX1 U1264 ( .A(n918), .Y(n1258) );
  AND2X2 U1265 ( .A(n491), .B(n482), .Y(n1246) );
  OR2X1 U1266 ( .A(n491), .B(n482), .Y(n1247) );
  AND2X2 U1267 ( .A(n481), .B(n470), .Y(n1248) );
  XNOR2X1 U1268 ( .A(n1249), .B(n1086), .Y(n352) );
  XNOR2X1 U1269 ( .A(n356), .B(n367), .Y(n1249) );
  OR2X1 U1270 ( .A(n523), .B(n518), .Y(n1251) );
  AND2X2 U1271 ( .A(n523), .B(n518), .Y(n1252) );
  INVX2 U1272 ( .A(n554), .Y(n655) );
  INVX2 U1273 ( .A(n557), .Y(n673) );
  INVX2 U1274 ( .A(n1276), .Y(n709) );
  INVX2 U1275 ( .A(n560), .Y(n691) );
  INVX2 U1276 ( .A(n551), .Y(n637) );
  OR2X1 U1277 ( .A(n533), .B(n530), .Y(n1253) );
  OR2X1 U1278 ( .A(n539), .B(n538), .Y(n1254) );
  AND2X2 U1279 ( .A(n533), .B(n530), .Y(n1255) );
  AND2X2 U1280 ( .A(n539), .B(n538), .Y(n1256) );
  XNOR2X1 U1281 ( .A(n542), .B(n573), .Y(n291) );
  INVX2 U1282 ( .A(n1039), .Y(n1355) );
  INVX2 U1283 ( .A(n548), .Y(n619) );
  INVX2 U1284 ( .A(n1099), .Y(n1298) );
  INVX2 U1285 ( .A(n545), .Y(n601) );
  INVX2 U1286 ( .A(n1006), .Y(n1300) );
  INVX4 U1287 ( .A(n1079), .Y(n1295) );
  AND2X2 U1288 ( .A(n1257), .B(n1328), .Y(n359) );
  AND2X2 U1289 ( .A(n1258), .B(n1324), .Y(n385) );
  XOR2X1 U1290 ( .A(n13), .B(a[21]), .Y(n1260) );
  INVX2 U1291 ( .A(n888), .Y(n1323) );
  INVX2 U1292 ( .A(n878), .Y(n1343) );
  INVX2 U1293 ( .A(n883), .Y(n1333) );
  INVX2 U1294 ( .A(n881), .Y(n1337) );
  INVX2 U1295 ( .A(n889), .Y(n1321) );
  XOR2X1 U1296 ( .A(n1), .B(a[17]), .Y(n1261) );
  AND2X2 U1297 ( .A(n917), .B(n900), .Y(n1262) );
  AND2X2 U1298 ( .A(n1291), .B(n899), .Y(n1263) );
  INVX1 U1299 ( .A(n171), .Y(n173) );
  INVX4 U1300 ( .A(n51), .Y(n1315) );
  INVX1 U1301 ( .A(n128), .Y(n126) );
  INVX1 U1302 ( .A(n210), .Y(n289) );
  INVX1 U1303 ( .A(n200), .Y(n202) );
  INVX1 U1304 ( .A(n1122), .Y(n286) );
  INVX1 U1305 ( .A(n199), .Y(n201) );
  INVX1 U1306 ( .A(n1225), .Y(n288) );
  BUFX2 U1307 ( .A(n52), .Y(n1277) );
  BUFX2 U1308 ( .A(n53), .Y(n1279) );
  XOR2X1 U1309 ( .A(n383), .B(n381), .Y(n1281) );
  XOR2X1 U1310 ( .A(n1281), .B(n370), .Y(n366) );
  NAND2X1 U1311 ( .A(n383), .B(n381), .Y(n1282) );
  NAND2X1 U1312 ( .A(n383), .B(n370), .Y(n1283) );
  NAND2X1 U1313 ( .A(n381), .B(n370), .Y(n1284) );
  NAND3X1 U1314 ( .A(n1282), .B(n1283), .C(n1284), .Y(n365) );
  NAND2X1 U1315 ( .A(n356), .B(n367), .Y(n1285) );
  NAND2X1 U1316 ( .A(n356), .B(n365), .Y(n1286) );
  NAND2X1 U1317 ( .A(n365), .B(n367), .Y(n1287) );
  NAND3X1 U1318 ( .A(n1285), .B(n1286), .C(n1287), .Y(n351) );
  INVX1 U1319 ( .A(n166), .Y(n283) );
  INVX1 U1320 ( .A(n161), .Y(n282) );
  INVX1 U1321 ( .A(n177), .Y(n284) );
  INVX1 U1322 ( .A(n172), .Y(n174) );
  INVX1 U1323 ( .A(n194), .Y(n287) );
  INVX1 U1324 ( .A(n1278), .Y(n156) );
  INVX8 U1325 ( .A(n1348), .Y(n918) );
  INVX8 U1326 ( .A(n1315), .Y(n1316) );
  INVX8 U1327 ( .A(n1327), .Y(n1328) );
  INVX8 U1328 ( .A(n1329), .Y(n1330) );
  INVX8 U1329 ( .A(n1337), .Y(n1338) );
  INVX8 U1330 ( .A(n541), .Y(n1346) );
  INVX8 U1331 ( .A(n1346), .Y(n1348) );
  INVX2 U1332 ( .A(n101), .Y(n99) );
  INVX2 U1333 ( .A(n94), .Y(n92) );
  INVX2 U1334 ( .A(n79), .Y(n77) );
  INVX2 U1335 ( .A(n1334), .Y(n732) );
  INVX2 U1336 ( .A(n1338), .Y(n730) );
  OAI22X1 U1337 ( .A(n1242), .B(n1233), .C(n1289), .D(n1233), .Y(n563) );
  OAI22X1 U1338 ( .A(n1290), .B(n1354), .C(n1121), .D(n1354), .Y(n560) );
  OAI22X1 U1339 ( .A(n1042), .B(n1159), .C(n1294), .D(n1159), .Y(n557) );
  OAI22X1 U1340 ( .A(n1087), .B(n1161), .C(n1299), .D(n1161), .Y(n554) );
  OAI22X1 U1341 ( .A(n1300), .B(n1359), .C(n1304), .D(n1359), .Y(n551) );
  OAI22X1 U1342 ( .A(n1305), .B(n1361), .C(n1010), .D(n1361), .Y(n548) );
  OAI22X1 U1343 ( .A(n1308), .B(n1363), .C(n1310), .D(n1363), .Y(n545) );
  OAI22X1 U1344 ( .A(n1312), .B(n918), .C(n1314), .D(n918), .Y(n542) );
  INVX2 U1345 ( .A(n385), .Y(n386) );
  INVX2 U1346 ( .A(n359), .Y(n360) );
  INVX2 U1347 ( .A(n337), .Y(n338) );
  INVX2 U1348 ( .A(n319), .Y(n320) );
  INVX2 U1349 ( .A(n305), .Y(n306) );
  INVX2 U1350 ( .A(n295), .Y(n296) );
  INVX2 U1351 ( .A(n130), .Y(n279) );
  INVX2 U1352 ( .A(n93), .Y(n91) );
  INVX2 U1353 ( .A(n84), .Y(n275) );
  INVX2 U1354 ( .A(n213), .Y(n212) );
  INVX2 U1355 ( .A(n211), .Y(n209) );
  INVX2 U1356 ( .A(n182), .Y(n285) );
  INVX2 U1357 ( .A(n149), .Y(n151) );
  INVX2 U1358 ( .A(n148), .Y(n281) );
  INVX2 U1359 ( .A(n144), .Y(n142) );
  INVX2 U1360 ( .A(n122), .Y(n120) );
  INVX2 U1361 ( .A(n111), .Y(n109) );
  INVX2 U1362 ( .A(n105), .Y(n103) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16], n24, n11, n39, 
        src1_data[12], n14, src1_data[10], n4, n7, n16, n13, n15, src1_data[4], 
        n10, src1_data[2], n12, n6}), .B({src2_data[16], src2_data[16], n22, 
        src2_data[14:13], n2, src2_data[11:0]}), .CI(1'b0), .DIFF(large_dif)
         );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16], n24, src1_data[14], 
        n39, src1_data[12], n14, src1_data[10], n4, n7, n16, n3, n15, 
        src1_data[4], n10, src1_data[2], n12, n5}), .B({src2_data[16], 
        src2_data[16], n22, src2_data[14:13], n2, src2_data[11:0]}), .CI(1'b0), 
        .SUM(large_sum) );
  alu_DW_mult_uns_2 mult_35 ( .a({n24, src1_data[14], n39, src1_data[12], n37, 
        src1_data[10], n35, src1_data[8], n9, src1_data[6:4], n31, 
        src1_data[2], n29, n26, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .b({n22, src2_data[14:0]}), 
        .product({N26, full_mult[45:30], SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14, 
        SYNOPSYS_UNCONNECTED__15, SYNOPSYS_UNCONNECTED__16, 
        SYNOPSYS_UNCONNECTED__17, SYNOPSYS_UNCONNECTED__18, 
        SYNOPSYS_UNCONNECTED__19, SYNOPSYS_UNCONNECTED__20, 
        SYNOPSYS_UNCONNECTED__21, SYNOPSYS_UNCONNECTED__22, 
        SYNOPSYS_UNCONNECTED__23, SYNOPSYS_UNCONNECTED__24, 
        SYNOPSYS_UNCONNECTED__25, SYNOPSYS_UNCONNECTED__26, 
        SYNOPSYS_UNCONNECTED__27, SYNOPSYS_UNCONNECTED__28, 
        SYNOPSYS_UNCONNECTED__29}) );
  BUFX4 U3 ( .A(src1_data[7]), .Y(n9) );
  INVX2 U4 ( .A(n25), .Y(n26) );
  INVX2 U6 ( .A(n32), .Y(n31) );
  INVX2 U7 ( .A(src1_data[13]), .Y(n40) );
  INVX4 U9 ( .A(n21), .Y(n22) );
  INVX2 U10 ( .A(src2_data[15]), .Y(n21) );
  INVX2 U11 ( .A(src1_data[15]), .Y(n23) );
  XNOR2X1 U12 ( .A(n79), .B(large_sum[17]), .Y(n1) );
  INVX1 U13 ( .A(src1_data[5]), .Y(n33) );
  BUFX2 U14 ( .A(src2_data[12]), .Y(n2) );
  BUFX2 U15 ( .A(src1_data[6]), .Y(n3) );
  INVX1 U16 ( .A(n36), .Y(n4) );
  INVX4 U17 ( .A(n36), .Y(n35) );
  INVX2 U18 ( .A(src1_data[9]), .Y(n36) );
  INVX1 U19 ( .A(n25), .Y(n5) );
  INVX1 U20 ( .A(n25), .Y(n6) );
  INVX2 U21 ( .A(src1_data[0]), .Y(n25) );
  BUFX2 U22 ( .A(src1_data[8]), .Y(n7) );
  INVX1 U23 ( .A(n31), .Y(n8) );
  INVX1 U24 ( .A(n8), .Y(n10) );
  INVX2 U25 ( .A(src1_data[3]), .Y(n32) );
  INVX2 U26 ( .A(n30), .Y(n12) );
  INVX8 U27 ( .A(n40), .Y(n39) );
  BUFX2 U28 ( .A(src1_data[14]), .Y(n11) );
  INVX1 U29 ( .A(n9), .Y(n34) );
  INVX2 U30 ( .A(src1_data[1]), .Y(n30) );
  BUFX2 U31 ( .A(n3), .Y(n13) );
  INVX4 U32 ( .A(n30), .Y(n29) );
  INVX1 U33 ( .A(n38), .Y(n14) );
  INVX4 U34 ( .A(n38), .Y(n37) );
  INVX2 U35 ( .A(src1_data[11]), .Y(n38) );
  INVX1 U36 ( .A(n33), .Y(n15) );
  INVX1 U37 ( .A(n34), .Y(n16) );
  NAND2X1 U38 ( .A(n1), .B(n75), .Y(n17) );
  NAND2X1 U39 ( .A(n17), .B(n42), .Y(overflow) );
  INVX2 U40 ( .A(n80), .Y(n75) );
  AND2X2 U41 ( .A(n44), .B(n43), .Y(n18) );
  AND2X2 U42 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n19) );
  AND2X2 U43 ( .A(alu_op[1]), .B(n43), .Y(n20) );
  INVX8 U44 ( .A(n23), .Y(n24) );
  INVX2 U45 ( .A(large_sum[16]), .Y(n79) );
  INVX2 U46 ( .A(alu_op[1]), .Y(n44) );
  NAND2X1 U47 ( .A(alu_op[0]), .B(n44), .Y(n80) );
  INVX2 U48 ( .A(alu_op[0]), .Y(n43) );
  XOR2X1 U49 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n41) );
  AOI22X1 U50 ( .A(N26), .B(n19), .C(n20), .D(n41), .Y(n42) );
  AOI22X1 U51 ( .A(n5), .B(n18), .C(full_mult[30]), .D(n19), .Y(n46) );
  AOI22X1 U52 ( .A(large_dif[0]), .B(n20), .C(large_sum[0]), .D(n75), .Y(n45)
         );
  NAND2X1 U53 ( .A(n46), .B(n45), .Y(result[0]) );
  AOI22X1 U54 ( .A(n12), .B(n18), .C(full_mult[31]), .D(n19), .Y(n48) );
  AOI22X1 U55 ( .A(large_dif[1]), .B(n20), .C(large_sum[1]), .D(n75), .Y(n47)
         );
  NAND2X1 U56 ( .A(n48), .B(n47), .Y(result[1]) );
  AOI22X1 U57 ( .A(src1_data[2]), .B(n18), .C(full_mult[32]), .D(n19), .Y(n50)
         );
  AOI22X1 U58 ( .A(large_dif[2]), .B(n20), .C(large_sum[2]), .D(n75), .Y(n49)
         );
  NAND2X1 U59 ( .A(n50), .B(n49), .Y(result[2]) );
  AOI22X1 U60 ( .A(n10), .B(n18), .C(full_mult[33]), .D(n19), .Y(n52) );
  AOI22X1 U61 ( .A(large_dif[3]), .B(n20), .C(large_sum[3]), .D(n75), .Y(n51)
         );
  NAND2X1 U62 ( .A(n52), .B(n51), .Y(result[3]) );
  AOI22X1 U63 ( .A(src1_data[4]), .B(n18), .C(full_mult[34]), .D(n19), .Y(n54)
         );
  AOI22X1 U64 ( .A(large_dif[4]), .B(n20), .C(large_sum[4]), .D(n75), .Y(n53)
         );
  NAND2X1 U65 ( .A(n54), .B(n53), .Y(result[4]) );
  AOI22X1 U66 ( .A(n15), .B(n18), .C(full_mult[35]), .D(n19), .Y(n56) );
  AOI22X1 U67 ( .A(large_dif[5]), .B(n20), .C(large_sum[5]), .D(n75), .Y(n55)
         );
  NAND2X1 U68 ( .A(n56), .B(n55), .Y(result[5]) );
  AOI22X1 U69 ( .A(n13), .B(n18), .C(full_mult[36]), .D(n19), .Y(n58) );
  AOI22X1 U70 ( .A(large_dif[6]), .B(n20), .C(large_sum[6]), .D(n75), .Y(n57)
         );
  NAND2X1 U71 ( .A(n58), .B(n57), .Y(result[6]) );
  AOI22X1 U72 ( .A(n16), .B(n18), .C(full_mult[37]), .D(n19), .Y(n60) );
  AOI22X1 U73 ( .A(large_dif[7]), .B(n20), .C(large_sum[7]), .D(n75), .Y(n59)
         );
  NAND2X1 U74 ( .A(n59), .B(n60), .Y(result[7]) );
  AOI22X1 U75 ( .A(n7), .B(n18), .C(full_mult[38]), .D(n19), .Y(n62) );
  AOI22X1 U76 ( .A(large_dif[8]), .B(n20), .C(large_sum[8]), .D(n75), .Y(n61)
         );
  NAND2X1 U77 ( .A(n61), .B(n62), .Y(result[8]) );
  AOI22X1 U78 ( .A(n4), .B(n18), .C(full_mult[39]), .D(n19), .Y(n64) );
  AOI22X1 U79 ( .A(large_dif[9]), .B(n20), .C(large_sum[9]), .D(n75), .Y(n63)
         );
  NAND2X1 U80 ( .A(n64), .B(n63), .Y(result[9]) );
  AOI22X1 U81 ( .A(src1_data[10]), .B(n18), .C(full_mult[40]), .D(n19), .Y(n66) );
  AOI22X1 U82 ( .A(large_dif[10]), .B(n20), .C(large_sum[10]), .D(n75), .Y(n65) );
  NAND2X1 U83 ( .A(n65), .B(n66), .Y(result[10]) );
  AOI22X1 U84 ( .A(n14), .B(n18), .C(full_mult[41]), .D(n19), .Y(n68) );
  AOI22X1 U85 ( .A(large_dif[11]), .B(n20), .C(large_sum[11]), .D(n75), .Y(n67) );
  NAND2X1 U86 ( .A(n67), .B(n68), .Y(result[11]) );
  AOI22X1 U87 ( .A(src1_data[12]), .B(n18), .C(full_mult[42]), .D(n19), .Y(n70) );
  AOI22X1 U88 ( .A(large_dif[12]), .B(n20), .C(large_sum[12]), .D(n75), .Y(n69) );
  NAND2X1 U89 ( .A(n69), .B(n70), .Y(result[12]) );
  AOI22X1 U90 ( .A(n39), .B(n18), .C(full_mult[43]), .D(n19), .Y(n72) );
  AOI22X1 U91 ( .A(large_dif[13]), .B(n20), .C(large_sum[13]), .D(n75), .Y(n71) );
  NAND2X1 U92 ( .A(n72), .B(n71), .Y(result[13]) );
  AOI22X1 U93 ( .A(n11), .B(n18), .C(full_mult[44]), .D(n19), .Y(n74) );
  AOI22X1 U94 ( .A(large_dif[14]), .B(n20), .C(large_sum[14]), .D(n75), .Y(n73) );
  NAND2X1 U95 ( .A(n73), .B(n74), .Y(result[14]) );
  AOI22X1 U96 ( .A(n24), .B(n18), .C(full_mult[45]), .D(n19), .Y(n77) );
  AOI22X1 U97 ( .A(large_dif[15]), .B(n20), .C(large_sum[15]), .D(n75), .Y(n76) );
  NAND2X1 U98 ( .A(n76), .B(n77), .Y(result[15]) );
  AOI22X1 U99 ( .A(src1_data[16]), .B(n18), .C(large_dif[16]), .D(n20), .Y(n78) );
  OAI21X1 U100 ( .A(n80), .B(n79), .C(n78), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n14), .Y(n40) );
  INVX2 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(write_enable), .Y(n1) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  INVX1 U8 ( .A(n11), .Y(n46) );
  INVX1 U9 ( .A(n13), .Y(n42) );
  INVX1 U10 ( .A(n18), .Y(n32) );
  INVX1 U11 ( .A(n16), .Y(n36) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U29 ( .A(n12), .Y(n44) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n14), .Y(n40) );
  INVX1 U4 ( .A(n18), .Y(n32) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  INVX1 U9 ( .A(n11), .Y(n46) );
  INVX1 U10 ( .A(n13), .Y(n42) );
  INVX1 U11 ( .A(n17), .Y(n34) );
  INVX1 U12 ( .A(n16), .Y(n36) );
  INVX1 U13 ( .A(n20), .Y(n30) );
  INVX1 U14 ( .A(n22), .Y(n28) );
  MUX2X1 U15 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U16 ( .A(n5), .Y(n55) );
  MUX2X1 U17 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U18 ( .A(n6), .Y(n54) );
  MUX2X1 U19 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U20 ( .A(n7), .Y(n53) );
  MUX2X1 U21 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U22 ( .A(n8), .Y(n52) );
  MUX2X1 U23 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U24 ( .A(n9), .Y(n50) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U26 ( .A(n10), .Y(n48) );
  MUX2X1 U27 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U29 ( .A(n12), .Y(n44) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U33 ( .A(n16), .Y(n36) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U33 ( .A(n16), .Y(n36) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U33 ( .A(n16), .Y(n36) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U33 ( .A(n16), .Y(n36) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U33 ( .A(n16), .Y(n36) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U33 ( .A(n16), .Y(n36) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U33 ( .A(n16), .Y(n36) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U33 ( .A(n16), .Y(n36) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U33 ( .A(n16), .Y(n36) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U33 ( .A(n16), .Y(n36) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U33 ( .A(n16), .Y(n36) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U33 ( .A(n16), .Y(n36) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U33 ( .A(n16), .Y(n36) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n38) );
  INVX1 U3 ( .A(n20), .Y(n30) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX1 U5 ( .A(n18), .Y(n32) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n11), .Y(n46) );
  INVX1 U11 ( .A(n13), .Y(n42) );
  INVX1 U12 ( .A(n17), .Y(n34) );
  INVX1 U13 ( .A(n22), .Y(n28) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n55) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n54) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n53) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n52) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n50) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U25 ( .A(n10), .Y(n48) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U27 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U28 ( .A(n12), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U33 ( .A(n16), .Y(n36) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, n677, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n2, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n664, n665, n666, n667,
         n668, n669, n670, n671, n672, n673, n674, n675, n676;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n676), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n674), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n675), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n676), .Y(n10) );
  NOR2X1 U29 ( .A(n673), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n674), .B(n675), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n672), 
        .write_enable(write_enables[0]), .new_value({n662, n659, n657, n654, 
        n651, n649, n646, n643, n640, n637, n634, n632, n629, n626, n623, n620, 
        n617}), .current_value({n677, outreg_data[15:0]}) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n665), 
        .write_enable(write_enables[1]), .new_value({n661, n659, n656, n653, 
        n651, n648, n645, n642, n639, n636, n634, n631, n628, n625, n622, n619, 
        n617}), .current_value({\regs_matrix[1][16] , \regs_matrix[1][15] , 
        \regs_matrix[1][14] , \regs_matrix[1][13] , \regs_matrix[1][12] , 
        \regs_matrix[1][11] , \regs_matrix[1][10] , \regs_matrix[1][9] , 
        \regs_matrix[1][8] , \regs_matrix[1][7] , \regs_matrix[1][6] , 
        \regs_matrix[1][5] , \regs_matrix[1][4] , \regs_matrix[1][3] , 
        \regs_matrix[1][2] , \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n665), 
        .write_enable(write_enables[2]), .new_value({n662, n659, n657, n654, 
        n651, n649, n646, n643, n640, n637, n634, n632, n629, n626, n623, n620, 
        w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n666), 
        .write_enable(write_enables[3]), .new_value({n661, n659, n656, n653, 
        n651, n648, n645, n642, n639, n636, n634, n631, n628, n625, n622, n619, 
        n617}), .current_value({\regs_matrix[3][16] , \regs_matrix[3][15] , 
        \regs_matrix[3][14] , \regs_matrix[3][13] , \regs_matrix[3][12] , 
        \regs_matrix[3][11] , \regs_matrix[3][10] , \regs_matrix[3][9] , 
        \regs_matrix[3][8] , \regs_matrix[3][7] , \regs_matrix[3][6] , 
        \regs_matrix[3][5] , \regs_matrix[3][4] , \regs_matrix[3][3] , 
        \regs_matrix[3][2] , \regs_matrix[3][1] , \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n666), 
        .write_enable(write_enables[4]), .new_value({n662, n659, n657, n654, 
        n651, n649, n646, n643, n640, n637, n634, n632, n629, n626, n623, n620, 
        w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n667), 
        .write_enable(write_enables[5]), .new_value({n661, n659, n656, n653, 
        n651, n648, n645, n642, n639, n636, n634, n631, n628, n625, n622, n619, 
        n617}), .current_value({\regs_matrix[5][16] , \regs_matrix[5][15] , 
        \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] , 
        \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] , 
        \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] , 
        \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] , 
        \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n667), 
        .write_enable(write_enables[6]), .new_value({n662, n659, n657, n654, 
        n651, n649, n646, n643, n640, n637, n634, n632, n629, n626, n623, n620, 
        w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n668), 
        .write_enable(write_enables[7]), .new_value({n661, n659, n656, n653, 
        n651, n648, n645, n642, n639, n636, n634, n631, n628, n625, n622, n619, 
        n617}), .current_value({\regs_matrix[7][16] , \regs_matrix[7][15] , 
        \regs_matrix[7][14] , \regs_matrix[7][13] , \regs_matrix[7][12] , 
        \regs_matrix[7][11] , \regs_matrix[7][10] , \regs_matrix[7][9] , 
        \regs_matrix[7][8] , \regs_matrix[7][7] , \regs_matrix[7][6] , 
        \regs_matrix[7][5] , \regs_matrix[7][4] , \regs_matrix[7][3] , 
        \regs_matrix[7][2] , \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n668), 
        .write_enable(write_enables[8]), .new_value({n662, n659, n657, n654, 
        n651, n649, n646, n643, n640, n637, n634, n632, n629, n626, n623, n620, 
        w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n669), 
        .write_enable(write_enables[9]), .new_value({n661, n659, n656, n653, 
        n651, n648, n645, n642, n639, n636, n634, n631, n628, n625, n622, n619, 
        n617}), .current_value({\regs_matrix[9][16] , \regs_matrix[9][15] , 
        \regs_matrix[9][14] , \regs_matrix[9][13] , \regs_matrix[9][12] , 
        \regs_matrix[9][11] , \regs_matrix[9][10] , \regs_matrix[9][9] , 
        \regs_matrix[9][8] , \regs_matrix[9][7] , \regs_matrix[9][6] , 
        \regs_matrix[9][5] , \regs_matrix[9][4] , \regs_matrix[9][3] , 
        \regs_matrix[9][2] , \regs_matrix[9][1] , \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n669), 
        .write_enable(write_enables[10]), .new_value({n662, n659, n657, n654, 
        n651, n649, n646, n643, n640, n637, n634, n632, n629, n626, n623, n620, 
        w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n670), 
        .write_enable(write_enables[11]), .new_value({n661, n659, n656, n653, 
        n651, n648, n645, n642, n639, n636, n634, n631, n628, n625, n622, n619, 
        n617}), .current_value({\regs_matrix[11][16] , \regs_matrix[11][15] , 
        \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] , 
        \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] , 
        \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] , 
        \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] , 
        \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n670), 
        .write_enable(write_enables[12]), .new_value({n662, n659, n657, n654, 
        n651, n649, n646, n643, n640, n637, n634, n632, n629, n626, n623, n620, 
        w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n671), 
        .write_enable(write_enables[13]), .new_value({n661, n659, n656, n653, 
        n651, n648, n645, n642, n639, n636, n634, n631, n628, n625, n622, n619, 
        n617}), .current_value({\regs_matrix[13][16] , \regs_matrix[13][15] , 
        \regs_matrix[13][14] , \regs_matrix[13][13] , \regs_matrix[13][12] , 
        \regs_matrix[13][11] , \regs_matrix[13][10] , \regs_matrix[13][9] , 
        \regs_matrix[13][8] , \regs_matrix[13][7] , \regs_matrix[13][6] , 
        \regs_matrix[13][5] , \regs_matrix[13][4] , \regs_matrix[13][3] , 
        \regs_matrix[13][2] , \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n671), 
        .write_enable(write_enables[14]), .new_value({n662, n659, n657, n654, 
        n651, n649, n646, n643, n640, n637, n634, n632, n629, n626, n623, n620, 
        w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n672), 
        .write_enable(write_enables[15]), .new_value({n661, n659, n656, n653, 
        n651, n648, n645, n642, n639, n636, n634, n631, n628, n625, n622, n619, 
        n617}), .current_value({\regs_matrix[15][16] , \regs_matrix[15][15] , 
        \regs_matrix[15][14] , \regs_matrix[15][13] , \regs_matrix[15][12] , 
        \regs_matrix[15][11] , \regs_matrix[15][10] , \regs_matrix[15][9] , 
        \regs_matrix[15][8] , \regs_matrix[15][7] , \regs_matrix[15][6] , 
        \regs_matrix[15][5] , \regs_matrix[15][4] , \regs_matrix[15][3] , 
        \regs_matrix[15][2] , \regs_matrix[15][1] , \regs_matrix[15][0] }) );
  INVX4 U2 ( .A(n69), .Y(n314) );
  INVX4 U3 ( .A(n64), .Y(n305) );
  INVX4 U4 ( .A(n31), .Y(r1_data[8]) );
  BUFX4 U5 ( .A(N14), .Y(n1) );
  INVX4 U31 ( .A(n1), .Y(n579) );
  INVX8 U32 ( .A(n604), .Y(n606) );
  INVX8 U33 ( .A(n601), .Y(n603) );
  INVX4 U34 ( .A(w_data[12]), .Y(n650) );
  INVX4 U35 ( .A(w_data[8]), .Y(n638) );
  INVX4 U36 ( .A(w_data[10]), .Y(n644) );
  INVX4 U37 ( .A(w_data[15]), .Y(n658) );
  INVX4 U38 ( .A(w_data[14]), .Y(n655) );
  INVX4 U39 ( .A(w_data[11]), .Y(n647) );
  NAND3X1 U40 ( .A(n1), .B(n578), .C(n577), .Y(n2) );
  INVX2 U41 ( .A(n19), .Y(n21) );
  INVX2 U42 ( .A(n19), .Y(n20) );
  INVX2 U43 ( .A(n349), .Y(n601) );
  INVX2 U44 ( .A(n602), .Y(n19) );
  INVX2 U45 ( .A(n601), .Y(n602) );
  INVX2 U46 ( .A(n16), .Y(n17) );
  INVX2 U47 ( .A(N16), .Y(n578) );
  INVX4 U48 ( .A(n311), .Y(n312) );
  INVX2 U49 ( .A(n49), .Y(n598) );
  INVX4 U50 ( .A(n44), .Y(n321) );
  INVX4 U51 ( .A(n43), .Y(n320) );
  INVX2 U52 ( .A(N10), .Y(n3) );
  INVX2 U53 ( .A(n3), .Y(n4) );
  INVX2 U54 ( .A(N11), .Y(n14) );
  INVX2 U55 ( .A(n14), .Y(n15) );
  INVX8 U56 ( .A(n609), .Y(n16) );
  INVX8 U57 ( .A(n16), .Y(n18) );
  INVX4 U58 ( .A(n583), .Y(n585) );
  INVX2 U59 ( .A(N11), .Y(n289) );
  INVX2 U60 ( .A(N12), .Y(n22) );
  INVX2 U61 ( .A(n22), .Y(n23) );
  INVX2 U62 ( .A(n22), .Y(n24) );
  INVX1 U63 ( .A(n22), .Y(n25) );
  INVX2 U64 ( .A(n582), .Y(n584) );
  AND2X2 U65 ( .A(N15), .B(n1), .Y(n26) );
  INVX4 U66 ( .A(n301), .Y(n302) );
  INVX1 U67 ( .A(n590), .Y(n591) );
  INVX2 U68 ( .A(n41), .Y(n34) );
  INVX8 U69 ( .A(n604), .Y(n607) );
  INVX2 U70 ( .A(n295), .Y(n29) );
  INVX2 U71 ( .A(n295), .Y(n330) );
  AND2X2 U72 ( .A(n26), .B(n578), .Y(n27) );
  INVX2 U73 ( .A(N10), .Y(n291) );
  INVX4 U74 ( .A(n49), .Y(n599) );
  INVX4 U75 ( .A(n608), .Y(n609) );
  INVX8 U76 ( .A(n633), .Y(n634) );
  INVX4 U77 ( .A(n317), .Y(n319) );
  BUFX4 U78 ( .A(n298), .Y(n301) );
  INVX2 U79 ( .A(n23), .Y(n28) );
  INVX1 U80 ( .A(n24), .Y(n290) );
  INVX4 U81 ( .A(n295), .Y(n296) );
  BUFX4 U82 ( .A(n325), .Y(n295) );
  INVX1 U83 ( .A(n302), .Y(n30) );
  MUX2X1 U84 ( .B(n32), .A(n33), .S(n322), .Y(n31) );
  AND2X2 U85 ( .A(n179), .B(n180), .Y(n32) );
  AND2X2 U86 ( .A(n173), .B(n174), .Y(n33) );
  INVX4 U87 ( .A(n35), .Y(r1_data[4]) );
  INVX8 U88 ( .A(n314), .Y(n315) );
  INVX4 U89 ( .A(n27), .Y(n600) );
  INVX2 U90 ( .A(n594), .Y(n596) );
  INVX4 U91 ( .A(n38), .Y(r1_data[12]) );
  INVX4 U92 ( .A(N15), .Y(n577) );
  INVX8 U93 ( .A(n590), .Y(n593) );
  INVX4 U94 ( .A(n41), .Y(n42) );
  INVX8 U95 ( .A(n308), .Y(n309) );
  INVX8 U96 ( .A(n604), .Y(n605) );
  MUX2X1 U97 ( .B(n36), .A(n37), .S(n322), .Y(n35) );
  AND2X2 U98 ( .A(n125), .B(n126), .Y(n36) );
  AND2X2 U99 ( .A(n119), .B(n120), .Y(n37) );
  INVX8 U100 ( .A(n299), .Y(n304) );
  BUFX4 U101 ( .A(n298), .Y(n299) );
  MUX2X1 U102 ( .B(n39), .A(n40), .S(n322), .Y(n38) );
  AND2X2 U103 ( .A(n231), .B(n232), .Y(n39) );
  AND2X2 U104 ( .A(n225), .B(n226), .Y(n40) );
  INVX2 U105 ( .A(n597), .Y(n41) );
  INVX1 U106 ( .A(n594), .Y(n597) );
  AND2X2 U107 ( .A(n327), .B(n25), .Y(n43) );
  AND2X2 U108 ( .A(n24), .B(n327), .Y(n44) );
  INVX1 U109 ( .A(n330), .Y(n45) );
  INVX8 U110 ( .A(n587), .Y(n588) );
  INVX4 U111 ( .A(n305), .Y(n306) );
  BUFX4 U112 ( .A(n586), .Y(n587) );
  INVX8 U113 ( .A(n308), .Y(n310) );
  INVX8 U114 ( .A(n317), .Y(n318) );
  INVX2 U115 ( .A(N17), .Y(n612) );
  INVX2 U116 ( .A(n346), .Y(n594) );
  INVX2 U117 ( .A(w_data[16]), .Y(n660) );
  MUX2X1 U118 ( .B(n47), .A(n48), .S(n322), .Y(r1_data[10]) );
  NAND2X1 U119 ( .A(n205), .B(n206), .Y(n47) );
  NAND2X1 U120 ( .A(n199), .B(n200), .Y(n48) );
  INVX2 U121 ( .A(w_data[5]), .Y(n630) );
  INVX2 U122 ( .A(w_data[4]), .Y(n627) );
  INVX2 U123 ( .A(w_data[3]), .Y(n624) );
  INVX2 U124 ( .A(w_data[2]), .Y(n621) );
  INVX2 U125 ( .A(w_data[1]), .Y(n618) );
  INVX2 U126 ( .A(w_data[0]), .Y(n616) );
  INVX2 U127 ( .A(n586), .Y(n589) );
  INVX2 U128 ( .A(n612), .Y(n611) );
  BUFX2 U129 ( .A(n582), .Y(n583) );
  AND2X2 U130 ( .A(n26), .B(n578), .Y(n49) );
  INVX2 U131 ( .A(n594), .Y(n595) );
  INVX2 U132 ( .A(n344), .Y(n586) );
  INVX2 U133 ( .A(n324), .Y(n323) );
  INVX2 U134 ( .A(n324), .Y(n322) );
  INVX2 U135 ( .A(n660), .Y(n662) );
  INVX2 U136 ( .A(n660), .Y(n661) );
  INVX4 U137 ( .A(n644), .Y(n646) );
  INVX4 U138 ( .A(n638), .Y(n640) );
  INVX4 U139 ( .A(n655), .Y(n656) );
  INVX4 U140 ( .A(n655), .Y(n657) );
  INVX4 U141 ( .A(n644), .Y(n645) );
  INVX4 U142 ( .A(n638), .Y(n639) );
  INVX4 U143 ( .A(n647), .Y(n648) );
  INVX4 U144 ( .A(n647), .Y(n649) );
  INVX4 U145 ( .A(n652), .Y(n653) );
  INVX4 U146 ( .A(n652), .Y(n654) );
  INVX4 U147 ( .A(n635), .Y(n637) );
  INVX4 U148 ( .A(n641), .Y(n643) );
  INVX4 U149 ( .A(n635), .Y(n636) );
  INVX4 U150 ( .A(n641), .Y(n642) );
  INVX2 U151 ( .A(n630), .Y(n632) );
  INVX2 U152 ( .A(n630), .Y(n631) );
  INVX2 U153 ( .A(n627), .Y(n629) );
  INVX2 U154 ( .A(n627), .Y(n628) );
  INVX2 U155 ( .A(n624), .Y(n626) );
  INVX2 U156 ( .A(n621), .Y(n623) );
  INVX2 U157 ( .A(n624), .Y(n625) );
  INVX2 U158 ( .A(n621), .Y(n622) );
  INVX2 U159 ( .A(n618), .Y(n620) );
  INVX2 U160 ( .A(n618), .Y(n619) );
  INVX2 U161 ( .A(n616), .Y(n617) );
  INVX2 U162 ( .A(n664), .Y(outreg_data[16]) );
  INVX2 U163 ( .A(n677), .Y(n664) );
  BUFX2 U164 ( .A(n_reset), .Y(n665) );
  BUFX2 U165 ( .A(n_reset), .Y(n666) );
  BUFX2 U166 ( .A(n_reset), .Y(n667) );
  BUFX2 U167 ( .A(n_reset), .Y(n668) );
  BUFX2 U168 ( .A(n_reset), .Y(n669) );
  BUFX2 U169 ( .A(n_reset), .Y(n670) );
  BUFX2 U170 ( .A(n_reset), .Y(n671) );
  BUFX2 U171 ( .A(n_reset), .Y(n672) );
  AOI22X1 U172 ( .A(n53), .B(n52), .C(n51), .D(n50), .Y(n54) );
  INVX2 U173 ( .A(n54), .Y(r1_data[16]) );
  MUX2X1 U174 ( .B(n56), .A(n57), .S(n322), .Y(r1_data[0]) );
  NAND2X1 U175 ( .A(n58), .B(n59), .Y(n57) );
  NOR2X1 U176 ( .A(n60), .B(n61), .Y(n59) );
  OAI22X1 U177 ( .A(\regs_matrix[8][0] ), .B(n296), .C(\regs_matrix[10][0] ), 
        .D(n302), .Y(n61) );
  OAI22X1 U178 ( .A(\regs_matrix[12][0] ), .B(n306), .C(\regs_matrix[14][0] ), 
        .D(n310), .Y(n60) );
  NOR2X1 U179 ( .A(n66), .B(n67), .Y(n58) );
  OAI22X1 U180 ( .A(\regs_matrix[11][0] ), .B(n312), .C(\regs_matrix[9][0] ), 
        .D(n315), .Y(n67) );
  OAI22X1 U181 ( .A(\regs_matrix[13][0] ), .B(n318), .C(\regs_matrix[15][0] ), 
        .D(n321), .Y(n66) );
  NAND2X1 U182 ( .A(n72), .B(n71), .Y(n56) );
  NOR2X1 U183 ( .A(n74), .B(n73), .Y(n72) );
  OAI22X1 U184 ( .A(outreg_data[0]), .B(n330), .C(\regs_matrix[2][0] ), .D(
        n302), .Y(n74) );
  OAI22X1 U185 ( .A(\regs_matrix[4][0] ), .B(n306), .C(\regs_matrix[6][0] ), 
        .D(n310), .Y(n73) );
  NOR2X1 U186 ( .A(n75), .B(n76), .Y(n71) );
  OAI22X1 U187 ( .A(\regs_matrix[3][0] ), .B(n312), .C(\regs_matrix[1][0] ), 
        .D(n315), .Y(n76) );
  OAI22X1 U188 ( .A(\regs_matrix[5][0] ), .B(n318), .C(\regs_matrix[7][0] ), 
        .D(n321), .Y(n75) );
  MUX2X1 U189 ( .B(n77), .A(n78), .S(n323), .Y(r1_data[1]) );
  NAND2X1 U190 ( .A(n79), .B(n80), .Y(n78) );
  NOR2X1 U191 ( .A(n82), .B(n81), .Y(n80) );
  OAI22X1 U192 ( .A(\regs_matrix[8][1] ), .B(n296), .C(\regs_matrix[10][1] ), 
        .D(n302), .Y(n82) );
  OAI22X1 U193 ( .A(\regs_matrix[12][1] ), .B(n306), .C(\regs_matrix[14][1] ), 
        .D(n310), .Y(n81) );
  NOR2X1 U194 ( .A(n83), .B(n84), .Y(n79) );
  OAI22X1 U195 ( .A(\regs_matrix[11][1] ), .B(n312), .C(\regs_matrix[9][1] ), 
        .D(n315), .Y(n84) );
  OAI22X1 U196 ( .A(\regs_matrix[13][1] ), .B(n318), .C(\regs_matrix[15][1] ), 
        .D(n321), .Y(n83) );
  NAND2X1 U197 ( .A(n86), .B(n85), .Y(n77) );
  NOR2X1 U198 ( .A(n88), .B(n87), .Y(n86) );
  OAI22X1 U199 ( .A(n330), .B(outreg_data[1]), .C(\regs_matrix[2][1] ), .D(
        n326), .Y(n88) );
  OAI22X1 U200 ( .A(\regs_matrix[4][1] ), .B(n306), .C(\regs_matrix[6][1] ), 
        .D(n310), .Y(n87) );
  NOR2X1 U201 ( .A(n89), .B(n90), .Y(n85) );
  OAI22X1 U202 ( .A(\regs_matrix[3][1] ), .B(n312), .C(\regs_matrix[1][1] ), 
        .D(n315), .Y(n90) );
  OAI22X1 U203 ( .A(\regs_matrix[5][1] ), .B(n318), .C(\regs_matrix[7][1] ), 
        .D(n321), .Y(n89) );
  MUX2X1 U204 ( .B(n91), .A(n92), .S(n322), .Y(n55) );
  NAND2X1 U205 ( .A(n94), .B(n93), .Y(n92) );
  NOR2X1 U206 ( .A(n95), .B(n96), .Y(n94) );
  OAI22X1 U207 ( .A(\regs_matrix[8][2] ), .B(n330), .C(\regs_matrix[10][2] ), 
        .D(n303), .Y(n96) );
  OAI22X1 U208 ( .A(\regs_matrix[12][2] ), .B(n306), .C(\regs_matrix[14][2] ), 
        .D(n310), .Y(n95) );
  NOR2X1 U209 ( .A(n97), .B(n98), .Y(n93) );
  OAI22X1 U210 ( .A(\regs_matrix[11][2] ), .B(n312), .C(\regs_matrix[9][2] ), 
        .D(n315), .Y(n98) );
  OAI22X1 U211 ( .A(\regs_matrix[13][2] ), .B(n318), .C(\regs_matrix[15][2] ), 
        .D(n321), .Y(n97) );
  NAND2X1 U212 ( .A(n100), .B(n99), .Y(n91) );
  NOR2X1 U213 ( .A(n101), .B(n102), .Y(n100) );
  OAI22X1 U214 ( .A(outreg_data[2]), .B(n29), .C(\regs_matrix[2][2] ), .D(n326), .Y(n102) );
  OAI22X1 U215 ( .A(\regs_matrix[4][2] ), .B(n306), .C(\regs_matrix[6][2] ), 
        .D(n310), .Y(n101) );
  NOR2X1 U216 ( .A(n103), .B(n104), .Y(n99) );
  OAI22X1 U217 ( .A(\regs_matrix[3][2] ), .B(n312), .C(\regs_matrix[1][2] ), 
        .D(n315), .Y(n104) );
  OAI22X1 U218 ( .A(\regs_matrix[5][2] ), .B(n318), .C(\regs_matrix[7][2] ), 
        .D(n320), .Y(n103) );
  MUX2X1 U219 ( .B(n105), .A(n106), .S(n323), .Y(r1_data[3]) );
  NAND2X1 U220 ( .A(n108), .B(n107), .Y(n106) );
  NOR2X1 U221 ( .A(n110), .B(n109), .Y(n108) );
  OAI22X1 U222 ( .A(\regs_matrix[8][3] ), .B(n297), .C(\regs_matrix[10][3] ), 
        .D(n328), .Y(n110) );
  OAI22X1 U223 ( .A(\regs_matrix[12][3] ), .B(n306), .C(\regs_matrix[14][3] ), 
        .D(n310), .Y(n109) );
  NOR2X1 U224 ( .A(n111), .B(n112), .Y(n107) );
  OAI22X1 U225 ( .A(\regs_matrix[11][3] ), .B(n312), .C(\regs_matrix[9][3] ), 
        .D(n315), .Y(n112) );
  OAI22X1 U226 ( .A(\regs_matrix[13][3] ), .B(n318), .C(\regs_matrix[15][3] ), 
        .D(n321), .Y(n111) );
  NAND2X1 U227 ( .A(n113), .B(n114), .Y(n105) );
  NOR2X1 U228 ( .A(n115), .B(n116), .Y(n114) );
  OAI22X1 U229 ( .A(outreg_data[3]), .B(n296), .C(\regs_matrix[2][3] ), .D(
        n331), .Y(n116) );
  OAI22X1 U230 ( .A(\regs_matrix[4][3] ), .B(n306), .C(\regs_matrix[6][3] ), 
        .D(n310), .Y(n115) );
  NOR2X1 U231 ( .A(n117), .B(n118), .Y(n113) );
  OAI22X1 U232 ( .A(\regs_matrix[3][3] ), .B(n312), .C(\regs_matrix[1][3] ), 
        .D(n316), .Y(n118) );
  OAI22X1 U233 ( .A(\regs_matrix[5][3] ), .B(n318), .C(\regs_matrix[7][3] ), 
        .D(n320), .Y(n117) );
  NOR2X1 U234 ( .A(n121), .B(n122), .Y(n120) );
  OAI22X1 U235 ( .A(\regs_matrix[8][4] ), .B(n297), .C(\regs_matrix[10][4] ), 
        .D(n302), .Y(n122) );
  OAI22X1 U236 ( .A(\regs_matrix[12][4] ), .B(n306), .C(\regs_matrix[14][4] ), 
        .D(n310), .Y(n121) );
  NOR2X1 U237 ( .A(n123), .B(n124), .Y(n119) );
  OAI22X1 U238 ( .A(\regs_matrix[11][4] ), .B(n312), .C(\regs_matrix[9][4] ), 
        .D(n316), .Y(n124) );
  OAI22X1 U239 ( .A(\regs_matrix[13][4] ), .B(n318), .C(\regs_matrix[15][4] ), 
        .D(n321), .Y(n123) );
  NOR2X1 U240 ( .A(n127), .B(n128), .Y(n126) );
  OAI22X1 U241 ( .A(outreg_data[4]), .B(n297), .C(\regs_matrix[2][4] ), .D(
        n303), .Y(n128) );
  OAI22X1 U242 ( .A(\regs_matrix[4][4] ), .B(n307), .C(\regs_matrix[6][4] ), 
        .D(n310), .Y(n127) );
  NOR2X1 U243 ( .A(n129), .B(n130), .Y(n125) );
  OAI22X1 U244 ( .A(\regs_matrix[3][4] ), .B(n312), .C(\regs_matrix[1][4] ), 
        .D(n316), .Y(n130) );
  OAI22X1 U245 ( .A(\regs_matrix[5][4] ), .B(n319), .C(\regs_matrix[7][4] ), 
        .D(n320), .Y(n129) );
  MUX2X1 U246 ( .B(n131), .A(n132), .S(n323), .Y(r1_data[5]) );
  NAND2X1 U247 ( .A(n133), .B(n134), .Y(n132) );
  NOR2X1 U248 ( .A(n135), .B(n136), .Y(n134) );
  OAI22X1 U249 ( .A(\regs_matrix[8][5] ), .B(n297), .C(\regs_matrix[10][5] ), 
        .D(n303), .Y(n136) );
  OAI22X1 U250 ( .A(\regs_matrix[12][5] ), .B(n307), .C(\regs_matrix[14][5] ), 
        .D(n310), .Y(n135) );
  NOR2X1 U251 ( .A(n137), .B(n138), .Y(n133) );
  OAI22X1 U252 ( .A(\regs_matrix[11][5] ), .B(n313), .C(\regs_matrix[9][5] ), 
        .D(n316), .Y(n138) );
  OAI22X1 U253 ( .A(\regs_matrix[13][5] ), .B(n319), .C(\regs_matrix[15][5] ), 
        .D(n320), .Y(n137) );
  NAND2X1 U254 ( .A(n140), .B(n139), .Y(n131) );
  NOR2X1 U255 ( .A(n141), .B(n142), .Y(n140) );
  OAI22X1 U256 ( .A(outreg_data[5]), .B(n297), .C(\regs_matrix[2][5] ), .D(
        n303), .Y(n142) );
  OAI22X1 U257 ( .A(\regs_matrix[4][5] ), .B(n307), .C(\regs_matrix[6][5] ), 
        .D(n310), .Y(n141) );
  NOR2X1 U258 ( .A(n143), .B(n144), .Y(n139) );
  OAI22X1 U259 ( .A(\regs_matrix[3][5] ), .B(n313), .C(\regs_matrix[1][5] ), 
        .D(n316), .Y(n144) );
  OAI22X1 U260 ( .A(\regs_matrix[5][5] ), .B(n319), .C(\regs_matrix[7][5] ), 
        .D(n320), .Y(n143) );
  MUX2X1 U261 ( .B(n145), .A(n146), .S(n322), .Y(r1_data[6]) );
  NAND2X1 U262 ( .A(n147), .B(n148), .Y(n146) );
  NOR2X1 U263 ( .A(n149), .B(n150), .Y(n148) );
  OAI22X1 U264 ( .A(\regs_matrix[8][6] ), .B(n296), .C(\regs_matrix[10][6] ), 
        .D(n303), .Y(n150) );
  OAI22X1 U265 ( .A(\regs_matrix[12][6] ), .B(n307), .C(\regs_matrix[14][6] ), 
        .D(n309), .Y(n149) );
  NOR2X1 U266 ( .A(n151), .B(n152), .Y(n147) );
  OAI22X1 U267 ( .A(\regs_matrix[11][6] ), .B(n313), .C(\regs_matrix[9][6] ), 
        .D(n315), .Y(n152) );
  OAI22X1 U268 ( .A(\regs_matrix[13][6] ), .B(n319), .C(\regs_matrix[15][6] ), 
        .D(n321), .Y(n151) );
  NAND2X1 U269 ( .A(n153), .B(n154), .Y(n145) );
  NOR2X1 U270 ( .A(n155), .B(n156), .Y(n154) );
  OAI22X1 U271 ( .A(outreg_data[6]), .B(n297), .C(\regs_matrix[2][6] ), .D(
        n303), .Y(n156) );
  OAI22X1 U272 ( .A(\regs_matrix[4][6] ), .B(n307), .C(\regs_matrix[6][6] ), 
        .D(n309), .Y(n155) );
  NOR2X1 U273 ( .A(n157), .B(n158), .Y(n153) );
  OAI22X1 U274 ( .A(\regs_matrix[3][6] ), .B(n313), .C(\regs_matrix[1][6] ), 
        .D(n316), .Y(n158) );
  OAI22X1 U275 ( .A(\regs_matrix[5][6] ), .B(n319), .C(\regs_matrix[7][6] ), 
        .D(n320), .Y(n157) );
  MUX2X1 U276 ( .B(n159), .A(n160), .S(n323), .Y(r1_data[7]) );
  NAND2X1 U277 ( .A(n162), .B(n161), .Y(n160) );
  NOR2X1 U278 ( .A(n164), .B(n163), .Y(n162) );
  OAI22X1 U279 ( .A(\regs_matrix[8][7] ), .B(n297), .C(\regs_matrix[10][7] ), 
        .D(n303), .Y(n164) );
  OAI22X1 U280 ( .A(\regs_matrix[12][7] ), .B(n307), .C(\regs_matrix[14][7] ), 
        .D(n309), .Y(n163) );
  NOR2X1 U281 ( .A(n165), .B(n166), .Y(n161) );
  OAI22X1 U282 ( .A(\regs_matrix[11][7] ), .B(n313), .C(\regs_matrix[9][7] ), 
        .D(n315), .Y(n166) );
  OAI22X1 U283 ( .A(\regs_matrix[13][7] ), .B(n319), .C(\regs_matrix[15][7] ), 
        .D(n321), .Y(n165) );
  NAND2X1 U284 ( .A(n167), .B(n168), .Y(n159) );
  NOR2X1 U285 ( .A(n169), .B(n170), .Y(n168) );
  OAI22X1 U286 ( .A(outreg_data[7]), .B(n297), .C(\regs_matrix[2][7] ), .D(
        n303), .Y(n170) );
  OAI22X1 U287 ( .A(\regs_matrix[4][7] ), .B(n307), .C(\regs_matrix[6][7] ), 
        .D(n309), .Y(n169) );
  NOR2X1 U288 ( .A(n171), .B(n172), .Y(n167) );
  OAI22X1 U289 ( .A(\regs_matrix[3][7] ), .B(n313), .C(\regs_matrix[1][7] ), 
        .D(n316), .Y(n172) );
  OAI22X1 U290 ( .A(\regs_matrix[5][7] ), .B(n319), .C(\regs_matrix[7][7] ), 
        .D(n320), .Y(n171) );
  NOR2X1 U291 ( .A(n175), .B(n176), .Y(n174) );
  OAI22X1 U292 ( .A(\regs_matrix[8][8] ), .B(n297), .C(\regs_matrix[10][8] ), 
        .D(n303), .Y(n176) );
  OAI22X1 U293 ( .A(\regs_matrix[12][8] ), .B(n307), .C(\regs_matrix[14][8] ), 
        .D(n309), .Y(n175) );
  NOR2X1 U294 ( .A(n177), .B(n178), .Y(n173) );
  OAI22X1 U295 ( .A(\regs_matrix[11][8] ), .B(n312), .C(\regs_matrix[9][8] ), 
        .D(n315), .Y(n178) );
  OAI22X1 U296 ( .A(\regs_matrix[13][8] ), .B(n319), .C(\regs_matrix[15][8] ), 
        .D(n320), .Y(n177) );
  NOR2X1 U297 ( .A(n181), .B(n182), .Y(n180) );
  OAI22X1 U298 ( .A(outreg_data[8]), .B(n297), .C(\regs_matrix[2][8] ), .D(
        n303), .Y(n182) );
  OAI22X1 U299 ( .A(\regs_matrix[4][8] ), .B(n306), .C(\regs_matrix[6][8] ), 
        .D(n309), .Y(n181) );
  NOR2X1 U300 ( .A(n183), .B(n184), .Y(n179) );
  OAI22X1 U301 ( .A(\regs_matrix[3][8] ), .B(n312), .C(\regs_matrix[1][8] ), 
        .D(n315), .Y(n184) );
  OAI22X1 U302 ( .A(\regs_matrix[5][8] ), .B(n319), .C(\regs_matrix[7][8] ), 
        .D(n320), .Y(n183) );
  MUX2X1 U303 ( .B(n185), .A(n186), .S(n323), .Y(r1_data[9]) );
  NAND2X1 U304 ( .A(n187), .B(n188), .Y(n186) );
  NOR2X1 U305 ( .A(n190), .B(n189), .Y(n188) );
  OAI22X1 U306 ( .A(\regs_matrix[8][9] ), .B(n297), .C(\regs_matrix[10][9] ), 
        .D(n303), .Y(n190) );
  OAI22X1 U307 ( .A(\regs_matrix[12][9] ), .B(n307), .C(\regs_matrix[14][9] ), 
        .D(n309), .Y(n189) );
  NOR2X1 U308 ( .A(n191), .B(n192), .Y(n187) );
  OAI22X1 U309 ( .A(\regs_matrix[11][9] ), .B(n313), .C(\regs_matrix[9][9] ), 
        .D(n315), .Y(n192) );
  OAI22X1 U310 ( .A(\regs_matrix[13][9] ), .B(n319), .C(\regs_matrix[15][9] ), 
        .D(n320), .Y(n191) );
  NAND2X1 U311 ( .A(n194), .B(n193), .Y(n185) );
  NOR2X1 U312 ( .A(n195), .B(n196), .Y(n194) );
  OAI22X1 U313 ( .A(outreg_data[9]), .B(n297), .C(\regs_matrix[2][9] ), .D(
        n303), .Y(n196) );
  OAI22X1 U314 ( .A(\regs_matrix[4][9] ), .B(n307), .C(\regs_matrix[6][9] ), 
        .D(n309), .Y(n195) );
  NOR2X1 U315 ( .A(n197), .B(n198), .Y(n193) );
  OAI22X1 U316 ( .A(\regs_matrix[3][9] ), .B(n313), .C(\regs_matrix[1][9] ), 
        .D(n316), .Y(n198) );
  OAI22X1 U317 ( .A(\regs_matrix[5][9] ), .B(n319), .C(\regs_matrix[7][9] ), 
        .D(n320), .Y(n197) );
  NOR2X1 U318 ( .A(n201), .B(n202), .Y(n200) );
  OAI22X1 U319 ( .A(\regs_matrix[8][10] ), .B(n297), .C(\regs_matrix[10][10] ), 
        .D(n304), .Y(n202) );
  OAI22X1 U320 ( .A(\regs_matrix[12][10] ), .B(n306), .C(\regs_matrix[14][10] ), .D(n309), .Y(n201) );
  NOR2X1 U321 ( .A(n203), .B(n204), .Y(n199) );
  OAI22X1 U322 ( .A(\regs_matrix[11][10] ), .B(n313), .C(\regs_matrix[9][10] ), 
        .D(n315), .Y(n204) );
  OAI22X1 U323 ( .A(\regs_matrix[13][10] ), .B(n319), .C(\regs_matrix[15][10] ), .D(n321), .Y(n203) );
  NOR2X1 U324 ( .A(n207), .B(n208), .Y(n206) );
  OAI22X1 U325 ( .A(outreg_data[10]), .B(n296), .C(\regs_matrix[2][10] ), .D(
        n304), .Y(n208) );
  OAI22X1 U326 ( .A(\regs_matrix[4][10] ), .B(n307), .C(\regs_matrix[6][10] ), 
        .D(n309), .Y(n207) );
  NOR2X1 U327 ( .A(n209), .B(n210), .Y(n205) );
  OAI22X1 U328 ( .A(\regs_matrix[3][10] ), .B(n313), .C(\regs_matrix[1][10] ), 
        .D(n316), .Y(n210) );
  OAI22X1 U329 ( .A(\regs_matrix[5][10] ), .B(n318), .C(\regs_matrix[7][10] ), 
        .D(n321), .Y(n209) );
  MUX2X1 U330 ( .B(n211), .A(n212), .S(n323), .Y(r1_data[11]) );
  NAND2X1 U331 ( .A(n214), .B(n213), .Y(n212) );
  NOR2X1 U332 ( .A(n215), .B(n216), .Y(n214) );
  OAI22X1 U333 ( .A(\regs_matrix[8][11] ), .B(n297), .C(\regs_matrix[10][11] ), 
        .D(n304), .Y(n216) );
  OAI22X1 U334 ( .A(\regs_matrix[12][11] ), .B(n307), .C(\regs_matrix[14][11] ), .D(n309), .Y(n215) );
  NOR2X1 U335 ( .A(n217), .B(n218), .Y(n213) );
  OAI22X1 U336 ( .A(\regs_matrix[11][11] ), .B(n313), .C(\regs_matrix[9][11] ), 
        .D(n315), .Y(n218) );
  OAI22X1 U337 ( .A(\regs_matrix[13][11] ), .B(n318), .C(\regs_matrix[15][11] ), .D(n321), .Y(n217) );
  NAND2X1 U338 ( .A(n220), .B(n219), .Y(n211) );
  NOR2X1 U339 ( .A(n221), .B(n222), .Y(n220) );
  OAI22X1 U340 ( .A(outreg_data[11]), .B(n297), .C(\regs_matrix[2][11] ), .D(
        n304), .Y(n222) );
  OAI22X1 U341 ( .A(\regs_matrix[4][11] ), .B(n307), .C(\regs_matrix[6][11] ), 
        .D(n310), .Y(n221) );
  NOR2X1 U342 ( .A(n223), .B(n224), .Y(n219) );
  OAI22X1 U343 ( .A(\regs_matrix[3][11] ), .B(n313), .C(\regs_matrix[1][11] ), 
        .D(n315), .Y(n224) );
  OAI22X1 U344 ( .A(\regs_matrix[5][11] ), .B(n318), .C(\regs_matrix[7][11] ), 
        .D(n321), .Y(n223) );
  NOR2X1 U345 ( .A(n227), .B(n228), .Y(n226) );
  OAI22X1 U346 ( .A(\regs_matrix[8][12] ), .B(n297), .C(n304), .D(
        \regs_matrix[10][12] ), .Y(n228) );
  OAI22X1 U347 ( .A(\regs_matrix[12][12] ), .B(n307), .C(\regs_matrix[14][12] ), .D(n309), .Y(n227) );
  NOR2X1 U348 ( .A(n229), .B(n230), .Y(n225) );
  OAI22X1 U349 ( .A(\regs_matrix[11][12] ), .B(n313), .C(\regs_matrix[9][12] ), 
        .D(n316), .Y(n230) );
  OAI22X1 U350 ( .A(\regs_matrix[13][12] ), .B(n318), .C(\regs_matrix[15][12] ), .D(n321), .Y(n229) );
  NOR2X1 U351 ( .A(n233), .B(n234), .Y(n232) );
  OAI22X1 U352 ( .A(outreg_data[12]), .B(n296), .C(\regs_matrix[2][12] ), .D(
        n304), .Y(n234) );
  OAI22X1 U353 ( .A(\regs_matrix[4][12] ), .B(n307), .C(\regs_matrix[6][12] ), 
        .D(n310), .Y(n233) );
  NOR2X1 U354 ( .A(n235), .B(n236), .Y(n231) );
  OAI22X1 U355 ( .A(\regs_matrix[3][12] ), .B(n313), .C(\regs_matrix[1][12] ), 
        .D(n315), .Y(n236) );
  OAI22X1 U356 ( .A(\regs_matrix[5][12] ), .B(n318), .C(\regs_matrix[7][12] ), 
        .D(n320), .Y(n235) );
  MUX2X1 U357 ( .B(n237), .A(n238), .S(n323), .Y(r1_data[13]) );
  NAND2X1 U358 ( .A(n239), .B(n240), .Y(n238) );
  NOR2X1 U359 ( .A(n242), .B(n241), .Y(n240) );
  OAI22X1 U360 ( .A(\regs_matrix[8][13] ), .B(n297), .C(\regs_matrix[10][13] ), 
        .D(n304), .Y(n242) );
  OAI22X1 U361 ( .A(\regs_matrix[12][13] ), .B(n307), .C(\regs_matrix[14][13] ), .D(n309), .Y(n241) );
  NOR2X1 U362 ( .A(n243), .B(n244), .Y(n239) );
  OAI22X1 U363 ( .A(\regs_matrix[11][13] ), .B(n313), .C(\regs_matrix[9][13] ), 
        .D(n315), .Y(n244) );
  OAI22X1 U364 ( .A(\regs_matrix[13][13] ), .B(n318), .C(\regs_matrix[15][13] ), .D(n321), .Y(n243) );
  NAND2X1 U365 ( .A(n245), .B(n246), .Y(n237) );
  NOR2X1 U366 ( .A(n247), .B(n248), .Y(n246) );
  OAI22X1 U367 ( .A(outreg_data[13]), .B(n29), .C(\regs_matrix[2][13] ), .D(
        n304), .Y(n248) );
  OAI22X1 U368 ( .A(\regs_matrix[4][13] ), .B(n307), .C(\regs_matrix[6][13] ), 
        .D(n310), .Y(n247) );
  NOR2X1 U369 ( .A(n249), .B(n250), .Y(n245) );
  OAI22X1 U370 ( .A(\regs_matrix[3][13] ), .B(n313), .C(\regs_matrix[1][13] ), 
        .D(n315), .Y(n250) );
  OAI22X1 U371 ( .A(\regs_matrix[5][13] ), .B(n318), .C(\regs_matrix[7][13] ), 
        .D(n320), .Y(n249) );
  MUX2X1 U372 ( .B(n251), .A(n252), .S(n322), .Y(r1_data[14]) );
  NAND2X1 U373 ( .A(n254), .B(n253), .Y(n252) );
  NOR2X1 U374 ( .A(n255), .B(n256), .Y(n254) );
  OAI22X1 U375 ( .A(\regs_matrix[8][14] ), .B(n29), .C(\regs_matrix[10][14] ), 
        .D(n304), .Y(n256) );
  OAI22X1 U376 ( .A(\regs_matrix[12][14] ), .B(n307), .C(\regs_matrix[14][14] ), .D(n309), .Y(n255) );
  NOR2X1 U377 ( .A(n257), .B(n258), .Y(n253) );
  OAI22X1 U378 ( .A(\regs_matrix[11][14] ), .B(n313), .C(\regs_matrix[9][14] ), 
        .D(n315), .Y(n258) );
  OAI22X1 U379 ( .A(\regs_matrix[13][14] ), .B(n318), .C(\regs_matrix[15][14] ), .D(n320), .Y(n257) );
  NAND2X1 U380 ( .A(n260), .B(n259), .Y(n251) );
  NOR2X1 U381 ( .A(n262), .B(n261), .Y(n260) );
  OAI22X1 U382 ( .A(outreg_data[14]), .B(n29), .C(\regs_matrix[2][14] ), .D(
        n304), .Y(n262) );
  OAI22X1 U383 ( .A(\regs_matrix[4][14] ), .B(n307), .C(\regs_matrix[6][14] ), 
        .D(n310), .Y(n261) );
  NOR2X1 U384 ( .A(n263), .B(n264), .Y(n259) );
  OAI22X1 U385 ( .A(\regs_matrix[3][14] ), .B(n313), .C(\regs_matrix[1][14] ), 
        .D(n315), .Y(n264) );
  OAI22X1 U386 ( .A(\regs_matrix[5][14] ), .B(n318), .C(\regs_matrix[7][14] ), 
        .D(n320), .Y(n263) );
  MUX2X1 U387 ( .B(n265), .A(n266), .S(n323), .Y(r1_data[15]) );
  NAND2X1 U388 ( .A(n267), .B(n268), .Y(n266) );
  NOR2X1 U389 ( .A(n269), .B(n270), .Y(n268) );
  OAI22X1 U390 ( .A(\regs_matrix[8][15] ), .B(n296), .C(\regs_matrix[10][15] ), 
        .D(n304), .Y(n270) );
  OAI22X1 U391 ( .A(\regs_matrix[12][15] ), .B(n307), .C(\regs_matrix[14][15] ), .D(n309), .Y(n269) );
  NOR2X1 U392 ( .A(n271), .B(n272), .Y(n267) );
  OAI22X1 U393 ( .A(\regs_matrix[11][15] ), .B(n313), .C(\regs_matrix[9][15] ), 
        .D(n315), .Y(n272) );
  OAI22X1 U394 ( .A(\regs_matrix[13][15] ), .B(n318), .C(\regs_matrix[15][15] ), .D(n321), .Y(n271) );
  NAND2X1 U395 ( .A(n274), .B(n273), .Y(n265) );
  NOR2X1 U396 ( .A(n275), .B(n276), .Y(n274) );
  OAI22X1 U397 ( .A(outreg_data[15]), .B(n297), .C(\regs_matrix[2][15] ), .D(
        n304), .Y(n276) );
  OAI22X1 U398 ( .A(\regs_matrix[4][15] ), .B(n307), .C(\regs_matrix[6][15] ), 
        .D(n310), .Y(n275) );
  NOR2X1 U399 ( .A(n277), .B(n278), .Y(n273) );
  OAI22X1 U400 ( .A(\regs_matrix[3][15] ), .B(n313), .C(\regs_matrix[1][15] ), 
        .D(n316), .Y(n278) );
  OAI22X1 U401 ( .A(\regs_matrix[5][15] ), .B(n318), .C(\regs_matrix[7][15] ), 
        .D(n320), .Y(n277) );
  NOR2X1 U402 ( .A(n279), .B(n280), .Y(n50) );
  OAI21X1 U403 ( .A(\regs_matrix[6][16] ), .B(n329), .C(n281), .Y(n280) );
  AOI22X1 U404 ( .A(n301), .B(n282), .C(n45), .D(n664), .Y(n281) );
  INVX2 U405 ( .A(\regs_matrix[2][16] ), .Y(n282) );
  OAI21X1 U406 ( .A(\regs_matrix[4][16] ), .B(n307), .C(n324), .Y(n279) );
  NOR2X1 U407 ( .A(n283), .B(n284), .Y(n51) );
  OAI22X1 U408 ( .A(\regs_matrix[3][16] ), .B(n313), .C(\regs_matrix[1][16] ), 
        .D(n315), .Y(n284) );
  OAI22X1 U409 ( .A(\regs_matrix[5][16] ), .B(n318), .C(\regs_matrix[7][16] ), 
        .D(n321), .Y(n283) );
  NOR2X1 U410 ( .A(n285), .B(n286), .Y(n52) );
  OAI21X1 U411 ( .A(\regs_matrix[12][16] ), .B(n307), .C(n287), .Y(n286) );
  AOI22X1 U412 ( .A(n30), .B(n288), .C(n45), .D(n576), .Y(n287) );
  NAND3X1 U413 ( .A(n28), .B(n289), .C(n291), .Y(n62) );
  INVX2 U414 ( .A(\regs_matrix[10][16] ), .Y(n288) );
  NAND3X1 U415 ( .A(n15), .B(n290), .C(n291), .Y(n63) );
  NAND3X1 U416 ( .A(n24), .B(n289), .C(n291), .Y(n64) );
  OAI22X1 U417 ( .A(\regs_matrix[9][16] ), .B(n316), .C(\regs_matrix[14][16] ), 
        .D(n329), .Y(n285) );
  NAND3X1 U418 ( .A(n25), .B(n15), .C(n291), .Y(n65) );
  NAND3X1 U419 ( .A(n4), .B(n28), .C(n289), .Y(n69) );
  NOR2X1 U420 ( .A(n292), .B(n293), .Y(n53) );
  OAI21X1 U421 ( .A(\regs_matrix[11][16] ), .B(n313), .C(n322), .Y(n293) );
  NAND2X1 U422 ( .A(n327), .B(n28), .Y(n68) );
  OAI22X1 U423 ( .A(\regs_matrix[15][16] ), .B(n320), .C(\regs_matrix[13][16] ), .D(n318), .Y(n292) );
  NAND3X1 U424 ( .A(n25), .B(n4), .C(n289), .Y(n70) );
  BUFX4 U425 ( .A(n325), .Y(n294) );
  INVX8 U426 ( .A(n294), .Y(n297) );
  BUFX4 U427 ( .A(n298), .Y(n300) );
  INVX8 U428 ( .A(n300), .Y(n303) );
  INVX8 U429 ( .A(n305), .Y(n307) );
  INVX8 U430 ( .A(n311), .Y(n313) );
  INVX2 U431 ( .A(n63), .Y(n298) );
  INVX1 U432 ( .A(N13), .Y(n324) );
  INVX4 U433 ( .A(n68), .Y(n311) );
  INVX4 U434 ( .A(n65), .Y(n308) );
  INVX2 U435 ( .A(n301), .Y(n326) );
  INVX1 U436 ( .A(n301), .Y(n328) );
  INVX4 U437 ( .A(n314), .Y(n316) );
  BUFX2 U438 ( .A(n310), .Y(n329) );
  INVX4 U439 ( .A(n70), .Y(n317) );
  INVX1 U440 ( .A(n301), .Y(n331) );
  AND2X2 U441 ( .A(N10), .B(N11), .Y(n327) );
  BUFX4 U442 ( .A(n55), .Y(r1_data[2]) );
  INVX2 U443 ( .A(n62), .Y(n325) );
  AOI22X1 U444 ( .A(n335), .B(n334), .C(n333), .D(n332), .Y(n336) );
  INVX2 U445 ( .A(n336), .Y(r2_data[16]) );
  MUX2X1 U446 ( .B(n337), .A(n338), .S(n611), .Y(r2_data[0]) );
  NAND2X1 U447 ( .A(n339), .B(n340), .Y(n338) );
  NOR2X1 U448 ( .A(n341), .B(n342), .Y(n340) );
  OAI22X1 U449 ( .A(\regs_matrix[8][0] ), .B(n615), .C(\regs_matrix[10][0] ), 
        .D(n588), .Y(n342) );
  OAI22X1 U450 ( .A(\regs_matrix[12][0] ), .B(n591), .C(\regs_matrix[14][0] ), 
        .D(n596), .Y(n341) );
  NOR2X1 U451 ( .A(n347), .B(n348), .Y(n339) );
  OAI22X1 U452 ( .A(\regs_matrix[11][0] ), .B(n598), .C(\regs_matrix[9][0] ), 
        .D(n2), .Y(n348) );
  OAI22X1 U453 ( .A(\regs_matrix[13][0] ), .B(n605), .C(\regs_matrix[15][0] ), 
        .D(n610), .Y(n347) );
  NAND2X1 U454 ( .A(n352), .B(n353), .Y(n337) );
  NOR2X1 U455 ( .A(n354), .B(n355), .Y(n353) );
  OAI22X1 U456 ( .A(outreg_data[0]), .B(n614), .C(\regs_matrix[2][0] ), .D(
        n588), .Y(n355) );
  OAI22X1 U457 ( .A(\regs_matrix[4][0] ), .B(n591), .C(\regs_matrix[6][0] ), 
        .D(n42), .Y(n354) );
  NOR2X1 U458 ( .A(n356), .B(n357), .Y(n352) );
  OAI22X1 U459 ( .A(\regs_matrix[3][0] ), .B(n598), .C(\regs_matrix[1][0] ), 
        .D(n2), .Y(n357) );
  OAI22X1 U460 ( .A(\regs_matrix[5][0] ), .B(n605), .C(\regs_matrix[7][0] ), 
        .D(n610), .Y(n356) );
  MUX2X1 U461 ( .B(n358), .A(n359), .S(N17), .Y(r2_data[1]) );
  NAND2X1 U462 ( .A(n360), .B(n361), .Y(n359) );
  NOR2X1 U463 ( .A(n362), .B(n363), .Y(n361) );
  OAI22X1 U464 ( .A(\regs_matrix[8][1] ), .B(n614), .C(\regs_matrix[10][1] ), 
        .D(n588), .Y(n363) );
  OAI22X1 U465 ( .A(\regs_matrix[12][1] ), .B(n593), .C(\regs_matrix[14][1] ), 
        .D(n42), .Y(n362) );
  NOR2X1 U466 ( .A(n364), .B(n365), .Y(n360) );
  OAI22X1 U467 ( .A(\regs_matrix[11][1] ), .B(n598), .C(\regs_matrix[9][1] ), 
        .D(n603), .Y(n365) );
  OAI22X1 U468 ( .A(\regs_matrix[13][1] ), .B(n605), .C(\regs_matrix[15][1] ), 
        .D(n610), .Y(n364) );
  NAND2X1 U469 ( .A(n366), .B(n367), .Y(n358) );
  NOR2X1 U470 ( .A(n368), .B(n369), .Y(n367) );
  OAI22X1 U471 ( .A(outreg_data[1]), .B(n615), .C(\regs_matrix[2][1] ), .D(
        n588), .Y(n369) );
  OAI22X1 U472 ( .A(\regs_matrix[4][1] ), .B(n593), .C(\regs_matrix[6][1] ), 
        .D(n42), .Y(n368) );
  NOR2X1 U473 ( .A(n370), .B(n371), .Y(n366) );
  OAI22X1 U474 ( .A(\regs_matrix[3][1] ), .B(n598), .C(\regs_matrix[1][1] ), 
        .D(n603), .Y(n371) );
  OAI22X1 U475 ( .A(\regs_matrix[5][1] ), .B(n605), .C(\regs_matrix[7][1] ), 
        .D(n610), .Y(n370) );
  MUX2X1 U476 ( .B(n372), .A(n373), .S(n611), .Y(r2_data[2]) );
  NAND2X1 U477 ( .A(n374), .B(n375), .Y(n373) );
  NOR2X1 U478 ( .A(n376), .B(n377), .Y(n375) );
  OAI22X1 U479 ( .A(\regs_matrix[8][2] ), .B(n614), .C(\regs_matrix[10][2] ), 
        .D(n588), .Y(n377) );
  OAI22X1 U480 ( .A(\regs_matrix[12][2] ), .B(n592), .C(\regs_matrix[14][2] ), 
        .D(n42), .Y(n376) );
  NOR2X1 U481 ( .A(n378), .B(n379), .Y(n374) );
  OAI22X1 U482 ( .A(\regs_matrix[11][2] ), .B(n598), .C(\regs_matrix[9][2] ), 
        .D(n602), .Y(n379) );
  OAI22X1 U483 ( .A(\regs_matrix[13][2] ), .B(n605), .C(\regs_matrix[15][2] ), 
        .D(n610), .Y(n378) );
  NAND2X1 U484 ( .A(n380), .B(n381), .Y(n372) );
  NOR2X1 U485 ( .A(n382), .B(n383), .Y(n381) );
  OAI22X1 U486 ( .A(outreg_data[2]), .B(n615), .C(\regs_matrix[2][2] ), .D(
        n588), .Y(n383) );
  OAI22X1 U487 ( .A(\regs_matrix[4][2] ), .B(n593), .C(\regs_matrix[6][2] ), 
        .D(n42), .Y(n382) );
  NOR2X1 U488 ( .A(n384), .B(n385), .Y(n380) );
  OAI22X1 U489 ( .A(\regs_matrix[3][2] ), .B(n598), .C(\regs_matrix[1][2] ), 
        .D(n603), .Y(n385) );
  OAI22X1 U490 ( .A(\regs_matrix[5][2] ), .B(n605), .C(\regs_matrix[7][2] ), 
        .D(n610), .Y(n384) );
  MUX2X1 U491 ( .B(n386), .A(n387), .S(n611), .Y(r2_data[3]) );
  NAND2X1 U492 ( .A(n388), .B(n389), .Y(n387) );
  NOR2X1 U493 ( .A(n390), .B(n391), .Y(n389) );
  OAI22X1 U494 ( .A(\regs_matrix[8][3] ), .B(n614), .C(\regs_matrix[10][3] ), 
        .D(n588), .Y(n391) );
  OAI22X1 U495 ( .A(\regs_matrix[12][3] ), .B(n593), .C(\regs_matrix[14][3] ), 
        .D(n42), .Y(n390) );
  NOR2X1 U496 ( .A(n392), .B(n393), .Y(n388) );
  OAI22X1 U497 ( .A(\regs_matrix[11][3] ), .B(n599), .C(\regs_matrix[9][3] ), 
        .D(n602), .Y(n393) );
  OAI22X1 U498 ( .A(\regs_matrix[13][3] ), .B(n605), .C(\regs_matrix[15][3] ), 
        .D(n610), .Y(n392) );
  NAND2X1 U499 ( .A(n394), .B(n395), .Y(n386) );
  NOR2X1 U500 ( .A(n396), .B(n397), .Y(n395) );
  OAI22X1 U501 ( .A(outreg_data[3]), .B(n615), .C(\regs_matrix[2][3] ), .D(
        n588), .Y(n397) );
  OAI22X1 U502 ( .A(\regs_matrix[4][3] ), .B(n592), .C(\regs_matrix[6][3] ), 
        .D(n42), .Y(n396) );
  NOR2X1 U503 ( .A(n398), .B(n399), .Y(n394) );
  OAI22X1 U504 ( .A(\regs_matrix[3][3] ), .B(n598), .C(\regs_matrix[1][3] ), 
        .D(n2), .Y(n399) );
  OAI22X1 U505 ( .A(\regs_matrix[5][3] ), .B(n605), .C(\regs_matrix[7][3] ), 
        .D(n610), .Y(n398) );
  MUX2X1 U506 ( .B(n400), .A(n401), .S(n611), .Y(r2_data[4]) );
  NAND2X1 U507 ( .A(n402), .B(n403), .Y(n401) );
  NOR2X1 U508 ( .A(n404), .B(n405), .Y(n403) );
  OAI22X1 U509 ( .A(\regs_matrix[8][4] ), .B(n615), .C(\regs_matrix[10][4] ), 
        .D(n589), .Y(n405) );
  OAI22X1 U510 ( .A(\regs_matrix[12][4] ), .B(n593), .C(\regs_matrix[14][4] ), 
        .D(n34), .Y(n404) );
  NOR2X1 U511 ( .A(n406), .B(n407), .Y(n402) );
  OAI22X1 U512 ( .A(\regs_matrix[11][4] ), .B(n599), .C(\regs_matrix[9][4] ), 
        .D(n603), .Y(n407) );
  OAI22X1 U513 ( .A(\regs_matrix[13][4] ), .B(n606), .C(\regs_matrix[15][4] ), 
        .D(n610), .Y(n406) );
  NAND2X1 U514 ( .A(n408), .B(n409), .Y(n400) );
  NOR2X1 U515 ( .A(n410), .B(n411), .Y(n409) );
  OAI22X1 U516 ( .A(outreg_data[4]), .B(n584), .C(\regs_matrix[2][4] ), .D(
        n589), .Y(n411) );
  OAI22X1 U517 ( .A(\regs_matrix[4][4] ), .B(n592), .C(\regs_matrix[6][4] ), 
        .D(n34), .Y(n410) );
  NOR2X1 U518 ( .A(n412), .B(n413), .Y(n408) );
  OAI22X1 U519 ( .A(\regs_matrix[3][4] ), .B(n599), .C(\regs_matrix[1][4] ), 
        .D(n603), .Y(n413) );
  OAI22X1 U520 ( .A(\regs_matrix[5][4] ), .B(n606), .C(\regs_matrix[7][4] ), 
        .D(n610), .Y(n412) );
  MUX2X1 U521 ( .B(n414), .A(n415), .S(N17), .Y(r2_data[5]) );
  NAND2X1 U522 ( .A(n416), .B(n417), .Y(n415) );
  NOR2X1 U523 ( .A(n418), .B(n419), .Y(n417) );
  OAI22X1 U524 ( .A(\regs_matrix[8][5] ), .B(n584), .C(\regs_matrix[10][5] ), 
        .D(n589), .Y(n419) );
  OAI22X1 U525 ( .A(\regs_matrix[12][5] ), .B(n593), .C(\regs_matrix[14][5] ), 
        .D(n34), .Y(n418) );
  NOR2X1 U526 ( .A(n420), .B(n421), .Y(n416) );
  OAI22X1 U527 ( .A(\regs_matrix[11][5] ), .B(n599), .C(\regs_matrix[9][5] ), 
        .D(n603), .Y(n421) );
  OAI22X1 U528 ( .A(\regs_matrix[13][5] ), .B(n606), .C(\regs_matrix[15][5] ), 
        .D(n610), .Y(n420) );
  NAND2X1 U529 ( .A(n422), .B(n423), .Y(n414) );
  NOR2X1 U530 ( .A(n424), .B(n425), .Y(n423) );
  OAI22X1 U531 ( .A(outreg_data[5]), .B(n584), .C(\regs_matrix[2][5] ), .D(
        n589), .Y(n425) );
  OAI22X1 U532 ( .A(\regs_matrix[4][5] ), .B(n592), .C(\regs_matrix[6][5] ), 
        .D(n34), .Y(n424) );
  NOR2X1 U533 ( .A(n426), .B(n427), .Y(n422) );
  OAI22X1 U534 ( .A(\regs_matrix[3][5] ), .B(n599), .C(\regs_matrix[1][5] ), 
        .D(n603), .Y(n427) );
  OAI22X1 U535 ( .A(\regs_matrix[5][5] ), .B(n606), .C(\regs_matrix[7][5] ), 
        .D(n610), .Y(n426) );
  MUX2X1 U536 ( .B(n428), .A(n429), .S(n611), .Y(r2_data[6]) );
  NAND2X1 U537 ( .A(n430), .B(n431), .Y(n429) );
  NOR2X1 U538 ( .A(n432), .B(n433), .Y(n431) );
  OAI22X1 U539 ( .A(\regs_matrix[8][6] ), .B(n584), .C(\regs_matrix[10][6] ), 
        .D(n589), .Y(n433) );
  OAI22X1 U540 ( .A(\regs_matrix[12][6] ), .B(n593), .C(\regs_matrix[14][6] ), 
        .D(n596), .Y(n432) );
  NOR2X1 U541 ( .A(n434), .B(n435), .Y(n430) );
  OAI22X1 U542 ( .A(\regs_matrix[11][6] ), .B(n599), .C(\regs_matrix[9][6] ), 
        .D(n603), .Y(n435) );
  OAI22X1 U543 ( .A(\regs_matrix[13][6] ), .B(n606), .C(\regs_matrix[15][6] ), 
        .D(n18), .Y(n434) );
  NAND2X1 U544 ( .A(n436), .B(n437), .Y(n428) );
  NOR2X1 U545 ( .A(n438), .B(n439), .Y(n437) );
  OAI22X1 U546 ( .A(outreg_data[6]), .B(n585), .C(\regs_matrix[2][6] ), .D(
        n589), .Y(n439) );
  OAI22X1 U547 ( .A(\regs_matrix[4][6] ), .B(n593), .C(\regs_matrix[6][6] ), 
        .D(n34), .Y(n438) );
  NOR2X1 U548 ( .A(n440), .B(n441), .Y(n436) );
  OAI22X1 U549 ( .A(\regs_matrix[3][6] ), .B(n599), .C(\regs_matrix[1][6] ), 
        .D(n602), .Y(n441) );
  OAI22X1 U550 ( .A(\regs_matrix[5][6] ), .B(n606), .C(\regs_matrix[7][6] ), 
        .D(n18), .Y(n440) );
  MUX2X1 U551 ( .B(n442), .A(n443), .S(N17), .Y(r2_data[7]) );
  NAND2X1 U552 ( .A(n444), .B(n445), .Y(n443) );
  NOR2X1 U553 ( .A(n446), .B(n447), .Y(n445) );
  OAI22X1 U554 ( .A(\regs_matrix[8][7] ), .B(n615), .C(\regs_matrix[10][7] ), 
        .D(n589), .Y(n447) );
  OAI22X1 U555 ( .A(\regs_matrix[12][7] ), .B(n593), .C(\regs_matrix[14][7] ), 
        .D(n596), .Y(n446) );
  NOR2X1 U556 ( .A(n448), .B(n449), .Y(n444) );
  OAI22X1 U557 ( .A(\regs_matrix[11][7] ), .B(n599), .C(\regs_matrix[9][7] ), 
        .D(n603), .Y(n449) );
  OAI22X1 U558 ( .A(\regs_matrix[13][7] ), .B(n606), .C(\regs_matrix[15][7] ), 
        .D(n18), .Y(n448) );
  NAND2X1 U559 ( .A(n450), .B(n451), .Y(n442) );
  NOR2X1 U560 ( .A(n452), .B(n453), .Y(n451) );
  OAI22X1 U561 ( .A(outreg_data[7]), .B(n585), .C(\regs_matrix[2][7] ), .D(
        n589), .Y(n453) );
  OAI22X1 U562 ( .A(\regs_matrix[4][7] ), .B(n593), .C(\regs_matrix[6][7] ), 
        .D(n596), .Y(n452) );
  NOR2X1 U563 ( .A(n454), .B(n455), .Y(n450) );
  OAI22X1 U564 ( .A(\regs_matrix[3][7] ), .B(n599), .C(\regs_matrix[1][7] ), 
        .D(n602), .Y(n455) );
  OAI22X1 U565 ( .A(\regs_matrix[5][7] ), .B(n606), .C(\regs_matrix[7][7] ), 
        .D(n18), .Y(n454) );
  MUX2X1 U566 ( .B(n456), .A(n457), .S(n611), .Y(r2_data[8]) );
  NAND2X1 U567 ( .A(n458), .B(n459), .Y(n457) );
  NOR2X1 U568 ( .A(n460), .B(n461), .Y(n459) );
  OAI22X1 U569 ( .A(\regs_matrix[8][8] ), .B(n584), .C(\regs_matrix[10][8] ), 
        .D(n589), .Y(n461) );
  OAI22X1 U570 ( .A(\regs_matrix[12][8] ), .B(n592), .C(\regs_matrix[14][8] ), 
        .D(n596), .Y(n460) );
  NOR2X1 U571 ( .A(n462), .B(n463), .Y(n458) );
  OAI22X1 U572 ( .A(\regs_matrix[11][8] ), .B(n599), .C(\regs_matrix[9][8] ), 
        .D(n603), .Y(n463) );
  OAI22X1 U573 ( .A(\regs_matrix[13][8] ), .B(n606), .C(\regs_matrix[15][8] ), 
        .D(n17), .Y(n462) );
  NAND2X1 U574 ( .A(n464), .B(n465), .Y(n456) );
  NOR2X1 U575 ( .A(n466), .B(n467), .Y(n465) );
  OAI22X1 U576 ( .A(outreg_data[8]), .B(n585), .C(\regs_matrix[2][8] ), .D(
        n589), .Y(n467) );
  OAI22X1 U577 ( .A(\regs_matrix[4][8] ), .B(n593), .C(\regs_matrix[6][8] ), 
        .D(n596), .Y(n466) );
  NOR2X1 U578 ( .A(n468), .B(n469), .Y(n464) );
  OAI22X1 U579 ( .A(\regs_matrix[3][8] ), .B(n599), .C(\regs_matrix[1][8] ), 
        .D(n603), .Y(n469) );
  OAI22X1 U580 ( .A(\regs_matrix[5][8] ), .B(n606), .C(\regs_matrix[7][8] ), 
        .D(n17), .Y(n468) );
  MUX2X1 U581 ( .B(n470), .A(n471), .S(N17), .Y(r2_data[9]) );
  NAND2X1 U582 ( .A(n472), .B(n473), .Y(n471) );
  NOR2X1 U583 ( .A(n474), .B(n475), .Y(n473) );
  OAI22X1 U584 ( .A(\regs_matrix[8][9] ), .B(n584), .C(\regs_matrix[10][9] ), 
        .D(n589), .Y(n475) );
  OAI22X1 U585 ( .A(\regs_matrix[12][9] ), .B(n593), .C(\regs_matrix[14][9] ), 
        .D(n596), .Y(n474) );
  NOR2X1 U586 ( .A(n476), .B(n477), .Y(n472) );
  OAI22X1 U587 ( .A(\regs_matrix[11][9] ), .B(n599), .C(\regs_matrix[9][9] ), 
        .D(n603), .Y(n477) );
  OAI22X1 U588 ( .A(\regs_matrix[13][9] ), .B(n606), .C(\regs_matrix[15][9] ), 
        .D(n17), .Y(n476) );
  NAND2X1 U589 ( .A(n478), .B(n479), .Y(n470) );
  NOR2X1 U590 ( .A(n480), .B(n481), .Y(n479) );
  OAI22X1 U591 ( .A(outreg_data[9]), .B(n614), .C(\regs_matrix[2][9] ), .D(
        n589), .Y(n481) );
  OAI22X1 U592 ( .A(\regs_matrix[4][9] ), .B(n593), .C(\regs_matrix[6][9] ), 
        .D(n596), .Y(n480) );
  NOR2X1 U593 ( .A(n482), .B(n483), .Y(n478) );
  OAI22X1 U594 ( .A(\regs_matrix[3][9] ), .B(n599), .C(\regs_matrix[1][9] ), 
        .D(n603), .Y(n483) );
  OAI22X1 U595 ( .A(\regs_matrix[5][9] ), .B(n606), .C(\regs_matrix[7][9] ), 
        .D(n17), .Y(n482) );
  MUX2X1 U596 ( .B(n484), .A(n485), .S(n611), .Y(r2_data[10]) );
  NAND2X1 U597 ( .A(n486), .B(n487), .Y(n485) );
  NOR2X1 U598 ( .A(n488), .B(n489), .Y(n487) );
  OAI22X1 U599 ( .A(\regs_matrix[8][10] ), .B(n585), .C(\regs_matrix[10][10] ), 
        .D(n588), .Y(n489) );
  OAI22X1 U600 ( .A(\regs_matrix[12][10] ), .B(n593), .C(\regs_matrix[14][10] ), .D(n596), .Y(n488) );
  NOR2X1 U601 ( .A(n490), .B(n491), .Y(n486) );
  OAI22X1 U602 ( .A(\regs_matrix[11][10] ), .B(n599), .C(\regs_matrix[9][10] ), 
        .D(n603), .Y(n491) );
  OAI22X1 U603 ( .A(\regs_matrix[13][10] ), .B(n606), .C(\regs_matrix[15][10] ), .D(n18), .Y(n490) );
  NAND2X1 U604 ( .A(n492), .B(n493), .Y(n484) );
  NOR2X1 U605 ( .A(n494), .B(n495), .Y(n493) );
  OAI22X1 U606 ( .A(outreg_data[10]), .B(n585), .C(\regs_matrix[2][10] ), .D(
        n588), .Y(n495) );
  OAI22X1 U607 ( .A(\regs_matrix[4][10] ), .B(n592), .C(\regs_matrix[6][10] ), 
        .D(n596), .Y(n494) );
  NOR2X1 U608 ( .A(n496), .B(n497), .Y(n492) );
  OAI22X1 U609 ( .A(\regs_matrix[3][10] ), .B(n600), .C(\regs_matrix[1][10] ), 
        .D(n603), .Y(n497) );
  OAI22X1 U610 ( .A(\regs_matrix[5][10] ), .B(n607), .C(\regs_matrix[7][10] ), 
        .D(n18), .Y(n496) );
  MUX2X1 U611 ( .B(n498), .A(n499), .S(N17), .Y(r2_data[11]) );
  NAND2X1 U612 ( .A(n500), .B(n501), .Y(n499) );
  NOR2X1 U613 ( .A(n502), .B(n503), .Y(n501) );
  OAI22X1 U614 ( .A(\regs_matrix[8][11] ), .B(n584), .C(\regs_matrix[10][11] ), 
        .D(n588), .Y(n503) );
  OAI22X1 U615 ( .A(\regs_matrix[12][11] ), .B(n593), .C(\regs_matrix[14][11] ), .D(n34), .Y(n502) );
  NOR2X1 U616 ( .A(n504), .B(n505), .Y(n500) );
  OAI22X1 U617 ( .A(\regs_matrix[11][11] ), .B(n600), .C(\regs_matrix[9][11] ), 
        .D(n603), .Y(n505) );
  OAI22X1 U618 ( .A(\regs_matrix[13][11] ), .B(n607), .C(\regs_matrix[15][11] ), .D(n18), .Y(n504) );
  NAND2X1 U619 ( .A(n506), .B(n507), .Y(n498) );
  NOR2X1 U620 ( .A(n508), .B(n509), .Y(n507) );
  OAI22X1 U621 ( .A(outreg_data[11]), .B(n584), .C(\regs_matrix[2][11] ), .D(
        n588), .Y(n509) );
  OAI22X1 U622 ( .A(\regs_matrix[4][11] ), .B(n593), .C(\regs_matrix[6][11] ), 
        .D(n595), .Y(n508) );
  NOR2X1 U623 ( .A(n510), .B(n511), .Y(n506) );
  OAI22X1 U624 ( .A(\regs_matrix[3][11] ), .B(n600), .C(\regs_matrix[1][11] ), 
        .D(n603), .Y(n511) );
  OAI22X1 U625 ( .A(\regs_matrix[5][11] ), .B(n607), .C(\regs_matrix[7][11] ), 
        .D(n18), .Y(n510) );
  MUX2X1 U626 ( .B(n512), .A(n513), .S(n611), .Y(r2_data[12]) );
  NAND2X1 U627 ( .A(n514), .B(n515), .Y(n513) );
  NOR2X1 U628 ( .A(n516), .B(n517), .Y(n515) );
  OAI22X1 U629 ( .A(\regs_matrix[8][12] ), .B(n584), .C(\regs_matrix[10][12] ), 
        .D(n588), .Y(n517) );
  OAI22X1 U630 ( .A(\regs_matrix[12][12] ), .B(n593), .C(\regs_matrix[14][12] ), .D(n595), .Y(n516) );
  NOR2X1 U631 ( .A(n518), .B(n519), .Y(n514) );
  OAI22X1 U632 ( .A(\regs_matrix[11][12] ), .B(n600), .C(\regs_matrix[9][12] ), 
        .D(n2), .Y(n519) );
  OAI22X1 U633 ( .A(\regs_matrix[13][12] ), .B(n607), .C(\regs_matrix[15][12] ), .D(n610), .Y(n518) );
  NAND2X1 U634 ( .A(n520), .B(n521), .Y(n512) );
  NOR2X1 U635 ( .A(n522), .B(n523), .Y(n521) );
  OAI22X1 U636 ( .A(outreg_data[12]), .B(n585), .C(\regs_matrix[2][12] ), .D(
        n588), .Y(n523) );
  OAI22X1 U637 ( .A(\regs_matrix[4][12] ), .B(n593), .C(\regs_matrix[6][12] ), 
        .D(n595), .Y(n522) );
  NOR2X1 U638 ( .A(n524), .B(n525), .Y(n520) );
  OAI22X1 U639 ( .A(\regs_matrix[3][12] ), .B(n600), .C(\regs_matrix[1][12] ), 
        .D(n603), .Y(n525) );
  OAI22X1 U640 ( .A(\regs_matrix[5][12] ), .B(n607), .C(\regs_matrix[7][12] ), 
        .D(n18), .Y(n524) );
  MUX2X1 U641 ( .B(n526), .A(n527), .S(N17), .Y(r2_data[13]) );
  NAND2X1 U642 ( .A(n528), .B(n529), .Y(n527) );
  NOR2X1 U643 ( .A(n530), .B(n531), .Y(n529) );
  OAI22X1 U644 ( .A(\regs_matrix[8][13] ), .B(n585), .C(\regs_matrix[10][13] ), 
        .D(n588), .Y(n531) );
  OAI22X1 U645 ( .A(\regs_matrix[12][13] ), .B(n593), .C(\regs_matrix[14][13] ), .D(n595), .Y(n530) );
  NOR2X1 U646 ( .A(n532), .B(n533), .Y(n528) );
  OAI22X1 U647 ( .A(\regs_matrix[11][13] ), .B(n600), .C(\regs_matrix[9][13] ), 
        .D(n603), .Y(n533) );
  OAI22X1 U648 ( .A(\regs_matrix[13][13] ), .B(n607), .C(\regs_matrix[15][13] ), .D(n610), .Y(n532) );
  NAND2X1 U649 ( .A(n534), .B(n535), .Y(n526) );
  NOR2X1 U650 ( .A(n537), .B(n536), .Y(n535) );
  OAI22X1 U651 ( .A(outreg_data[13]), .B(n585), .C(\regs_matrix[2][13] ), .D(
        n588), .Y(n537) );
  OAI22X1 U652 ( .A(\regs_matrix[4][13] ), .B(n593), .C(\regs_matrix[6][13] ), 
        .D(n595), .Y(n536) );
  NOR2X1 U653 ( .A(n538), .B(n539), .Y(n534) );
  OAI22X1 U654 ( .A(\regs_matrix[3][13] ), .B(n600), .C(\regs_matrix[1][13] ), 
        .D(n2), .Y(n539) );
  OAI22X1 U655 ( .A(\regs_matrix[5][13] ), .B(n607), .C(\regs_matrix[7][13] ), 
        .D(n610), .Y(n538) );
  MUX2X1 U656 ( .B(n540), .A(n541), .S(n611), .Y(r2_data[14]) );
  NAND2X1 U657 ( .A(n542), .B(n543), .Y(n541) );
  NOR2X1 U658 ( .A(n544), .B(n545), .Y(n543) );
  OAI22X1 U659 ( .A(\regs_matrix[8][14] ), .B(n614), .C(\regs_matrix[10][14] ), 
        .D(n588), .Y(n545) );
  OAI22X1 U660 ( .A(\regs_matrix[12][14] ), .B(n593), .C(\regs_matrix[14][14] ), .D(n595), .Y(n544) );
  NOR2X1 U661 ( .A(n546), .B(n547), .Y(n542) );
  OAI22X1 U662 ( .A(\regs_matrix[11][14] ), .B(n600), .C(\regs_matrix[9][14] ), 
        .D(n2), .Y(n547) );
  OAI22X1 U663 ( .A(\regs_matrix[13][14] ), .B(n607), .C(\regs_matrix[15][14] ), .D(n610), .Y(n546) );
  NAND2X1 U664 ( .A(n548), .B(n549), .Y(n540) );
  NOR2X1 U665 ( .A(n550), .B(n551), .Y(n549) );
  OAI22X1 U666 ( .A(outreg_data[14]), .B(n615), .C(\regs_matrix[2][14] ), .D(
        n588), .Y(n551) );
  OAI22X1 U667 ( .A(\regs_matrix[4][14] ), .B(n593), .C(\regs_matrix[6][14] ), 
        .D(n595), .Y(n550) );
  NOR2X1 U668 ( .A(n552), .B(n553), .Y(n548) );
  OAI22X1 U669 ( .A(\regs_matrix[3][14] ), .B(n600), .C(\regs_matrix[1][14] ), 
        .D(n2), .Y(n553) );
  OAI22X1 U670 ( .A(\regs_matrix[5][14] ), .B(n607), .C(\regs_matrix[7][14] ), 
        .D(n610), .Y(n552) );
  MUX2X1 U671 ( .B(n554), .A(n555), .S(N17), .Y(r2_data[15]) );
  NAND2X1 U672 ( .A(n556), .B(n557), .Y(n555) );
  NOR2X1 U673 ( .A(n558), .B(n559), .Y(n557) );
  OAI22X1 U674 ( .A(\regs_matrix[8][15] ), .B(n614), .C(\regs_matrix[10][15] ), 
        .D(n588), .Y(n559) );
  OAI22X1 U675 ( .A(\regs_matrix[12][15] ), .B(n593), .C(\regs_matrix[14][15] ), .D(n595), .Y(n558) );
  NOR2X1 U676 ( .A(n560), .B(n561), .Y(n556) );
  OAI22X1 U677 ( .A(\regs_matrix[11][15] ), .B(n600), .C(\regs_matrix[9][15] ), 
        .D(n603), .Y(n561) );
  OAI22X1 U678 ( .A(\regs_matrix[13][15] ), .B(n607), .C(\regs_matrix[15][15] ), .D(n18), .Y(n560) );
  NAND2X1 U679 ( .A(n562), .B(n563), .Y(n554) );
  NOR2X1 U680 ( .A(n564), .B(n565), .Y(n563) );
  OAI22X1 U681 ( .A(outreg_data[15]), .B(n615), .C(\regs_matrix[2][15] ), .D(
        n588), .Y(n565) );
  OAI22X1 U682 ( .A(\regs_matrix[4][15] ), .B(n593), .C(\regs_matrix[6][15] ), 
        .D(n595), .Y(n564) );
  NOR2X1 U683 ( .A(n566), .B(n567), .Y(n562) );
  OAI22X1 U684 ( .A(\regs_matrix[3][15] ), .B(n600), .C(\regs_matrix[1][15] ), 
        .D(n603), .Y(n567) );
  OAI22X1 U685 ( .A(\regs_matrix[5][15] ), .B(n607), .C(\regs_matrix[7][15] ), 
        .D(n18), .Y(n566) );
  NOR2X1 U686 ( .A(n568), .B(n569), .Y(n332) );
  OAI21X1 U687 ( .A(\regs_matrix[6][16] ), .B(n595), .C(n570), .Y(n569) );
  AOI22X1 U688 ( .A(n587), .B(n282), .C(n613), .D(n664), .Y(n570) );
  OAI21X1 U689 ( .A(\regs_matrix[4][16] ), .B(n593), .C(n612), .Y(n568) );
  NOR2X1 U690 ( .A(n571), .B(n572), .Y(n333) );
  OAI22X1 U691 ( .A(\regs_matrix[3][16] ), .B(n600), .C(\regs_matrix[1][16] ), 
        .D(n20), .Y(n572) );
  OAI22X1 U692 ( .A(\regs_matrix[5][16] ), .B(n607), .C(\regs_matrix[7][16] ), 
        .D(n18), .Y(n571) );
  NOR2X1 U693 ( .A(n573), .B(n574), .Y(n334) );
  OAI21X1 U694 ( .A(\regs_matrix[12][16] ), .B(n593), .C(n575), .Y(n574) );
  AOI22X1 U695 ( .A(n587), .B(n288), .C(n613), .D(n576), .Y(n575) );
  INVX2 U696 ( .A(\regs_matrix[8][16] ), .Y(n576) );
  NAND3X1 U697 ( .A(n577), .B(n578), .C(n579), .Y(n343) );
  NAND3X1 U698 ( .A(n578), .B(N15), .C(n579), .Y(n344) );
  NAND3X1 U699 ( .A(N16), .B(n577), .C(n579), .Y(n345) );
  OAI22X1 U700 ( .A(\regs_matrix[9][16] ), .B(n21), .C(\regs_matrix[14][16] ), 
        .D(n34), .Y(n573) );
  NAND3X1 U701 ( .A(N16), .B(N15), .C(n579), .Y(n346) );
  NAND3X1 U702 ( .A(n1), .B(n578), .C(n577), .Y(n349) );
  NOR2X1 U703 ( .A(n580), .B(n581), .Y(n335) );
  OAI21X1 U704 ( .A(\regs_matrix[11][16] ), .B(n600), .C(n611), .Y(n581) );
  OAI22X1 U705 ( .A(\regs_matrix[15][16] ), .B(n610), .C(\regs_matrix[13][16] ), .D(n607), .Y(n580) );
  NAND3X1 U706 ( .A(N16), .B(n1), .C(n577), .Y(n350) );
  NAND2X1 U707 ( .A(N16), .B(n26), .Y(n351) );
  INVX4 U708 ( .A(n351), .Y(n608) );
  INVX8 U709 ( .A(n608), .Y(n610) );
  INVX2 U710 ( .A(n343), .Y(n582) );
  INVX1 U711 ( .A(n584), .Y(n613) );
  NAND3X1 U712 ( .A(n577), .B(n578), .C(n579), .Y(n614) );
  NAND3X1 U713 ( .A(n577), .B(n578), .C(n579), .Y(n615) );
  INVX4 U714 ( .A(n350), .Y(n604) );
  INVX4 U715 ( .A(n345), .Y(n590) );
  INVX2 U716 ( .A(n590), .Y(n592) );
  INVX4 U717 ( .A(w_data[9]), .Y(n641) );
  INVX4 U718 ( .A(w_data[7]), .Y(n635) );
  INVX4 U719 ( .A(w_data[6]), .Y(n633) );
  INVX4 U720 ( .A(w_data[13]), .Y(n652) );
  INVX8 U721 ( .A(n650), .Y(n651) );
  INVX8 U722 ( .A(n658), .Y(n659) );
  INVX2 U723 ( .A(w_en), .Y(n673) );
  INVX2 U724 ( .A(w_sel[1]), .Y(n674) );
  INVX2 U725 ( .A(w_sel[2]), .Y(n675) );
  INVX2 U726 ( .A(w_sel[3]), .Y(n676) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data({src1_data[16:11], n1, src1_data[9:0]}), .src2_data(
        src2_data), .alu_op(alu_op), .result(alu_result), .overflow(overflow)
         );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  BUFX4 U2 ( .A(src1_data[10]), .Y(n1) );
  INVX2 U3 ( .A(w_data_sel[1]), .Y(n37) );
  AND2X2 U4 ( .A(w_data_sel[0]), .B(n37), .Y(n2) );
  AND2X2 U5 ( .A(n37), .B(n4), .Y(n3) );
  AND2X2 U6 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U7 ( .A(alu_result[15]), .Y(n6) );
  INVX2 U8 ( .A(w_data_sel[0]), .Y(n4) );
  AOI22X1 U9 ( .A(ext_data2[15]), .B(n2), .C(ext_data1[15]), .D(n3), .Y(n5) );
  OAI21X1 U10 ( .A(n37), .B(n6), .C(n5), .Y(dest_data[15]) );
  INVX2 U11 ( .A(alu_result[14]), .Y(n8) );
  AOI22X1 U12 ( .A(ext_data2[14]), .B(n2), .C(ext_data1[14]), .D(n3), .Y(n7)
         );
  OAI21X1 U13 ( .A(n37), .B(n8), .C(n7), .Y(dest_data[14]) );
  INVX2 U14 ( .A(alu_result[13]), .Y(n10) );
  AOI22X1 U15 ( .A(ext_data2[13]), .B(n2), .C(ext_data1[13]), .D(n3), .Y(n9)
         );
  OAI21X1 U16 ( .A(n37), .B(n10), .C(n9), .Y(dest_data[13]) );
  INVX2 U17 ( .A(alu_result[12]), .Y(n12) );
  AOI22X1 U18 ( .A(ext_data2[12]), .B(n2), .C(ext_data1[12]), .D(n3), .Y(n11)
         );
  OAI21X1 U19 ( .A(n37), .B(n12), .C(n11), .Y(dest_data[12]) );
  INVX2 U20 ( .A(alu_result[11]), .Y(n14) );
  AOI22X1 U21 ( .A(ext_data2[11]), .B(n2), .C(ext_data1[11]), .D(n3), .Y(n13)
         );
  OAI21X1 U22 ( .A(n37), .B(n14), .C(n13), .Y(dest_data[11]) );
  INVX2 U23 ( .A(alu_result[10]), .Y(n16) );
  AOI22X1 U24 ( .A(ext_data2[10]), .B(n2), .C(ext_data1[10]), .D(n3), .Y(n15)
         );
  OAI21X1 U25 ( .A(n37), .B(n16), .C(n15), .Y(dest_data[10]) );
  INVX2 U26 ( .A(alu_result[9]), .Y(n18) );
  AOI22X1 U27 ( .A(ext_data2[9]), .B(n2), .C(ext_data1[9]), .D(n3), .Y(n17) );
  OAI21X1 U28 ( .A(n37), .B(n18), .C(n17), .Y(dest_data[9]) );
  INVX2 U29 ( .A(alu_result[8]), .Y(n20) );
  AOI22X1 U30 ( .A(ext_data2[8]), .B(n2), .C(ext_data1[8]), .D(n3), .Y(n19) );
  OAI21X1 U31 ( .A(n37), .B(n20), .C(n19), .Y(dest_data[8]) );
  INVX2 U32 ( .A(alu_result[7]), .Y(n22) );
  AOI22X1 U33 ( .A(ext_data2[7]), .B(n2), .C(ext_data1[7]), .D(n3), .Y(n21) );
  OAI21X1 U34 ( .A(n37), .B(n22), .C(n21), .Y(dest_data[7]) );
  INVX2 U35 ( .A(alu_result[6]), .Y(n24) );
  AOI22X1 U36 ( .A(ext_data2[6]), .B(n2), .C(ext_data1[6]), .D(n3), .Y(n23) );
  OAI21X1 U37 ( .A(n37), .B(n24), .C(n23), .Y(dest_data[6]) );
  INVX2 U38 ( .A(alu_result[5]), .Y(n26) );
  AOI22X1 U39 ( .A(ext_data2[5]), .B(n2), .C(ext_data1[5]), .D(n3), .Y(n25) );
  OAI21X1 U40 ( .A(n37), .B(n26), .C(n25), .Y(dest_data[5]) );
  INVX2 U41 ( .A(alu_result[4]), .Y(n28) );
  AOI22X1 U42 ( .A(ext_data2[4]), .B(n2), .C(ext_data1[4]), .D(n3), .Y(n27) );
  OAI21X1 U43 ( .A(n37), .B(n28), .C(n27), .Y(dest_data[4]) );
  INVX2 U44 ( .A(alu_result[3]), .Y(n30) );
  AOI22X1 U45 ( .A(ext_data2[3]), .B(n2), .C(ext_data1[3]), .D(n3), .Y(n29) );
  OAI21X1 U46 ( .A(n37), .B(n30), .C(n29), .Y(dest_data[3]) );
  INVX2 U47 ( .A(alu_result[2]), .Y(n32) );
  AOI22X1 U48 ( .A(ext_data2[2]), .B(n2), .C(ext_data1[2]), .D(n3), .Y(n31) );
  OAI21X1 U49 ( .A(n37), .B(n32), .C(n31), .Y(dest_data[2]) );
  INVX2 U50 ( .A(alu_result[1]), .Y(n34) );
  AOI22X1 U51 ( .A(ext_data2[1]), .B(n2), .C(ext_data1[1]), .D(n3), .Y(n33) );
  OAI21X1 U52 ( .A(n37), .B(n34), .C(n33), .Y(dest_data[1]) );
  INVX2 U53 ( .A(alu_result[0]), .Y(n36) );
  AOI22X1 U54 ( .A(ext_data2[0]), .B(n2), .C(ext_data1[0]), .D(n3), .Y(n35) );
  OAI21X1 U55 ( .A(n37), .B(n36), .C(n35), .Y(dest_data[0]) );
endmodule


module fir_filter ( clk, n_reset, data_ready, load_coeff, sample_data, 
        fir_coefficient, one_k_samples, modwait, err, fir_out );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, data_ready, load_coeff;
  output one_k_samples, modwait, err;
  wire   dr, lc, overflow, cnt_up, clear;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] outreg;

  controller controller1 ( .clk(clk), .n_reset(n_reset), .dr(dr), .lc(lc), 
        .overflow(overflow), .cnt_up(cnt_up), .clear(clear), .err(err), 
        .modwait(modwait), .op(op), .src1(src1), .src2(src2), .dest(dest) );
  counter counter1 ( .clk(clk), .n_reset(n_reset), .cnt_up(cnt_up), .clear(
        clear), .one_k_samples(one_k_samples) );
  sync_low_1 sync1 ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), 
        .sync_out(dr) );
  sync_low_0 sync2 ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), 
        .sync_out(lc) );
  magnitude magnitude1 ( .in(outreg), .out(fir_out) );
  datapath datapath1 ( .clk(clk), .n_reset(n_reset), .op(op), .src1(src1), 
        .src2(src2), .dest(dest), .ext_data1(sample_data), .ext_data2(
        fir_coefficient), .outreg_data(outreg), .overflow(overflow) );
endmodule

