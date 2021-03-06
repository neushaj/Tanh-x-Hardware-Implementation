`timescale 1ns/1ns
module controlunit_tanh(input start,clk, rst,odd_even, Cout,output reg sel_sqr,sel_rom, sel_term,initz,
Cen,Ld_sqr,sel_x,Ld_term,sel_pr,sel_a,subsel,Ld_expr,ready);
 reg [2:0] ps,ns;
always@(posedge clk, posedge rst)
 if(rst) ps<= 3'b0;
 else ps<=ns;
always@(ps,start,Cout)begin
ns=3'b0;
case(ps)
  0:ns=(start==1)?3'b001:3'b0;
  1:ns=3'b010;
  2:ns=3'b011;
  3:ns=3'b100;
  4:ns=(Cout==1)?3'b0:3'b010;
  default:ns=3'b0;
endcase
end
always@(ps,odd_even)begin
{initz,Cen,Ld_term, Ld_expr, Ld_sqr,sel_x, sel_rom,
 sel_sqr, sel_term, sel_a, sel_pr,subsel,ready}=13'b0;
 case(ps)
   0:ready=1;
   1:{Ld_sqr,sel_x,Ld_term,Ld_expr,initz}=5'b11111;
   2:{sel_sqr,sel_term,sel_pr,Ld_term}=4'b1111;
   3:{Ld_term,sel_pr,sel_rom,sel_term}=4'b1111;
   4:begin {Ld_expr,sel_a,Cen}=3'b111; subsel=(odd_even==1)?1'b0:1'b1;end
   default:{initz,Cen,Ld_term, Ld_expr, Ld_sqr,sel_x, sel_rom,
 sel_sqr, sel_term, sel_a, sel_pr,subsel,ready}=13'b0;
 endcase
 end
endmodule
