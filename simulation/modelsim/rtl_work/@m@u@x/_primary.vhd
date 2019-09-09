library verilog;
use verilog.vl_types.all;
entity MUX is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        SEL             : in     vl_logic;
        \OUT\           : out    vl_logic
    );
end MUX;
