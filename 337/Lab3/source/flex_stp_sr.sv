// $Id: $
// File name:   flex_stp_sr.sv
// Created:     1/30/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: flexible serial-to-parallel shift register design

module flex_stp_sr 
#(	
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire serial_in,
	output reg [NUM_BITS-1:0] parallel_out
);

reg [NUM_BITS-1:0] temp;

always_ff @ (posedge clk, negedge n_rst) 
begin 	
	if (n_rst == 0)
		parallel_out <= '1;
	else
		parallel_out <= temp;
end

always_comb 
begin
	temp = parallel_out;
	if (shift_enable == 1)
	begin
		if (SHIFT_MSB == 1)
		begin
			temp[NUM_BITS-1:1] = temp[NUM_BITS-2:0];
			temp[0] = serial_in;
		end
		else
			begin
			temp[NUM_BITS-2:0] = temp[NUM_BITS-1:1];
			temp[NUM_BITS-1] = serial_in;
			end
	end
end

endmodule



	