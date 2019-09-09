module testebench_GATE_NOT();

	logic [1:0] A;
	logic [1:0] OUT;
	
	GATE_NOT #2 GATE_NOT_TEST(A, OUT);

	initial
		begin	
		#10 assign A = 2'b00; 
		#10 assign A = 2'b01;
		#10 assign A = 2'b10;
		#10 assign A = 2'b11;
	end

endmodule: testebench_GATE_NOT