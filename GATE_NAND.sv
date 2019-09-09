module GATE_NAND #(parameter Nbits=1)(
	input logic [Nbits-1:0] A, 
	input logic [Nbits-1:0] B, 
	output logic [Nbits-1:0] OUT);

	logic [Nbits-1:0] AND_NEG;
	
	GATE_AND #Nbits AND(A, B, AND_OUT);  
	GATE_NOT #Nbits NOT(AND_OUT, OUT);
	
endmodule: GATE_NAND
