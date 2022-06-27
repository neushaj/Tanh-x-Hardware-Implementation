library verilog;
use verilog.vl_types.all;
entity datapath_tanh is
    port(
        xBus            : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        initz           : in     vl_logic;
        Cen             : in     vl_logic;
        Ld_term         : in     vl_logic;
        Ld_expr         : in     vl_logic;
        Ld_sqr          : in     vl_logic;
        sel_x           : in     vl_logic;
        sel_rom         : in     vl_logic;
        sel_sqr         : in     vl_logic;
        sel_term        : in     vl_logic;
        sel_a           : in     vl_logic;
        sel_pr          : in     vl_logic;
        subsel          : in     vl_logic;
        yBus            : out    vl_logic_vector(15 downto 0);
        odd_even        : out    vl_logic;
        Cout            : out    vl_logic
    );
end datapath_tanh;
