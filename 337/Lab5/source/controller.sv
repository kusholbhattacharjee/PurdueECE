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

typedef enum logic [4:0] {idle,mul1, mul2, mul3, mul4, add1, add2, sub1, sub2, eidle, loadf0, loadf1, loadf2, loadf3, wait1, wait2, wait3, store, zero, sort1, sort2, sort3, sort4} state_type; 
state_type state, next_state; 
reg next_mod; 
reg temp_mod;  
						
always_ff @ (posedge clk, negedge n_reset) 
begin: StateReg  
	if (!n_reset) 
		begin state <= idle; temp_mod <= 0; end
	else 
		begin state <= next_state; temp_mod <= next_mod; end
	 	
end 

always_comb 
begin 
	next_state = state; 
	case (state) 
		idle: next_state = (lc == 1) ? loadf0:((dr == 1) ? store:state);

		sort1: next_state = sort2;
		sort2: next_state = sort3; 
		sort3: next_state = sort4;
		sort4: next_state = mul1;

		loadf0: next_state = (lc == 0) ? wait1:state;
		wait1: next_state = (lc == 1) ? loadf1:state;
		loadf1: next_state = (lc == 0) ? wait2:state;
		wait2: next_state = (lc == 1) ? loadf2:state;
		loadf2: next_state = (lc == 0) ? wait3:state;
		wait3: next_state = (lc == 1) ? loadf3:state;
		loadf3: next_state = (lc == 0) ? idle:state;
		store: next_state = (dr == 1) ? zero:eidle;
		 	
		mul1: next_state = add1; 
		add1: next_state = (overflow == 1) ? eidle:mul2; 
		mul2: next_state = sub1; 
		sub1: next_state = (overflow == 1) ? eidle:mul3;
		mul3: next_state = add2; 
		add2: next_state = (overflow == 1) ? eidle:mul4;
		mul4: next_state = sub2; 
		sub2: next_state = (overflow == 1) ? eidle:idle; 

		eidle: next_state = (dr == 1) ? store:state;
		zero: next_state = sort1;   
	endcase   
end 

always_comb 
begin 
	cnt_up = 0; 
	clear = 0; 
	next_mod = 1; 
	err = 0; 
	op = 3'd0; 
	src1 = 4'd0; 
	src2 = 4'd0; 
	dest = 4'd0; 

	case (state) 
		idle, wait1, wait2, wait3: next_mod = 0; 
		zero: cnt_up = 1; 
		eidle: begin next_mod = 0; err = 1; end 
		store: begin dest = 4'd5; op = 3'b010; end 

		sort1: begin dest = 4'd1; src1 = 4'd2; op = 3'b001; end
		sort2: begin dest = 4'd2; src1 = 4'd3; op = 3'b001; end
		sort3: begin dest = 4'd3; src1 = 4'd4; op = 3'b001; end 	
		sort4: begin dest = 4'd4; src1 = 4'd5; op = 3'b001; end 			
		loadf0: begin clear = 1; dest = 4'd6; op = 3'b011; end
		loadf1: begin dest = 4'd7; op = 3'b011; end  
		loadf2: begin dest = 4'd8; op = 3'b011; end 
		loadf3: begin dest = 4'd9; op = 3'b011; end

		mul1: begin dest = 4'd10; src1 = 4'd1; src2 = 4'd6; op = 3'b110; end   
		add1: begin dest = 4'd0; src1 = 4'd10; op = 3'b001; end 
		mul2: begin dest = 4'd10; src1 = 4'd2; src2 = 4'd7; op = 3'b110; end
		sub1: begin dest = 4'd0; src1 = 4'd0; src2 = 4'd10; op = 3'b101; end
		mul3: begin dest = 4'd10; src1 = 4'd3; src2 = 4'd8; op = 3'b110; end
		add2: begin dest = 4'd0; src1 = 4'd0; src2 = 4'd10; op = 3'b100; end
		mul4: begin dest = 4'd10; src1 = 4'd4; src2 = 4'd9; op = 3'b110; end
		sub2: begin dest = 4'd0; src1 = 4'd0; src2 = 4'd10; op = 3'b101; end      
		
	endcase 
end 

assign modwait = temp_mod; 

endmodule 
