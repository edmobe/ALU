library verilog;
use verilog.vl_types.all;
entity IS_ZERO is
    generic(
        Nbits           : integer := 4
    );
    port(
        A               : in     vl_logic_vector;
        FLAG_ZERO       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Nbits : constant is 1;
end IS_ZERO;
