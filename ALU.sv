module ALU #(parameter Nbits=5) ( 
	 input  [Nbits-1:0]  A,
	 input  [Nbits-1:0]  B,
	 //input   [3:0] ALUop,
    output [Nbits-1:0] OUT
	 //output Carry_Flag,
	 //output Overflow_Flag,
	 //output Zero_Flag,
	 //output Negative_Flag
	 );
	 
	 SHIFT_LEFT_LOGIC #(Nbits) sll(A, B, OUT);
	 //OUT = SHIFT_LEFT_LOGIC;
/*
	logic Carry_OUT; 
   logic  [Nbits-1:0] sum;
	full_adder #(Nbits) f0 (A,B,ALUop[0],sum,Carry_OUT);
	
	logic  [Nbits-1:0] AND;
	AND_GATE #(Nbits) f2 (A,B,AND);
	
	logic [Nbits-1:0] OR;
	OR_GATE #(Nbits) f3 (A,B,OR);
	
	logic  [Nbits-1:0] NOT;
	NOT_GATE #(Nbits) f4 (A,NOT);
	
	logic  [Nbits-1:0] XOR;
	XOR_GATE #(Nbits) f5 (A,B,XOR);

always_comb
begin
	case (select)
		4'b0000:  op_out = Suma;
		4'b0001:  op_out = Resta;
		4'b0010:  op_out = AND;
		4'b0011:  op_out = OR;
		4'b0100:  op_out = NOT;
		4'b0101:  op_out = XOR;
		4'b0110:  op_out = SHIFT_RIGHT_LOGIC;
		4'b0111:  op_out = SHIFT_LEFT_LOGIC;
		4'b1000:  op_out = SHIFT_RIGHT_ARITHMETIC;
		4'b1001:  op_out = SHIFT_LEFT_ARITHMETIC;
		default:  op_out = 0;
		
	endcase

end
*/			
endmodule: ALU


