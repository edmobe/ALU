module MUX(
	 input A,
	 input B,
	 input SEL,
	 output OUT);
	 
	 logic N1, N2, N3;
	
	GATE_NOT NOT(SEL, N1);
	GATE_AND AND_A(N1, A, N2);
	GATE_AND AND_B(SEL, B, N3);
	GATE_OR OR(N2, N3, OUT);
 
endmodule: MUX