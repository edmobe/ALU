module ALU (
	input [9:0] SW,	// SWITCHES
	output [9:0] LEDR	// LEDS
);

ALU_N #3 ALU_FPGA(SW[9:7], SW[6:4], SW[3:0], LEDR[9:7], LEDR[6], LEDR[5], LEDR[4], LEDR[3]);

endmodule: ALU

/*
module ALU #(parameter Nbits=16) (
	input  [Nbits-1:0]  A,
	input  [Nbits-1:0]  B,
	input  [3:0] SELECT,
	output [Nbits-1:0] OUT,
	output FLAG_CARRY,
	output FLAG_OVERFLOW,
	output FLAG_NEGATIVE,
	output FLAG_ZERO
);

ALU_N #Nbits ALU_TEST(A, B, SELECT, OUT, FLAG_CARRY, FLAG_OVERFLOW, FLAG_NEGATIVE, FLAG_ZERO);

endmodule: ALU
*/