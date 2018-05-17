// $Id: $
// File name:   rcu.sv
// Created:     2/6/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: main receiver control unit

module rcu (
	input wire clk, n_rst, start_bit_detected, packet_done, framing_error,
	output wire sbc_clear, sbc_enable, load_buffer, enable_timer
);

//list all the different states
typedef enum logic [2:0] {IDLE, CLEAR, READ_DATA, READ_SB, READ_FE, LOAD_BUF} state_type;
state_type state, next_state;

//flip flop for next state assigned to state
always_ff @ (posedge clk, negedge n_rst) begin
	if (n_rst == 0) 
		state <= IDLE;
	else
		state <= next_state;
end

//combinational block for state
always_comb begin
	next_state = state; //prevent latch
	
	case (state)
		
		IDLE: next_state = (start_bit_detected == 1) ? CLEAR:IDLE;

		CLEAR: next_state = READ_DATA;

		READ_DATA: next_state = (packet_done == 1) ? READ_SB:READ_DATA;

		READ_SB: next_state = READ_FE;

		READ_FE: next_state = (framing_error == 1) ? IDLE:LOAD_BUF;

		LOAD_BUF: next_state = IDLE; 

	endcase
end

assign sbc_clear = (state == CLEAR);
assign enable_timer = (state == READ_DATA);
assign sbc_enable = (state == READ_SB);
assign load_buffer = (state == LOAD_BUF); 


endmodule



