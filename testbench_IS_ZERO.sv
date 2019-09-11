module testebench_IS_ZERO();

	logic [3:0] A;
	logic OUT;
	
	IS_ZERO #4 IS_ZERO_TEST(A, OUT);

	initial
		begin	
		#10 assign A = 4'b0000; 
		#10 assign A = 4'b0001;
		#10 assign A = 4'b0010;
		#10 assign A = 4'b0011;
		#10 assign A = 4'b0100; 
		#10 assign A = 4'b0101;
		#10 assign A = 4'b0110;
		#10 assign A = 4'b0111;
		#10 assign A = 4'b1000; 
		#10 assign A = 4'b1001;
		#10 assign A = 4'b1010;
		#10 assign A = 4'b1011;
		#10 assign A = 4'b1000; 
		#10 assign A = 4'b1001;
		#10 assign A = 4'b1010;
		#10 assign A = 4'b1011;
	end

endmodule: testebench_IS_ZERO