// $Id: $
// File name:   adder_nbit.sv
// Created:     1/24/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: n bit adder design




module adder_nbit
#(
	parameter BIT_WIDTH = 4
)
 (

	input wire [BIT_WIDTH-1:0] a,
	input wire [BIT_WIDTH-1:0] b,
	input wire carry_in,
	output wire [BIT_WIDTH-1:0] sum,
	output wire overflow
);

wire [BIT_WIDTH:0] carrys;
genvar i;

assign carrys[0] = carry_in;
generate
	for(i=0; i<=(BIT_WIDTH-1); i=i+1)
	begin
		adder_1bit IX ( .a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));
		//always @ (a,b,carrys)
		//begin
		//	assert(((a[i] + b[i] + carrys[i]) % 2) == sum[i])
		//	else $error("Output of 's' of n bit adder is not correct");
		//end
	end
endgenerate
assign overflow=carrys[BIT_WIDTH];

endmodule
