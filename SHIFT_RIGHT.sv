module SHIFT_RIGHT #(parameter Nbits=4)(
	input ADD_MSB, // Number to add at MSB
	input  [Nbits-1:0] A, 
	input [Nbits-1:0] B,
	output [Nbits-1:0] OUT,
	output OVERFLOW);
	
	genvar i;
	logic [Nbits*(Nbits+1)-1:0] WIRES;
	assign WIRES[Nbits*(Nbits+1)-1:Nbits**2] = A;

	generate
		for (i=Nbits-1; i>=0; i--) begin: generate_shift_right
			genvar a_n;
			for (a_n=Nbits-1; a_n>=0; a_n--) begin: generate_muxes_sr
				if(a_n+2**i >= Nbits)
					begin
						MUX f (WIRES[a_n+Nbits*(i+1)], ADD_MSB, B[i], WIRES[a_n+Nbits*i]);
					end
				else
					begin
						MUX f (WIRES[a_n+Nbits*(i+1)], WIRES[a_n+Nbits*(i+1)+2**i], B[i], WIRES[a_n+Nbits*i]);
					end
			end	
		end
		assign OUT = WIRES[Nbits-1:0];
		assign OVERFLOW = 1'b0;
	endgenerate
	
endmodule: SHIFT_RIGHT