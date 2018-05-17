// 337 TA Provided Lab 2 Testbench
// This code serves as a test bench for the 1 bit adder design 

`timescale 1ns / 100ps

module tb_adder_16bit();
	// Define local parameters used by the test bench
	localparam NUM_INPUT_BITS			= 16;
	localparam NUM_OUTPUT_BITS		= NUM_INPUT_BITS + 1;
	localparam MAX_OUTPUT_BIT			= NUM_OUTPUT_BITS - 1;
	localparam NUM_TEST_BITS 			= (NUM_INPUT_BITS * 2) + 1;
	localparam MAX_TEST_BIT				= NUM_TEST_BITS - 1;
	localparam NUM_TEST_CASES 		= 2 ** NUM_TEST_BITS;
	localparam MAX_TEST_VALUE 		= NUM_TEST_CASES - 1;
	localparam TEST_A_BIT					= 0;
	localparam TEST_B_BIT					= NUM_INPUT_BITS;
	localparam TEST_CARRY_IN_BIT	= MAX_TEST_BIT;
	localparam TEST_SUM_BIT				= 0;
	localparam TEST_CARRY_OUT_BIT	= MAX_OUTPUT_BIT;
	localparam TEST_DELAY					= 10;
	
	// Declare Design Under Test (DUT) portmap signals
	reg	[MAX_OUTPUT_BIT-1:0] tb_a;
	reg	[MAX_OUTPUT_BIT-1:0] tb_b;
	reg	tb_carry_in;
	reg	[MAX_OUTPUT_BIT-1:0] tb_sum;
	reg	tb_carry_out;
	reg 	no_match;
	
	reg [16:0] tb_expected_outputs;	


	// DUT port map
	adder_16bit DUT(.a(tb_a), .b(tb_b), .carry_in(tb_carry_in), .sum(tb_sum), .overflow(tb_carry_out));
	
	// Connect individual test input bits to a vector for easier testing
	//assign tb_a					= tb_test_inputs[15:TEST_A_BIT];
	//assign tb_b					= tb_test_inputs[31:TEST_B_BIT];
	//assign tb_carry_in	= tb_test_inputs[TEST_CARRY_IN_BIT-1];
	
	// Test bench process
	initial
	begin			
		// Wait for a bit to allow this process to catch up with assign statements triggered
			// TEST CASE #1 WOOO
			#1;
			
			tb_a = 16'd0;
			tb_b = 16'd0;
			tb_carry_in = 0;
			no_match = 0;
					
			
			// Calculate the expected outputs
			tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
			// Wait for DUT to process the inputs
			#(TEST_DELAY - 1);
			
			// Check the DUT's Sum output value
			assert(tb_expected_outputs[15:0] == tb_sum)
			else
			begin
				no_match = 1;
				$error("Incorrect Sum value for test case ");
			end
			
			// Check the DUT's Carry Out output value
			assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
			else
			begin
				no_match = 1;
				$error("Incorrect Carry Out value for test case ");
			end

//TEST CASE #2 a big b small
			#1;
			
			tb_a = 16'd65535;
			tb_b = 16'd4;
			tb_carry_in = 0;
			no_match = 0;
					
			
			// Calculate the expected outputs
			tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
			// Wait for DUT to process the inputs
			#(TEST_DELAY - 1);
			
			// Check the DUT's Sum output value
			assert(tb_expected_outputs[15:0] == tb_sum)
			else
			begin
				no_match = 1;
				$error("Incorrect Sum value for test case ");
			end
			
			// Check the DUT's Carry Out output value
			assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
			else
			begin
				no_match = 1;
				$error("Incorrect Carry Out value for test case ");
			end


//TEST CASE #3 a small b big
			#1;
			
			tb_a = 16'd8;
			tb_b = 16'd65535;
			tb_carry_in = 0;
			no_match = 0;
					
			
			// Calculate the expected outputs
			tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
			// Wait for DUT to process the inputs
			#(TEST_DELAY - 1);
			
			// Check the DUT's Sum output value
			assert(tb_expected_outputs[15:0] == tb_sum)
			else
			begin
				no_match = 1;
				$error("Incorrect Sum value for test case ");
			end
			
			// Check the DUT's Carry Out output value
			assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
			else
			begin
				no_match = 1;
				$error("Incorrect Carry Out value for test case ");
			end


	
//TEST CASE #4 a large b large
			#1;
			
			tb_a = 16'd65534;
			tb_b = 16'd65533;
			tb_carry_in = 0;
			no_match = 0;
					
			
			// Calculate the expected outputs
			tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
			// Wait for DUT to process the inputs
			#(TEST_DELAY - 1);
			
			// Check the DUT's Sum output value
			assert(tb_expected_outputs[15:0] == tb_sum)
			else
			begin
				no_match = 1;
				$error("Incorrect Sum value for test case ");
			end
			
			// Check the DUT's Carry Out output value
			assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
			else
			begin
				no_match = 1;
				$error("Incorrect Carry Out value for test case ");
			end

//TEST CASE #5 a small b small
			#1;
			
			tb_a = 16'd3;
			tb_b = 16'd4;
			tb_carry_in = 0;
			no_match = 0;
					
			
			// Calculate the expected outputs
			tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
			// Wait for DUT to process the inputs
			#(TEST_DELAY - 1);
			
			// Check the DUT's Sum output value
			assert(tb_expected_outputs[15:0] == tb_sum)
			else
			begin
				no_match = 1;
				$error("Incorrect Sum value for test case ");
			end
			
			// Check the DUT's Carry Out output value
			assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
			else
			begin
				no_match = 1;
				$error("Incorrect Carry Out value for test case ");
			end



	end
	

endmodule
