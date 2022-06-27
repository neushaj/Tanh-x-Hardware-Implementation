`timescale 1ns/1ns
module Address_ROM(input rst,clk,initz,Cen,output Cout,odd_even,output reg [2:0]address);
assign Cout=&{address};
assign odd_even=address[0];
always@(posedge clk, posedge rst)
 if(rst) address<=3'b0;
 else if(initz) address<=3'b0;
 else if(Cen) address<=address+1;
 endmodule
 
 module adder(input [15:0]A,B,input sub_sel,output [15:0] R);
assign R = sub_sel ? A-B : A+B;
endmodule

module multiplier(input [15:0]A,B,output [15:0] Product_bus);
wire [31:0] Product_result;
assign Product_result= A * B;
assign Product_bus=Product_result[30:15];
endmodule

module register(input clk,rst,Ld,input [15:0] data_in,output reg [15:0] reg_out);
always@(posedge clk, posedge rst)
 if(rst) reg_out<=16'b0;
 else if(Ld) reg_out<=data_in;
endmodule
 module MUX_2inputs(input sel1,sel2,input[15:0] data_1,data_2,output [15:0] data_out);
   assign data_out= (sel1==1)? data_1:(sel2==1)? data_2:16'b 0;
 endmodule
 
 module MUX_3inputs(input sel1,sel2,sel3,input[15:0] data_1,data_2,data_3,output [15:0] data_out);
   assign data_out= (sel1==1)? data_1:(sel2==1)? data_2:(sel3==1)?data_3:16'b 0;
 endmodule 
