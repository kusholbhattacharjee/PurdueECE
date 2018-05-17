// $Id: $
// File name:   sensor_b.sv
// Created:     1/19/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: behavrioal

module sensor_b (
	input wire [3:0] sensors,
	output reg error	
);

always_comb
begin 
	error = 1'b0;
	if (sensors[0] || (sensors[1] && sensors[2]) || (sensors[1] && sensors[3]) ) error=1'b1;
end

endmodule
