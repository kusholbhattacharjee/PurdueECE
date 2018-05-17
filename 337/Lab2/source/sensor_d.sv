// $Id: $
// File name:   sensor_d.sv
// Created:     1/19/2018
// Author:      Kushol Bhattacharjee
// Lab Section: 337-07
// Version:     1.0  Initial Design Entry
// Description: dataflow style sensor detector
module sensor_d
(
	input wire [3:0] sensors,
	output wire error
);

assign one = sensors[1] && sensors[3];
assign two = sensors[1] && sensors[2];
assign error = sensors[0] || one || two;

endmodule
