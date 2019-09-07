module SHIFT_LEFT_LOGIC #(parameter Nbits=4)(
	input  [Nbits-1:0] A, 
	input [Nbits-1:0] B,
	output [Nbits-1:0] OUT);
	
	assign OUT = A << 1; // Shift left, 1 bit (logical).
	
endmodule: SHIFT_LEFT_LOGIC