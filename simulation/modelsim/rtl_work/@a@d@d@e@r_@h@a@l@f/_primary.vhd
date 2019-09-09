library verilog;
use verilog.vl_types.all;
entity ADDER_HALF is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        C_IN            : in     vl_logic;
        SUM             : out    vl_logic;
        C_OUT           : out    vl_logic
    );
end ADDER_HALF;
