// $Id: $
// File name:   rcu.sv
// Created:     2/28/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: rcu code yo

module rcu 
(
	input wire clk, 
	input wire n_rst, 
	input wire d_edge, 
	input wire eop, 
	input wire shift_enable, 
	input wire [7:0] rcv_data, 
	input wire byte_received, 
	output reg rcving, 	
	output reg w_enable, 
	output reg r_error 
); 

localparam sync_var = 8'b10000000; 

typedef enum logic [3:0] {IDLE, 
			  RCV,
			  SYNC, 
			  ESYNC, EWAIT, EIDLE, 
			  FIRSTBIT, OTHERBITS, 
			  STORE, 
			  EOP} state_type; 
state_type state, next_state; 

always_ff @ (posedge clk, negedge n_rst) begin
	if (n_rst==0)  
		state <= IDLE;  
	else 
		state <= next_state;  
end 

always_comb begin 
	next_state = state; 
	case (state) 
		IDLE: next_state = (d_edge) ? RCV:state; 
		
		RCV: next_state = (byte_received) ? SYNC:( (shift_enable & eop) ? EWAIT:state ); 
		
		SYNC: next_state = (sync_var == rcv_data) ? FIRSTBIT:ESYNC;
		 
		FIRSTBIT: next_state = (shift_enable & eop) ? EOP:( (shift_enable & !eop) ? OTHERBITS:state );
		
		EOP: next_state = (d_edge) ? IDLE:state;
		
		OTHERBITS: next_state = (shift_enable & eop) ? EWAIT:( (byte_received) ? STORE:state );
		
		STORE: next_state = FIRSTBIT;
		
		ESYNC: next_state = (shift_enable & eop) ? EWAIT:state;
		
		EWAIT: next_state = (d_edge) ? EIDLE:state;
		
		EIDLE: next_state = (d_edge) ? RCV:state;
	endcase 
end 

assign rcving = (state==RCV || state==SYNC || state==FIRSTBIT || state==OTHERBITS || state==STORE || state==ESYNC);
assign r_error = (state==ESYNC || state==EWAIT || state==EIDLE);
assign w_enable = (state==STORE);

endmodule 









