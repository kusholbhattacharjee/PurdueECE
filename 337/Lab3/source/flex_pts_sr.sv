// $Id: $
// File name:   flex_pts_sr.sv
// Created:     1/30/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: parallel to serial

module flex_pts_sr 
#(	
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire load_enable,
	input wire [NUM_BITS-1:0] parallel_in,
	output reg serial_out
);

reg [NUM_BITS-1:0] temp;
reg [NUM_BITS-1:0] tempS;

always_ff @ (posedge clk, negedge n_rst) 
begin 	
	if (n_rst == 0)
		tempS <= '1;
	else
		tempS <= temp;
end

always_comb 
begin
	temp = tempS;

	if (load_enable == 1)
	begin
		temp = parallel_in;
		if (SHIFT_MSB == 1)
			serial_out = tempS[NUM_BITS-1];
		else
			serial_out = tempS[0];
	end
	else if (shift_enable == 1)
	begin
		if (SHIFT_MSB == 1)
			begin
			serial_out = tempS[NUM_BITS-1];
			temp[NUM_BITS-1:1] = temp[NUM_BITS-2:0];
			temp[0] = parallel_in[0];
			end
		else
			begin
			serial_out = tempS[0];
			temp[NUM_BITS-2:0] = temp[NUM_BITS-1:1];
			temp[NUM_BITS-1] = parallel_in[NUM_BITS-1];
			end
	end
	else
	begin
		if (SHIFT_MSB == 1)
			serial_out = tempS[NUM_BITS-1];
		else
			serial_out = tempS[0];
	end
	
end

endmodule
