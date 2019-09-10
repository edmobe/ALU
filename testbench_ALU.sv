module testbench_ALU();
	// Autochequeo
	parameter nBits = 4;
	logic [nBits-1:0] A;
	logic [nBits-1:0] B;
	wire [nBits-1:0] OUT;
	
	ALU ALU_test(A, B, OUT);

	initial
		begin	
		#10 assign A = 4'b0101; B = 4'b0001; 
		#10 assign A = 4'b1011; B = 4'b0001;
	end


endmodule: testbench_ALU