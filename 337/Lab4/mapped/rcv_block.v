/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb  8 13:00:29 2018
/////////////////////////////////////////////////////////////


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected;
  wire   old_sample, new_sample, sync_phase, n4;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 main_statement ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module rcu ( clk, n_rst, start_bit_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, start_bit_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;
  wire   [2:0] state;
  wire   [2:0] next_state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  NAND3X1 U6 ( .A(n4), .B(n5), .C(n6), .Y(next_state[2]) );
  NAND3X1 U7 ( .A(n7), .B(n8), .C(n5), .Y(next_state[1]) );
  NAND3X1 U8 ( .A(n9), .B(n4), .C(n10), .Y(next_state[0]) );
  AOI22X1 U9 ( .A(n11), .B(state[0]), .C(packet_done), .D(enable_timer), .Y(
        n10) );
  INVX1 U10 ( .A(n5), .Y(n11) );
  NAND3X1 U11 ( .A(n6), .B(n12), .C(state[1]), .Y(n5) );
  NAND3X1 U12 ( .A(n13), .B(n14), .C(n15), .Y(n4) );
  NOR2X1 U13 ( .A(framing_error), .B(n16), .Y(n15) );
  NAND3X1 U14 ( .A(n17), .B(n14), .C(start_bit_detected), .Y(n9) );
  NOR2X1 U15 ( .A(n16), .B(n18), .Y(load_buffer) );
  NAND2X1 U16 ( .A(state[0]), .B(n14), .Y(n18) );
  INVX1 U17 ( .A(n6), .Y(sbc_enable) );
  NAND3X1 U18 ( .A(state[0]), .B(n16), .C(state[1]), .Y(n6) );
  INVX1 U19 ( .A(n8), .Y(sbc_clear) );
  NAND3X1 U20 ( .A(n14), .B(n16), .C(state[0]), .Y(n8) );
  INVX1 U21 ( .A(state[1]), .Y(n14) );
  INVX1 U22 ( .A(n7), .Y(enable_timer) );
  NAND2X1 U23 ( .A(n17), .B(state[1]), .Y(n7) );
  INVX1 U24 ( .A(n12), .Y(n17) );
  NAND2X1 U25 ( .A(n13), .B(n16), .Y(n12) );
  INVX1 U26 ( .A(state[2]), .Y(n16) );
  INVX1 U27 ( .A(state[0]), .Y(n13) );
endmodule


module flex_counter_1 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n43, n27, n28, n29, n30, n31, n2, n3, n4, n5, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42;

  DFFSR \count_out_reg[0]  ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n29), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n28), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n27), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n43)
         );
  INVX2 U6 ( .A(n22), .Y(rollover_flag) );
  OAI22X1 U7 ( .A(n2), .B(n3), .C(n4), .D(n5), .Y(n31) );
  OAI22X1 U10 ( .A(n3), .B(n11), .C(n12), .D(n5), .Y(n30) );
  XNOR2X1 U11 ( .A(n4), .B(n13), .Y(n12) );
  NOR2X1 U12 ( .A(n43), .B(n11), .Y(n13) );
  INVX1 U13 ( .A(count_out[1]), .Y(n11) );
  OAI22X1 U14 ( .A(n3), .B(n14), .C(n15), .D(n5), .Y(n29) );
  XNOR2X1 U15 ( .A(n16), .B(n17), .Y(n15) );
  OAI22X1 U16 ( .A(n3), .B(n18), .C(n19), .D(n5), .Y(n28) );
  XOR2X1 U17 ( .A(n20), .B(n21), .Y(n19) );
  NOR2X1 U18 ( .A(n43), .B(n18), .Y(n21) );
  NAND2X1 U19 ( .A(n16), .B(n17), .Y(n20) );
  AND2X1 U20 ( .A(n4), .B(count_out[1]), .Y(n17) );
  NOR2X1 U21 ( .A(n2), .B(n43), .Y(n4) );
  INVX1 U22 ( .A(count_out[0]), .Y(n2) );
  NOR2X1 U23 ( .A(n14), .B(n43), .Y(n16) );
  OAI21X1 U24 ( .A(n3), .B(n22), .C(n23), .Y(n27) );
  NAND3X1 U25 ( .A(n24), .B(n25), .C(n26), .Y(n23) );
  NOR2X1 U26 ( .A(n5), .B(n32), .Y(n26) );
  OAI21X1 U27 ( .A(n18), .B(n33), .C(n34), .Y(n32) );
  XOR2X1 U28 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n34) );
  INVX1 U29 ( .A(count_out[3]), .Y(n18) );
  MUX2X1 U30 ( .B(n35), .A(n36), .S(rollover_val[1]), .Y(n25) );
  OAI21X1 U31 ( .A(count_out[1]), .B(count_out[0]), .C(n37), .Y(n36) );
  XOR2X1 U32 ( .A(count_out[1]), .B(count_out[0]), .Y(n35) );
  NOR2X1 U33 ( .A(n38), .B(n39), .Y(n24) );
  XNOR2X1 U34 ( .A(n33), .B(n40), .Y(n39) );
  XOR2X1 U35 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n40) );
  OR2X1 U36 ( .A(n37), .B(n14), .Y(n33) );
  XOR2X1 U37 ( .A(n37), .B(n41), .Y(n38) );
  XOR2X1 U38 ( .A(n14), .B(rollover_val[2]), .Y(n41) );
  INVX1 U39 ( .A(count_out[2]), .Y(n14) );
  NAND2X1 U40 ( .A(count_out[1]), .B(count_out[0]), .Y(n37) );
  INVX1 U41 ( .A(n43), .Y(n22) );
  NAND2X1 U42 ( .A(n5), .B(n42), .Y(n3) );
  NAND2X1 U43 ( .A(count_enable), .B(n42), .Y(n5) );
  INVX1 U44 ( .A(clear), .Y(n42) );
endmodule


module flex_counter_0 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n1, n2, n3, n4, n5, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46;

  DFFSR \count_out_reg[0]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(n46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI22X1 U6 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(n42) );
  OAI22X1 U7 ( .A(n2), .B(n5), .C(n11), .D(n4), .Y(n43) );
  XNOR2X1 U10 ( .A(n3), .B(n12), .Y(n11) );
  NOR2X1 U11 ( .A(rollover_flag), .B(n5), .Y(n12) );
  INVX1 U12 ( .A(count_out[1]), .Y(n5) );
  OAI22X1 U13 ( .A(n2), .B(n13), .C(n14), .D(n4), .Y(n44) );
  XNOR2X1 U14 ( .A(n15), .B(n16), .Y(n14) );
  OAI22X1 U15 ( .A(n2), .B(n17), .C(n18), .D(n4), .Y(n45) );
  XOR2X1 U16 ( .A(n19), .B(n20), .Y(n18) );
  NOR2X1 U17 ( .A(rollover_flag), .B(n17), .Y(n20) );
  NAND2X1 U18 ( .A(n15), .B(n16), .Y(n19) );
  AND2X1 U19 ( .A(n3), .B(count_out[1]), .Y(n16) );
  NOR2X1 U20 ( .A(n1), .B(rollover_flag), .Y(n3) );
  INVX1 U21 ( .A(count_out[0]), .Y(n1) );
  NOR2X1 U22 ( .A(n13), .B(rollover_flag), .Y(n15) );
  OAI21X1 U23 ( .A(n2), .B(n21), .C(n22), .Y(n46) );
  NAND3X1 U24 ( .A(n23), .B(n24), .C(n25), .Y(n22) );
  NOR2X1 U25 ( .A(n4), .B(n26), .Y(n25) );
  OAI21X1 U26 ( .A(n17), .B(n32), .C(n33), .Y(n26) );
  XOR2X1 U27 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n33) );
  INVX1 U28 ( .A(count_out[3]), .Y(n17) );
  MUX2X1 U29 ( .B(n34), .A(n35), .S(rollover_val[1]), .Y(n24) );
  OAI21X1 U30 ( .A(count_out[1]), .B(count_out[0]), .C(n36), .Y(n35) );
  XOR2X1 U31 ( .A(count_out[1]), .B(count_out[0]), .Y(n34) );
  NOR2X1 U32 ( .A(n37), .B(n38), .Y(n23) );
  XNOR2X1 U33 ( .A(n32), .B(n39), .Y(n38) );
  XOR2X1 U34 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n39) );
  OR2X1 U35 ( .A(n36), .B(n13), .Y(n32) );
  XOR2X1 U36 ( .A(n36), .B(n40), .Y(n37) );
  XOR2X1 U37 ( .A(n13), .B(rollover_val[2]), .Y(n40) );
  INVX1 U38 ( .A(count_out[2]), .Y(n13) );
  NAND2X1 U39 ( .A(count_out[1]), .B(count_out[0]), .Y(n36) );
  INVX1 U40 ( .A(rollover_flag), .Y(n21) );
  NAND2X1 U41 ( .A(n4), .B(n41), .Y(n2) );
  NAND2X1 U42 ( .A(count_enable), .B(n41), .Y(n4) );
  INVX1 U43 ( .A(clear), .Y(n41) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_strobe, packet_done );
  input clk, n_rst, enable_timer;
  output shift_strobe, packet_done;
  wire   n1;

  flex_counter_1 clk_cnt ( .clk(clk), .n_rst(n_rst), .clear(n1), 
        .count_enable(enable_timer), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), 
        .rollover_flag(shift_strobe) );
  flex_counter_0 bit_cnt ( .clk(clk), .n_rst(n_rst), .clear(n1), 
        .count_enable(shift_strobe), .rollover_val({1'b1, 1'b0, 1'b0, 1'b1}), 
        .rollover_flag(packet_done) );
  INVX1 U3 ( .A(enable_timer), .Y(n1) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   sbc_clear, sbc_enable, stop_bit, start_bit_detected, load_buffer,
         shift_strobe, packet_done, enable_timer;
  wire   [7:0] packet_data;

  stop_bit_chk stop ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(sbc_enable), .stop_bit(stop_bit), .framing_error(
        framing_error) );
  start_bit_det start ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .start_bit_detected(start_bit_detected) );
  rx_data_buff rx ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), 
        .packet_data(packet_data), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
  sr_9bit sr ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe), 
        .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit)
         );
  rcu r ( .clk(clk), .n_rst(n_rst), .start_bit_detected(start_bit_detected), 
        .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), 
        .enable_timer(enable_timer) );
  timer timer_thing ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .shift_strobe(shift_strobe), .packet_done(packet_done) );
endmodule

