module ALU_N #(parameter Nbits=4) ( 
	 input  [Nbits-1:0]  A,
	 input  [Nbits-1:0]  B,
	 input   [3:0] SELECT,
	 output [Nbits-1:0] OUT,
	 output FLAG_CARRY,
	 output FLAG_OVERFLOW,
	 output FLAG_NEGATIVE,
	 output FLAG_ZERO
	 );
	
	// OUTPUT VARIABLES
	logic [Nbits-1:0] ALU_OUT;
	logic ALU_FLAG_CARRY;
	logic ALU_FLAG_OVERFLOW;
	logic ALU_FLAG_NEGATIVE;
	logic ALU_FLAG_ZERO;
	
	// OUTPUT CONNECTIONS
	assign OUT = ALU_OUT;
	assign FLAG_CARRY = ALU_FLAG_CARRY;
	assign FLAG_OVERFLOW = ALU_FLAG_OVERFLOW;
	assign FLAG_NEGATIVE = ALU_FLAG_NEGATIVE;
	assign FLAG_ZERO = ALU_FLAG_ZERO;
	
	// SUM
	logic [Nbits-1:0] ALU_SUM;
	logic ALU_SUM_CARRY;
	logic ALU_SUM_ZERO;
	logic ALU_SUM_OVERFLOW;
	ADDER_FULL #Nbits ALU_ADDER_FULL(A, B, 0, ALU_SUM, ALU_SUM_CARRY, ALU_SUM_OVERFLOW);
	IS_ZERO #Nbits ALU_SUM_IS_ZERO(ALU_SUM, ALU_SUM_ZERO);
	
	// SUBTRACTION
	logic [Nbits-1:0] ALU_SUBT;
	logic [Nbits-1:0] ALU_B_COMPLEMENT;
	logic ALU_SUBT_BORROW;
	logic ALU_SUBT_ZERO;
	logic ALU_SUBT_OVERFLOW;
	GATE_NOT #Nbits GATE_NOT_COMPLEMENT(B, ALU_B_COMPLEMENT);
	ADDER_FULL #Nbits SUBTRACTION(A, ALU_B_COMPLEMENT, 1, ALU_SUBT, ALU_SUBT_BORROW, ALU_SUBT_OVERFLOW);
	IS_ZERO #Nbits ALU_SUBT_IS_ZERO(ALU_SUBT, ALU_SUBT_ZERO);
	
	// NOT
	logic [Nbits-1:0] ALU_NOT;
	GATE_NOT #Nbits NOT(A, ALU_NOT);
	
	// AND
	logic [Nbits-1:0] ALU_AND;
	GATE_AND #Nbits AND(A, B, ALU_AND);
	
	// OR
	logic [Nbits-1:0] ALU_OR;
	GATE_OR #Nbits OR(A, B, ALU_OR);
	
	// XOR
	logic [Nbits-1:0] ALU_XOR;
	GATE_XOR #Nbits XOR(A, B, ALU_XOR);
	
	// SHIFT LEFT
	logic [Nbits-1:0] ALU_SHIFT_LEFT;
	logic ALU_SL_OVERFLOW;
	logic ALU_SHIFT_LEFT_ZERO;
	SHIFT_LEFT #Nbits SHIFTING_LEFT(A, B, ALU_SHIFT_LEFT, ALU_SL_OVERFLOW);
	IS_ZERO #Nbits ALU_SHIFT_LEFT_IS_ZERO(ALU_SHIFT_LEFT, ALU_SHIFT_LEFT_ZERO);
	
	// SHIFT RIGHT LOGIC
	logic [Nbits-1:0] ALU_SHIFT_RIGHT_LOGIC;
	logic ALU_SRL_OVERFLOW;
	SHIFT_RIGHT #Nbits SHIFTING_RIGHT_LOGIC(0, A, B, ALU_SHIFT_RIGHT_LOGIC, ALU_SRL_OVERFLOW);
	
	// SHIFT RIGHT ARITHMETIC
	logic [Nbits-1:0] ALU_SHIFT_RIGHT_ARITHMETIC;
	logic ALU_SRA_OVERFLOW;
	logic ALU_SRA_ZERO;
	SHIFT_RIGHT #Nbits SHIFTING_RIGHT_ARITHMETIC(A[Nbits-1], A, B, ALU_SHIFT_RIGHT_ARITHMETIC, ALU_SRA_OVERFLOW);
	IS_ZERO #Nbits ALU_SRA_IS_ZERO(ALU_SHIFT_RIGHT_ARITHMETIC, ALU_SRA_ZERO);
	
	// ALU MUX MODELING
	always_comb	begin
		case (SELECT)
			4'b0000: // SUM
				begin
				ALU_OUT = ALU_SUM;
				ALU_FLAG_CARRY = ALU_SUM_CARRY;
				ALU_FLAG_OVERFLOW = ALU_SUM_OVERFLOW;
				ALU_FLAG_NEGATIVE = ALU_OUT[Nbits-1];
				ALU_FLAG_ZERO = ALU_SUM_ZERO;
				end
			4'b0001: // SUBTRACTION
				begin
				ALU_OUT = ALU_SUBT;
				ALU_FLAG_CARRY = 0;
				ALU_FLAG_OVERFLOW = ALU_SUBT_OVERFLOW;
				ALU_FLAG_NEGATIVE = ALU_OUT[Nbits-1];
				ALU_FLAG_ZERO = ALU_SUBT_ZERO;
				end
			4'b0010: // NOT
				begin
				ALU_OUT = ALU_NOT;
				ALU_FLAG_CARRY = 0;
				ALU_FLAG_OVERFLOW = 0;
				ALU_FLAG_NEGATIVE = 0;
				ALU_FLAG_ZERO = 0;
				end
			4'b0011: // AND
				begin
				ALU_OUT = ALU_AND;
				ALU_FLAG_CARRY = 0;
				ALU_FLAG_OVERFLOW = 0;
				ALU_FLAG_NEGATIVE = 0;
				ALU_FLAG_ZERO = 0;
				end
			4'b0100: // OR
				begin
				ALU_OUT = ALU_OR;
				ALU_FLAG_CARRY = 0;
				ALU_FLAG_OVERFLOW = 0;
				ALU_FLAG_NEGATIVE = 0;
				ALU_FLAG_ZERO = 0;
				end
			4'b0101: // XOR
				begin
				ALU_OUT = ALU_XOR;
				ALU_FLAG_CARRY = 0;
				ALU_FLAG_OVERFLOW = 0;
				ALU_FLAG_NEGATIVE = 0;
				ALU_FLAG_ZERO = 0;
				end
			4'b0110: // SHIFT LEFT LOGIC
				begin
				ALU_OUT = ALU_SHIFT_LEFT;
				ALU_FLAG_CARRY = 0;
				ALU_FLAG_OVERFLOW = 0;
				ALU_FLAG_NEGATIVE = 0;
				ALU_FLAG_ZERO = 0;
				end
			4'b0111: // SHIFT LEFT ARITHMETIC
				begin
				ALU_OUT = ALU_SHIFT_LEFT;
				ALU_FLAG_CARRY = 0;
				ALU_FLAG_OVERFLOW = ALU_SL_OVERFLOW;
				ALU_FLAG_NEGATIVE = ALU_SHIFT_LEFT[Nbits-1];
				ALU_FLAG_ZERO = ALU_SHIFT_LEFT_ZERO;
				end
			4'b1000: // SHIFT RIGHT LOGIC
				begin
				ALU_OUT = ALU_SHIFT_RIGHT_LOGIC;
				ALU_FLAG_CARRY = 0;
				ALU_FLAG_OVERFLOW = 0;
				ALU_FLAG_NEGATIVE = 0;
				ALU_FLAG_ZERO = 0;
				end
			4'b1001: // SHIFT RIGHT ARITHMETIC
				begin
				ALU_OUT = ALU_SHIFT_RIGHT_ARITHMETIC;
				ALU_FLAG_CARRY = 0;
				ALU_FLAG_OVERFLOW = ALU_SRA_OVERFLOW;
				ALU_FLAG_NEGATIVE = ALU_SHIFT_RIGHT_ARITHMETIC[Nbits-1];
				ALU_FLAG_ZERO = ALU_SRA_ZERO;
				end
			default:
				begin
				ALU_OUT = 0;
				ALU_FLAG_CARRY = 0;
				ALU_FLAG_OVERFLOW = 0;
				ALU_FLAG_NEGATIVE = 0;
				ALU_FLAG_ZERO = 0;
				end
		endcase
	end
	
endmodule: ALU_N