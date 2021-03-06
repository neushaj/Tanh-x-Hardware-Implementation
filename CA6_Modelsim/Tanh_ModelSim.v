`timescale 1ns/1ns
module tanh_modelsim(input [15:0] X, input start, clk, rst,
                     output ready, output [15:0] Y);

    wire initz,Cen, Ld_term, Ld_expr, Ld_sqr,sel_x;
    wire sel_rom, sel_sqr, sel_term, sel_a, sel_pr,subsel;
    wire odd_even, Cout;

    datapath_tanh I1(.xBus(X),.clk(clk),.rst(rst),.initz(initz),
    .Cen(Cen),.Ld_term(Ld_term), .Ld_expr(Ld_expr), .Ld_sqr(Ld_sqr),.sel_x(sel_x),
    .sel_rom(sel_rom),.sel_sqr(sel_sqr),
    .sel_term(sel_term),.sel_a(sel_a),.sel_pr(sel_pr),
    .subsel(subsel),.yBus(Y),.odd_even(odd_even),.Cout(Cout));

    controlunit_tanh I2(.start(start),.clk(clk),.rst(rst),.odd_even(odd_even),.Cout(Cout),
    .initz(initz),.Cen(Cen),.Ld_term(Ld_term), .Ld_expr(Ld_expr),.Ld_sqr(Ld_sqr),.sel_x(sel_x), 
    .sel_rom(sel_rom),.sel_sqr(sel_sqr),.sel_term(sel_term),.sel_a(sel_a),.sel_pr(sel_pr),
    .subsel(subsel),.ready(ready));
    
endmodule