module IS_ZERO #(parameter Nbits=4)
	(input [Nbits-1:0] A,
	 output FLAG_ZERO);
	 
	logic [Nbits-2:0] XOR_OUTS;
	logic [Nbits-1:0] AND_OUTS;
	
	xnor(AND_OUTS[0], A[0], 0);
	
	genvar i;
	generate
		for (i=1; i< Nbits; i++) begin: generate_of_is_zero
			xnor(XOR_OUTS[i-1], A[i], 0);
			and(AND_OUTS[i], AND_OUTS[i-1], XOR_OUTS[i-1]);
		end
	endgenerate
	
	assign FLAG_ZERO = AND_OUTS[Nbits-1];
 
endmodule: IS_ZERO