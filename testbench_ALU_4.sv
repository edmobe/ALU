module testbench_ALU_4();
	// Autochequeo falta
	
	// INPUT VARIABLES
	logic [3:0] A;
	logic [3:0] B;
	logic [3:0] SELECT;
	
	// OUTPUT VARIABLES
	logic [3:0] OUT;
	logic FLAG_CARRY;
	logic FLAG_OVERFLOW;
	logic FLAG_NEGATIVE;
	logic FLAG_ZERO;
	
	ALU_N #4 ALU_test(A, B, SELECT, OUT, FLAG_CARRY, FLAG_OVERFLOW, FLAG_NEGATIVE, FLAG_ZERO); 

	initial
		begin	
		// SUM
		#10 assign A = 4'b0101; B = 4'b0001; SELECT = 4'b0000;
		#10 assign A = 4'b0010; B = 4'b0000; SELECT = 4'b0000;
		#10 assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0000;
		#10 assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0000;
		
		// SUBTRACTION
		#10 assign A = 4'b0101; B = 4'b0001; SELECT = 4'b0001;
		#10 assign A = 4'b0010; B = 4'b0000; SELECT = 4'b0001;
		#10 assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0001;
		#10 assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0001;
		
		// NOT
		#10 assign A = 4'b0101; B = 4'b0001; SELECT = 4'b0010;
		#10 assign A = 4'b0010; B = 4'b0000; SELECT = 4'b0010;
		#10 assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0010;
		#10 assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0010;
		
		// AND
		#10 assign A = 4'b0101; B = 4'b0001; SELECT = 4'b0011;
		#10 assign A = 4'b0010; B = 4'b0000; SELECT = 4'b0011;
		#10 assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0011;
		#10 assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0011;
		
		// OR
		#10 assign A = 4'b0101; B = 4'b1001; SELECT = 4'b0100;
		#10 assign A = 4'b0010; B = 4'b1000; SELECT = 4'b0100;
		#10 assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0100;
		#10 assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0100;
		
		// XOR
		#10 assign A = 4'b0101; B = 4'b1001; SELECT = 4'b0101;
		#10 assign A = 4'b0010; B = 4'b1000; SELECT = 4'b0101;
		#10 assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0101;
		#10 assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0101;
		
		// SHIFT LEFT LOGIC
		#10 assign A = 4'b0101; B = 4'b0001; SELECT = 4'b0110;
		#10 assign A = 4'b0010; B = 4'b0000; SELECT = 4'b0110;
		#10 assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0110;
		#10 assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0110;
		
		// SHIFT LEFT ARITHMETIC
		#10 assign A = 4'b0101; B = 4'b0001; SELECT = 4'b0111;
		#10 assign A = 4'b0010; B = 4'b0000; SELECT = 4'b0111;
		#10 assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0111;
		#10 assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0111;
		
		// SHIFT RIGHT LOGIC
		#10 assign A = 4'b0101; B = 4'b0001; SELECT = 4'b1000;
		#10 assign A = 4'b0010; B = 4'b0000; SELECT = 4'b1000;
		#10 assign A = 4'b1110; B = 4'b0010; SELECT = 4'b1000;
		#10 assign A = 4'b0110; B = 4'b0100; SELECT = 4'b1000;
		
		// SHIFT RIGHT ARITHMETIC
		#10 assign A = 4'b0101; B = 4'b0001; SELECT = 4'b1001;
		#10 assign A = 4'b0010; B = 4'b0000; SELECT = 4'b1001;
		#10 assign A = 4'b1110; B = 4'b0010; SELECT = 4'b1001;
		#10 assign A = 4'b0110; B = 4'b0100; SELECT = 4'b1001;
		
		// OTHER SELECTOR
		#10 assign A = 4'b0101; B = 4'b0001; SELECT = 4'b1111;
		#10 assign A = 4'b0010; B = 4'b0000; SELECT = 4'b1111;
		#10 assign A = 4'b1110; B = 4'b0010; SELECT = 4'b1111;
		#10 assign A = 4'b0110; B = 4'b0100; SELECT = 4'b1111;
		
	end


endmodule: testbench_ALU_4