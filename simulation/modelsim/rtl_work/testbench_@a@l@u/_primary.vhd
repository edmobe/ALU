library verilog;
use verilog.vl_types.all;
entity testbench_ALU is
    generic(
        nBits           : integer := 4
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of nBits : constant is 1;
end testbench_ALU;
