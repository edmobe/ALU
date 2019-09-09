module testebench_MUX();
	logic A;
	logic B;
	logic SEL;
	logic OUT;
	
	MUX MUX_TEST(A, B, SEL, OUT);

	initial
		begin	
		#10 assign A = 0; B = 0; SEL = 0;
		#10 assign A = 0; B = 0; SEL = 1;
		#10 assign A = 0; B = 1; SEL = 0;
		#10 assign A = 0; B = 1; SEL = 1;
		#10 assign A = 0; B = 0; SEL = 0;
		#10 assign A = 0; B = 0; SEL = 1;
		#10 assign A = 0; B = 1; SEL = 0;
		#10 assign A = 0; B = 1; SEL = 1;
		#10 assign A = 1; B = 0; SEL = 0;
		#10 assign A = 1; B = 0; SEL = 1;
		#10 assign A = 1; B = 1; SEL = 0;
		#10 assign A = 1; B = 1; SEL = 1;
		#10 assign A = 1; B = 0; SEL = 0;
		#10 assign A = 1; B = 0; SEL = 1;
		#10 assign A = 1; B = 1; SEL = 0;
		#10 assign A = 1; B = 1; SEL = 1;
	end

endmodule: testebench_MUX