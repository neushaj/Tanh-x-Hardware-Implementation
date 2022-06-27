library verilog;
use verilog.vl_types.all;
entity MUX_2inputs is
    port(
        sel1            : in     vl_logic;
        sel2            : in     vl_logic;
        data_1          : in     vl_logic_vector(15 downto 0);
        data_2          : in     vl_logic_vector(15 downto 0);
        data_out        : out    vl_logic_vector(15 downto 0)
    );
end MUX_2inputs;
