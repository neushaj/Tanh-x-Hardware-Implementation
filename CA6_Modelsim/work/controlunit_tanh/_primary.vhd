library verilog;
use verilog.vl_types.all;
entity controlunit_tanh is
    port(
        start           : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        odd_even        : in     vl_logic;
        Cout            : in     vl_logic;
        initz           : out    vl_logic;
        Cen             : out    vl_logic;
        Ld_term         : out    vl_logic;
        Ld_expr         : out    vl_logic;
        Ld_sqr          : out    vl_logic;
        sel_x           : out    vl_logic;
        sel_rom         : out    vl_logic;
        sel_sqr         : out    vl_logic;
        sel_term        : out    vl_logic;
        sel_a           : out    vl_logic;
        sel_pr          : out    vl_logic;
        subsel          : out    vl_logic;
        ready           : out    vl_logic
    );
end controlunit_tanh;
