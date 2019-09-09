module ADDER_HALF(
	input A,
	input B,
	input C_IN,
	output SUM,
	output C_OUT);

	logic N1, N2, N3;
	
	GATE_XOR OP1(A, B, N1);
	GATE_AND OP2(N1, C_IN, N2);
	GATE_AND OP3(A, B, N3);
	GATE_XOR OP4(N1, C_IN, SUM);
	GATE_OR OP5(N2, N3, C_OUT);
	
endmodule: ADDER_HALF