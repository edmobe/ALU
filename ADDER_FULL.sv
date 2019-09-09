module ADDER_FULL #(parameter Nbits=4)
	(input [Nbits-1:0] A,
	 input [Nbits-1:0] B,
	 input C_IN,
	 output [Nbits-1:0] SUM,
	 output C_OUT);
	 
	genvar i;
	logic [Nbits-1:0] C_HALF;
	
	generate
		for (i=0; i< Nbits; i++) begin: generate_full_adder
				if (i==0)
					begin
						ADDER_HALF f (A[i], B[i], C_IN, SUM[i], C_HALF[i]);
					end
				else
					begin
						ADDER_HALF f (A[i], B[i], C_HALF[i-1], SUM[i], C_HALF[i]);
					end		
		end
		assign C_OUT = C_HALF[Nbits-1];
	endgenerate	
 
endmodule: ADDER_FULL