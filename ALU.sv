module ALU (
	input [9:0] SW,	// SWITCHES
	output [9:0] LEDR	// LEDS
);

ALU_N #3 ALU_FPGA(SW[9:7], SW[6:4], SW[3:0], LEDR[9:7], LEDR[6], LEDR[5], LEDR[4], LEDR[3]);

endmodule: ALU