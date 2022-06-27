`timescale 1ns/1ns
module datapath_tanh(input [15:0] xBus,
                     input clk, rst, initz, Cen, Ld_term,
                     Ld_expr, Ld_sqr,sel_x, sel_rom, sel_sqr,
                     sel_term, sel_a, sel_pr, subsel,
                     output [15:0] yBus, output odd_even, Cout);

    reg [2:0] address;
    reg [15:0] term,expr,sqr;
    wire [15:0] MA,MB,Add_r,Product_bus,expr_bus,term_bus,Rom_out;
    wire [31:0] Product_r;

    assign Add_r = subsel ? term-expr : term+expr;
    assign Product_r= MA * MB;
    assign Product_bus=Product_r[30:15];
    assign yBus=expr;

    assign MA = sel_x ? xBus : sel_rom ? Rom_out:sel_sqr? sqr:16'b 0;
    assign MB = sel_x ? xBus : sel_term ? term : 16'b 0;

    assign expr_bus = sel_x ? xBus : sel_a ? Add_r : 16'b 0;
    assign term_bus = sel_x ? xBus : sel_pr ? Product_bus : 16'b 0;

    assign Rom_out= (address==0)? 16'b 0010101010101010:
                    (address==1)? 16'b 0011001100110011:
                    (address==2)? 16'b 0011001111001111:
                    (address==3)? 16'b 0011001111011110:
                    (address==4)? 16'b 0011001111100000:
                    (address==5)? 16'b 0011001111100000:
                    (address==6)? 16'b 0011001111100000:
                    (address==7)? 16'b 0011001111100000: 16'b 0;

    assign Cout=&{address};
    assign odd_even=address[0];

    always@(posedge clk, posedge rst)
        if(rst) address<=3'b0;
        else if(initz) address<=3'b0;
        else if(Cen) address<=address+1;

    always@(posedge clk, posedge rst)
        if(rst) term<=16'b0;
        else if(Ld_term) term<=term_bus;

    always@(posedge clk, posedge rst) 
        if(rst) expr<=16'b0;
        else if(Ld_expr) expr<=expr_bus;

    always@(posedge clk, posedge rst)
        if(rst) sqr<=16'b0;
        else if(Ld_sqr) sqr<=Product_bus;
        
endmodule
