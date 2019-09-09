module GATE_NOT #(parameter Nbits=1)(
	input  [Nbits-1:0] A, 
	output [Nbits-1:0] OUT);
	
	genvar i;
	
	generate
		for (i=0; i < Nbits; i=i+1) begin : generate_of_not
			not (OUT[i],A[i]);
		end
	endgenerate
	
endmodule: GATE_NOT