module testebench_GATE_XOR();

	logic [4:0] A;
	logic [4:0] B;
	logic [4:0] OUT;

	GATE_XOR #5 GATE_XOR_TEST(A, B, OUT);

	initial
		begin	
		#10 assign A = 5'b10100; B = 5'b11001;
		#10 assign A = 5'b11111; B = 5'b00001;
		#10 assign A = 5'b10010; B = 5'b00100;
		#10 assign A = 5'b00011; B = 5'b01110;
	end
	
endmodule: testebench_GATE_XOR