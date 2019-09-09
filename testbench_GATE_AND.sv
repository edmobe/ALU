module testbench_GATE_AND();

	logic [3:0] A;
	logic [3:0] B;
	logic [3:0] OUT;
	
	GATE_AND #4 GATE_AND_TEST(A, B, OUT);
	
	initial
		begin	
		#10 assign A = 4'b1010; B = 4'b1100;
		#10 assign A = 4'b1111; B = 4'b0000;
		#10 assign A = 4'b1001; B = 4'b0010;
		#10 assign A = 4'b0001; B = 4'b0111;
	end

endmodule: testbench_GATE_AND