library verilog;
use verilog.vl_types.all;
entity CA6_Quartus is
    port(
        ready           : out    vl_logic;
        start           : in     vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        X               : in     vl_logic_vector(15 downto 0);
        Y               : out    vl_logic_vector(15 downto 0)
    );
end CA6_Quartus;
