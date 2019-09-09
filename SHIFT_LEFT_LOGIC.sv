module SHIFT_LEFT_LOGIC #(parameter Nbits=4)(
	input  [Nbits-1:0] A, 
	input [Nbits-1:0] B,
	output [Nbits-1:0] OUT);
	
	genvar i;
	logic [Nbits*(Nbits+1)-1:0] WIRES;
	assign WIRES[Nbits*(Nbits+1)-1:Nbits**2] = A;

	generate
		for (i=Nbits-1; i>=0; i--) begin: generate_shift_right_logic
			genvar a_n;
				for (a_n=Nbits-1; a_n>=0; a_n--) begin: generate_muxes_srl
					if(a_n-2**i < 0)
						begin
							MUX f (WIRES[a_n+Nbits*(i+1)], 0, B[i], WIRES[a_n+Nbits*i]);
						end
					else
						begin
							MUX f (WIRES[a_n+Nbits*(i+1)], WIRES[a_n+Nbits*(i+1)-2**i], B[i], WIRES[a_n+Nbits*i]);
						end
				end	
		end
		assign OUT = WIRES[Nbits-1:0];
	endgenerate
	
endmodule: SHIFT_LEFT_LOGIC