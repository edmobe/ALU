library verilog;
use verilog.vl_types.all;
entity ADDER_FULL is
    generic(
        Nbits           : integer := 4
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        C_IN            : in     vl_logic;
        SUM             : out    vl_logic_vector;
        C_OUT           : out    vl_logic;
        OVERFLOW        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Nbits : constant is 1;
end ADDER_FULL;
