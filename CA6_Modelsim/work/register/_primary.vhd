library verilog;
use verilog.vl_types.all;
entity \register\ is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Ld              : in     vl_logic;
        data_in         : in     vl_logic_vector(15 downto 0);
        reg_out         : out    vl_logic_vector(15 downto 0)
    );
end \register\;
