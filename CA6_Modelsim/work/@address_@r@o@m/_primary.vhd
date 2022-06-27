library verilog;
use verilog.vl_types.all;
entity Address_ROM is
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        initz           : in     vl_logic;
        Cen             : in     vl_logic;
        Cout            : out    vl_logic;
        odd_even        : out    vl_logic;
        address         : out    vl_logic_vector(2 downto 0)
    );
end Address_ROM;
