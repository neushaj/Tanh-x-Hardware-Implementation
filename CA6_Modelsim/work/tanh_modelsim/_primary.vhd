library verilog;
use verilog.vl_types.all;
entity tanh_modelsim is
    port(
        X               : in     vl_logic_vector(15 downto 0);
        start           : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ready           : out    vl_logic;
        Y               : out    vl_logic_vector(15 downto 0)
    );
end tanh_modelsim;
