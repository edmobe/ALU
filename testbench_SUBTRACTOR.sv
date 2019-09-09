module testbench_SUBTRACTOR();
	logic [7:0] A;
	logic [7:0] B;
	logic [7:0] DIFF;
	
	SUBTRACTOR #8 SUBTRACTOR_TEST(A, B, DIFF);

	initial
		begin	
		#10 assign A = 8'b00000101; B = 8'b00000001;
		#10 assign A = 8'b00000010; B = 8'b00001000;
		#10 assign A = 8'b00001110; B = 8'b01000010;
		#10 assign A = 8'b11111110; B = 8'b11110100;
	end

endmodule: testbench_SUBTRACTOR