module GATE_AND #(parameter Nbits=1)(
	input logic [Nbits-1:0] A, 
	input logic [Nbits-1:0] B, 
	output logic [Nbits-1:0] OUT);	
	
	genvar i;
	
	generate
		for (i=0; i < Nbits; i=i+1) begin : generate_of_and
			and (OUT[i],A[i],B[i]);
		end
	endgenerate
	
endmodule: GATE_AND
