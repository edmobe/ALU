module testbench_SHIFT_RIGHT();
	logic TYPE;
	logic [7:0] A;
	logic [7:0] B;
	wire [7:0] OUT;
	
	SHIFT_RIGHT #8 SHIFT_RIGHT_test(TYPE, A, B, OUT);

	initial
		begin	
		#10 assign TYPE = 0; A = 8'b00001011; B = 8'b00000001;
		#10 assign TYPE = 0; A = 8'b00101011; B = 8'b00000011;
		#10 assign TYPE = 0; A = 8'b01000101; B = 8'b00000101; 
		#10 assign TYPE = 0; A = 8'b10001011; B = 8'b00100101;
		#10 assign TYPE = 1; A = 8'b00001011; B = 8'b00000001;
		#10 assign TYPE = 1; A = 8'b00101011; B = 8'b00000011;
		#10 assign TYPE = 1; A = 8'b01000101; B = 8'b00000101; 
		#10 assign TYPE = 1; A = 8'b10001011; B = 8'b00100101;
	end


endmodule: testbench_SHIFT_RIGHT