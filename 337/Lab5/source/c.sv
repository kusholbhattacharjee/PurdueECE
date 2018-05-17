// $Id: $
// File name:   controller.sv
// Created:     2/13/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: controlller module oh yeahhhhhh

module controller (
	input wire clk, n_reset, dr, lc, overflow,
	output reg cnt_up, clear, err,
	output wire modwait,
	output reg [2:0] op,
	output reg [3:0] src1,
	output reg [3:0] src2,
	output reg [3:0] dest
);

reg next_mod, temp_mod;
typedef enum logic [4:0] {idle, store, sort1, sort2, sort3, sort4,mul1, mul2, mul3, mul4, add1, sub1, add2, sub2, eidle, wait0, wait1, wait2, loadf0, loadf1, loadf2, loadf3, zero} state_type;
state_type state, next_state;

always_ff @ (posedge clk, negedge n_reset) begin
	if (n_reset == 0) begin
		state <= idle; temp_mod <= 0;
		end
	else	begin
		state <= next_state; temp_mod <= next_mod;
		end
end

always_comb begin //state machine
	next_state = state;
	
	case(state)
		idle: next_state = (lc == 1) ? loadf0:((dr == 1) ? store:state);
		store: next_state = (dr == 1) ? zero:eidle;
		eidle: next_state = (dr == 1) ? store:state;
		loadf0: next_state = (lc == 0) ? wait0:state;
		wait0: next_state = (lc == 1) ? loadf1:state;
		loadf1: next_state = (lc == 0) ? wait1:state;
		wait1: next_state = (lc == 1) ? loadf2:state;
		loadf2: next_state = (lc == 0) ? wait2:state;
		wait2: next_state = (lc == 1) ? loadf3:state;
		loadf3: next_state = (lc == 0) ? idle:state;
		zero: next_state = sort1;
		sort1: next_state = sort2;
		sort2: next_state = sort3;
		sort3: next_state = sort4;
		sort4: next_state = mul1;
		mul1: next_state = add1;
		add1: next_state = (overflow == 1) ? eidle:mul2;
		mul2: next_state = sub1;
		sub1: next_state = (overflow == 1) ? eidle:mul3;
		mul3: next_state = add2;
		add2: next_state = (overflow == 1) ? eidle:mul4;
		mul4: next_state = sub2;
		sub2: next_state = (overflow == 1) ? eidle:idle;
	endcase
end

always_comb begin // set respective destination and source values for each state 1 cycle later
	err = 0;
	clear = 0;
	cnt_up = 0;
	next_mod = 1;
	op = 3'd0;
	src1 = 4'd0;
	src2 = 4'd0;
	dest = 4'd0;

	case(state)
		idle: next_mod = 0;
		store: begin op = 3'b010; dest = 4'd5; end
		eidle: begin next_mod = 0; err = 1; end
		loadf0: begin op = 3'b011; dest = 4'd6; clear=1; end
		wait0: next_mod = 0; 
		loadf1: begin op = 3'b011; dest = 4'd7; end
		wait1: next_mod = 0;
		loadf2: begin op = 3'b011; dest = 4'd8; end
		wait2: next_mod = 0;
		loadf3: begin op = 3'b011; dest = 4'd9; end
		zero: cnt_up = 1;
		sort1: begin op = 3'b001; dest = 4'd1; src1 = 4'd2; end
		sort2: begin op = 3'b001; dest = 4'd2; src1 = 4'd3; end
		sort3: begin op = 3'b001; dest = 4'd3; src1 = 4'd4; end
		sort4: begin op = 3'b001; dest = 4'd4; src1 = 4'd5; end
		mul1: begin op = 3'b110; dest = 4'd10; src1 = 4'd1; src2 = 4'd6; end
		add1: begin op = 3'b001; dest = 4'd0; src1 = 4'd0; src2 = 4'd10; end
		mul2: begin op = 3'b110; dest = 4'd10; src1 = 4'd2; src2 = 4'd7; end
		sub1: begin op = 3'b101; dest = 4'd0; src1 = 4'd0; src2 = 4'd10; end
		mul3: begin op = 3'b110; dest = 4'd10; src1 = 4'd3; src2 = 4'd8; end
		add2: begin op = 3'b100; dest = 4'd0; src1 = 4'd0; src2 = 4'd10; end
		mul4: begin op = 3'b110; dest = 4'd10; src1 = 4'd4; src2 = 4'd9; end
		sub2: begin op = 3'b101; dest = 4'd0; src1 = 4'd0; src2 = 4'd10; end
	endcase
		
end
	
assign modwait = temp_mod;

endmodule
