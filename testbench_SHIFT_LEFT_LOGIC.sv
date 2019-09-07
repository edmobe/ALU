module testbench_SHIFT_LEFT_LOGIC();
	logic [3:0] A;
	logic [3:0] B;
	wire [3:0] OUT;
	
	SHIFT_LEFT_LOGIC SHIFT_LEFT_LOGIC_test(A, B, OUT);


	initial
		begin	
		#10 assign A = 4'b0101; B = 4'b0101; 
		#10 assign A = 4'b1011; B = 4'b0101; 
	end


endmodule: testbench_SHIFT_LEFT_LOGIC