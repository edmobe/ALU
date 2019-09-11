library verilog;
use verilog.vl_types.all;
entity SHIFT_RIGHT is
    generic(
        Nbits           : integer := 4
    );
    port(
        ADD_MSB         : in     vl_logic;
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        \OUT\           : out    vl_logic_vector;
        OVERFLOW        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Nbits : constant is 1;
end SHIFT_RIGHT;
