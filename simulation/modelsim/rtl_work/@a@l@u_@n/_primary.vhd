library verilog;
use verilog.vl_types.all;
entity ALU_N is
    generic(
        Nbits           : integer := 4
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        \SELECT\        : in     vl_logic_vector(3 downto 0);
        \OUT\           : out    vl_logic_vector;
        FLAG_CARRY      : out    vl_logic;
        FLAG_OVERFLOW   : out    vl_logic;
        FLAG_NEGATIVE   : out    vl_logic;
        FLAG_ZERO       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Nbits : constant is 1;
end ALU_N;
