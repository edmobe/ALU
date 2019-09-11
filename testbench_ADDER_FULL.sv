	module testebench_ADDER_FULL();
	logic [3:0] A;
	logic [3:0] B;
	logic C_IN;
	logic [3:0] SUM;
	logic C_OUT;
	logic OVERFLOW;
	
	ADDER_FULL #4 ADDER_FULL_TEST(A, B, C_IN, SUM, C_OUT, OVERFLOW);

	initial
		begin	
		#10 assign A = 4'b0101; B = 4'b0001; C_IN = 0;
		#10 assign A = 4'b0010; B = 4'b0000; C_IN = 1;
		#10 assign A = 4'b1110; B = 4'b0010; C_IN = 0;
		#10 assign A = 4'b0110; B = 4'b0100; C_IN = 1;
	end

endmodule: testebench_ADDER_FULL