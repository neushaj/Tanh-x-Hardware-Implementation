`timescale 1ns/1ns
module PartF_TB();
reg start=0,clock=0,reset=0;
reg [15:0]X;
wire [15:0]Y_M,Y_Q;
wire ready_M,ready_Q;
tanh_modelsim MUT1(X,start,clock,reset,ready_M,Y_M);
CA6_Quartus MUT2(ready_Q,start,clock,reset,X,Y_Q);
initial begin
  #10 reset=1;
  #20 reset=0;
  #20 start=1;
  #50 X=16'b 0100000000000000;
  #10 start=0;
  #3000 X=16'b 0001000100010001;
  #10 start=1;
  #50 start=0;
  #3000 X=16'b 0000010000100010;
  #10 start=1;
  #50 start=0;
  #20000 $stop;
end
initial begin
  #70 clock=1;
  repeat(800) #30 clock=~clock;
  #20 $stop;
end
endmodule