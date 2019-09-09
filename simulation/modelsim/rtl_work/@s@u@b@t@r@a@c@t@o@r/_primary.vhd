library verilog;
use verilog.vl_types.all;
entity SUBTRACTOR is
    generic(
        Nbits           : integer := 4
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        DIFF            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Nbits : constant is 1;
end SUBTRACTOR;
