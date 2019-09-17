module testbench_ALU();
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
		// TEST 1
		assign A = 4'b0101; B = 4'b0001; SELECT = 4'b0000; #10;
		assert(OUT === 4'b0110) else $error("SUM TEST 1 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SUM TEST 1 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SUM TEST 1 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SUM TEST 1 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SUM TEST 1 FLAG ZERO ERROR.");
		// TEST 2
		assign A = 4'b0010; B = 4'b0000; SELECT = 4'b0000; #10;
		assert(OUT === 4'b0010) else $error("SUM TEST 2 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SUM TEST 2 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SUM TEST 2 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SUM TEST 2 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SUM TEST 2 FLAG ZERO ERROR.");
		// TEST 3
		assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0000; #10;
		assert(OUT === 4'b0000) else $error("SUM TEST 3 OUT ERROR.");
		assert(FLAG_CARRY === 1) else $error("SUM TEST 3 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SUM TEST 3 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SUM TEST 3 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 1) else $error("SUM TEST 3 FLAG ZERO ERROR.");
		// TEST 4
		assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0000; #10;
		assert(OUT === 4'b1010) else $error("SUM TEST 4 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SUM TEST 4 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 1) else $error("SUM TEST 4 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 1) else $error("SUM TEST 4 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SUM TEST 4 FLAG ZERO ERROR.");
		
		// SUBTRACTION
		// TEST 1
		assign A = 4'b0101; B = 4'b0001; SELECT = 4'b0001; #10;
		assert(OUT === 4'b0100) else $error("SUBTRACTION TEST 1 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SUBTRACTION TEST 1 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SUBTRACTION TEST 1 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SUBTRACTION TEST 1 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SUBTRACTION TEST 1 FLAG ZERO ERROR.");
		// TEST 2
		assign A = 4'b0010; B = 4'b0000; SELECT = 4'b0001; #10;
		assert(OUT === 4'b0010) else $error("SUBTRACTION TEST 2 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SUBTRACTION TEST 2 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SUBTRACTION TEST 2 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SUBTRACTION TEST 2 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SUBTRACTION TEST 2 FLAG ZERO ERROR.");
		// TEST 3
		assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0001; #10;
		assert(OUT === 4'b1100) else $error("SUBTRACTION TEST 3 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SUBTRACTION TEST 3 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SUBTRACTION TEST 3 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 1) else $error("SUBTRACTION TEST 3 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SUBTRACTION TEST 3 FLAG ZERO ERROR.");
		// TEST 4
		assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0001; #10;
		assert(OUT === 4'b0010) else $error("SUBTRACTION TEST 4 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SUBTRACTION TEST 4 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SUBTRACTION TEST 4 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SUBTRACTION TEST 4 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SUBTRACTION TEST 4 FLAG ZERO ERROR.");
		
		// NOT
		// TEST 1
		assign A = 4'b0101; B = 4'b0001; SELECT = 4'b0010; #10;
		assert(OUT === 4'b1010) else $error("NOT TEST 1 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("NOT TEST 1 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("NOT TEST 1 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("NOT TEST 1 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("NOT TEST 1 FLAG ZERO ERROR.");
		// TEST 2
		assign A = 4'b0010; B = 4'b0000; SELECT = 4'b0010; #10;
		assert(OUT === 4'b1101) else $error("NOT TEST 2 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("NOT TEST 2 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("NOT TEST 2 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("NOT TEST 2 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("NOT TEST 2 FLAG ZERO ERROR.");
		// TEST 3
		assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0010; #10;
		assert(OUT === 4'b0001) else $error("NOT TEST 3 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("NOT TEST 3 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("NOT TEST 3 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("NOT TEST 3 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("NOT TEST 3 FLAG ZERO ERROR.");
		// TEST 4
		assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0010; #10;
		assert(OUT === 4'b1001) else $error("NOT TEST 4 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("NOT TEST 4 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("NOT TEST 4 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("NOT TEST 4 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("NOT TEST 4 FLAG ZERO ERROR.");
		
		// AND
		// TEST 1
		assign A = 4'b0101; B = 4'b0001; SELECT = 4'b0011; #10;
		assert(OUT === 4'b0001) else $error("AND TEST 1 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("AND TEST 1 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("AND TEST 1 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("AND TEST 1 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("AND TEST 1 FLAG ZERO ERROR.");
		// TEST 2
		assign A = 4'b0010; B = 4'b0000; SELECT = 4'b0011; #10;
		assert(OUT === 4'b0000) else $error("AND TEST 2 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("AND TEST 2 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("AND TEST 2 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("AND TEST 2 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("AND TEST 2 FLAG ZERO ERROR.");
		// TEST 3
		assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0011; #10;
		assert(OUT === 4'b0010) else $error("AND TEST 3 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("AND TEST 3 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("AND TEST 3 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("AND TEST 3 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("AND TEST 3 FLAG ZERO ERROR.");
		// TEST 4
		assign A = 4'b0111; B = 4'b1101; SELECT = 4'b0011; #10;
		assert(OUT === 4'b0101) else $error("AND TEST 4 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("AND TEST 4 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("AND TEST 4 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("AND TEST 4 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("AND TEST 4 FLAG ZERO ERROR.");
		
		// OR
		// TEST 1
		assign A = 4'b0101; B = 4'b1001; SELECT = 4'b0100; #10;
		assert(OUT === 4'b1101) else $error("OR TEST 1 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("OR TEST 1 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("OR TEST 1 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("OR TEST 1 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("OR TEST 1 FLAG ZERO ERROR.");
		// TEST 2
		assign A = 4'b0010; B = 4'b1000; SELECT = 4'b0100; #10;
		assert(OUT === 4'b1010) else $error("OR TEST 2 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("OR TEST 2 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("OR TEST 2 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("OR TEST 2 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("OR TEST 2 FLAG ZERO ERROR.");
		// TEST 3
		assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0100; #10;
		assert(OUT === 4'b1110) else $error("OR TEST 3 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("OR TEST 3 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("OR TEST 3 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("OR TEST 3 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("OR TEST 3 FLAG ZERO ERROR.");
		// TEST 4
		assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0100; #10;
		assert(OUT === 4'b0110) else $error("OR TEST 4 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("OR TEST 4 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("OR TEST 4 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("OR TEST 4 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("OR TEST 4 FLAG ZERO ERROR.");
		
		// XOR
		// TEST 1
		assign A = 4'b0101; B = 4'b1001; SELECT = 4'b0101; #10;
		assert(OUT === 4'b1100) else $error("XOR TEST 1 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("XOR TEST 1 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("XOR TEST 1 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("XOR TEST 1 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("XOR TEST 1 FLAG ZERO ERROR.");
		// TEST 2
		assign A = 4'b0010; B = 4'b1000; SELECT = 4'b0101; #10;
		assert(OUT === 4'b1010) else $error("XOR TEST 2 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("XOR TEST 2 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("XOR TEST 2 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("XOR TEST 2 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("XOR TEST 2 FLAG ZERO ERROR.");
		// TEST 3
		assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0101; #10;
		assert(OUT === 4'b1100) else $error("XOR TEST 3 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("XOR TEST 3 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("XOR TEST 3 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("XOR TEST 3 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("XOR TEST 3 FLAG ZERO ERROR.");
		// TEST 4
		assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0101; #10;
		assert(OUT === 4'b0010) else $error("XOR TEST 4 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("XOR TEST 4 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("XOR TEST 4 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("XOR TEST 4 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("XOR TEST 4 FLAG ZERO ERROR.");
		
		// SHIFT LEFT LOGIC
		// TEST 1
		assign A = 4'b0101; B = 4'b0001; SELECT = 4'b0110; #10;
		assert(OUT === 4'b1010) else $error("SHIFT LEFT LOGIC TEST 1 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT LEFT LOGIC TEST 1 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT LEFT LOGIC TEST 1 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SHIFT LEFT LOGIC TEST 1 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SHIFT LEFT LOGIC TEST 1 FLAG ZERO ERROR.");
		// TEST 2
		assign A = 4'b0010; B = 4'b0000; SELECT = 4'b0110; #10;
		assert(OUT === 4'b0010) else $error("SHIFT LEFT LOGIC TEST 2 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT LEFT LOGIC TEST 2 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT LEFT LOGIC TEST 2 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SHIFT LEFT LOGIC TEST 2 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SHIFT LEFT LOGIC TEST 2 FLAG ZERO ERROR.");
		// TEST 3
		assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0110; #10;
		assert(OUT === 4'b1000) else $error("SHIFT LEFT LOGIC TEST 3 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT LEFT LOGIC TEST 3 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT LEFT LOGIC TEST 3 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SHIFT LEFT LOGIC TEST 3 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SHIFT LEFT LOGIC TEST 3 FLAG ZERO ERROR.");
		// TEST 4
		assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0110; #10;
		assert(OUT === 4'b0000) else $error("SHIFT LEFT LOGIC TEST 4 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT LEFT LOGIC TEST 4 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT LEFT LOGIC TEST 4 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SHIFT LEFT LOGIC TEST 4 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SHIFT LEFT LOGIC TEST 4 FLAG ZERO ERROR.");
		
		// SHIFT LEFT ARITHMETIC
		// TEST 1
		assign A = 4'b0101; B = 4'b0001; SELECT = 4'b0111; #10;
		assert(OUT === 4'b1010) else $error("SHIFT LEFT ARITHMETIC TEST 1 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT LEFT ARITHMETIC TEST 1 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 1) else $error("SHIFT LEFT ARITHMETIC TEST 1 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 1) else $error("SHIFT LEFT ARITHMETIC TEST 1 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SHIFT LEFT ARITHMETIC TEST 1 FLAG ZERO ERROR.");
		// TEST 2
		assign A = 4'b0010; B = 4'b0000; SELECT = 4'b0111; #10;
		assert(OUT === 4'b0010) else $error("SHIFT LEFT ARITHMETIC TEST 2 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT LEFT ARITHMETIC TEST 2 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT LEFT ARITHMETIC TEST 2 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SHIFT LEFT ARITHMETIC TEST 2 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SHIFT LEFT ARITHMETIC TEST 2 FLAG ZERO ERROR.");
		// TEST 3
		assign A = 4'b1110; B = 4'b0010; SELECT = 4'b0111; #10;
		assert(OUT === 4'b1000) else $error("SHIFT LEFT ARITHMETIC TEST 3 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT LEFT ARITHMETIC TEST 3 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT LEFT ARITHMETIC TEST 3 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 1) else $error("SHIFT LEFT ARITHMETIC TEST 3 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SHIFT LEFT ARITHMETIC TEST 3 FLAG ZERO ERROR.");
		// TEST 4
		assign A = 4'b0110; B = 4'b0100; SELECT = 4'b0111; #10;
		assert(OUT === 4'b0000) else $error("SHIFT LEFT ARITHMETIC TEST 4 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT LEFT ARITHMETIC TEST 4 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT LEFT ARITHMETIC TEST 4 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SHIFT LEFT ARITHMETIC TEST 4 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 1) else $error("SHIFT LEFT ARITHMETIC TEST 4 FLAG ZERO ERROR.");
		
		// SHIFT RIGHT LOGIC
		// TEST 1
		assign A = 4'b0101; B = 4'b0001; SELECT = 4'b1000; #10;
		assert(OUT === 4'b0010) else $error("SHIFT RIGHT LOGIC TEST 1 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT RIGHT LOGIC TEST 1 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT RIGHT LOGIC TEST 1 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SHIFT RIGHT LOGIC TEST 1 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SHIFT RIGHT LOGIC TEST 1 FLAG ZERO ERROR.");
		// TEST 2
		assign A = 4'b0010; B = 4'b0000; SELECT = 4'b1000; #10;
		assert(OUT === 4'b0010) else $error("SHIFT RIGHT LOGIC TEST 2 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT RIGHT LOGIC TEST 2 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT RIGHT LOGIC TEST 2 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SHIFT RIGHT LOGIC TEST 2 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SHIFT RIGHT LOGIC TEST 2 FLAG ZERO ERROR.");
		// TEST 3
		assign A = 4'b1110; B = 4'b0010; SELECT = 4'b1000; #10;
		assert(OUT === 4'b0011) else $error("SHIFT RIGHT LOGIC TEST 3 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT RIGHT LOGIC TEST 3 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT RIGHT LOGIC TEST 3 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SHIFT RIGHT LOGIC TEST 3 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SHIFT RIGHT LOGIC TEST 3 FLAG ZERO ERROR.");
		// TEST 4
		assign A = 4'b0110; B = 4'b0100; SELECT = 4'b1000; #10;
		assert(OUT === 4'b0000) else $error("SHIFT RIGHT LOGIC TEST 4 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT RIGHT LOGIC TEST 4 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT RIGHT LOGIC TEST 4 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SHIFT RIGHT LOGIC TEST 4 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SHIFT RIGHT LOGIC TEST 4 FLAG ZERO ERROR.");
		
		// SHIFT RIGHT ARITHMETIC
		// TEST 1
		assign A = 4'b0101; B = 4'b0001; SELECT = 4'b1001; #10;
		assert(OUT === 4'b0010) else $error("SHIFT RIGHT ARITHMETIC TEST 1 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT RIGHT ARITHMETIC TEST 1 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT RIGHT ARITHMETIC TEST 1 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SHIFT RIGHT ARITHMETIC TEST 1 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SHIFT RIGHT ARITHMETIC TEST 1 FLAG ZERO ERROR.");
		// TEST 2
		assign A = 4'b0010; B = 4'b0000; SELECT = 4'b1001; #10;
		assert(OUT === 4'b0010) else $error("SHIFT RIGHT ARITHMETIC TEST 2 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT RIGHT ARITHMETIC TEST 2 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT RIGHT ARITHMETIC TEST 2 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SHIFT RIGHT ARITHMETIC TEST 2 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SHIFT RIGHT ARITHMETIC TEST 2 FLAG ZERO ERROR.");
		// TEST 3
		assign A = 4'b1110; B = 4'b0010; SELECT = 4'b1001; #10;
		assert(OUT === 4'b1111) else $error("SHIFT RIGHT ARITHMETIC TEST 3 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT RIGHT ARITHMETIC TEST 3 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT RIGHT ARITHMETIC TEST 3 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 1) else $error("SHIFT RIGHT ARITHMETIC TEST 3 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("SHIFT RIGHT ARITHMETIC TEST 3 FLAG ZERO ERROR.");
		// TEST 4
		assign A = 4'b0110; B = 4'b0100; SELECT = 4'b1001; #10;
		assert(OUT === 4'b0000) else $error("SHIFT RIGHT ARITHMETIC TEST 4 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("SHIFT RIGHT ARITHMETIC TEST 4 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("SHIFT RIGHT ARITHMETIC TEST 4 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("SHIFT RIGHT ARITHMETIC TEST 4 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 1) else $error("SHIFT RIGHT ARITHMETIC TEST 4 FLAG ZERO ERROR.");		
		
		// OTHER SELECTOR
		// TEST 1
		assign A = 4'b0101; B = 4'b0001; SELECT = 4'b1111; #10;
		assert(OUT === 4'b0000) else $error("OTHER SELECTOR TEST 1 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("OTHER SELECTOR TEST 1 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("OTHER SELECTOR TEST 1 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("OTHER SELECTOR TEST 1 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("OTHER SELECTOR TEST 1 FLAG ZERO ERROR.");
		// TEST 2
		assign A = 4'b0010; B = 4'b0000; SELECT = 4'b1111; #10;
		assert(OUT === 4'b0000) else $error("OTHER SELECTOR TEST 2 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("OTHER SELECTOR TEST 2 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("OTHER SELECTOR TEST 2 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("OTHER SELECTOR TEST 2 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("OTHER SELECTOR TEST 2 FLAG ZERO ERROR.");
		// TEST 3
		assign A = 4'b1110; B = 4'b0010; SELECT = 4'b1111; #10;
		assert(OUT === 4'b0000) else $error("OTHER SELECTOR TEST 3 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("OTHER SELECTOR TEST 3 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("OTHER SELECTOR TEST 3 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("OTHER SELECTOR TEST 3 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("OTHER SELECTOR TEST 3 FLAG ZERO ERROR.");
		// TEST 4
		assign A = 4'b0110; B = 4'b0100; SELECT = 4'b1111; #10;
		assert(OUT === 4'b0000) else $error("OTHER SELECTOR TEST 4 OUT ERROR.");
		assert(FLAG_CARRY === 0) else $error("OTHER SELECTOR TEST 4 FLAG CARRY ERROR.");
		assert(FLAG_OVERFLOW === 0) else $error("OTHER SELECTOR TEST 4 FLAG OVERFLOW ERROR.");
		assert(FLAG_NEGATIVE === 0) else $error("OTHER SELECTOR TEST 4 FLAG NEGATIVE ERROR.");
		assert(FLAG_ZERO === 0) else $error("OTHER SELECTOR TEST 4 FLAG ZERO ERROR.");
		
	end


endmodule: testbench_ALU