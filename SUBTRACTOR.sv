module SUBTRACTOR #(parameter Nbits=4)
	(input [Nbits-1:0] A,
	 input [Nbits-1:0] B,
	 output [Nbits-1:0] DIFF);
	 
	 logic COUT;
	 logic [Nbits-1:0] B_NEG;
	 
	 GATE_NOT #Nbits GATE_NOT_COMPLEMENT(B, B_NEG);
	 ADDER_FULL #Nbits SUBTRACTION(A, B_NEG, 1, DIFF, COUT);
 
endmodule: SUBTRACTOR