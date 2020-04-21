`timescale 1ns/10ps
module CS(Y, X, reset, clk);

input clk, reset; 
input 	[7:0] X;
output 	[9:0] Y;

always @(posedge clk) begin
    $display("clk:%d\n",X);
end 

always @(posedge reset) begin
    $display("reset:%d\n",X);
end 
endmodule
