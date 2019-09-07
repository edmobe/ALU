library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        Nbits           : integer := 5
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        \OUT\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Nbits : constant is 1;
end ALU;
