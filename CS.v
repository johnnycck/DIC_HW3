`timescale 1ns/10ps
module CS(Y, X, reset, clk);

parameter n = 9;

input clk, reset; 
input [7:0] X;
output 	reg [9:0] Y;

reg r[9:0];
reg [3:0] counter=4'b0000;
reg [7:0] Xin;

always @(posedge clk or posedge reset) begin
    if(counter == 0) begin
        Xin <= X;
    end else if(counter < 9) begin
        counter = counter + 1;
        r <= r+Xin;
        $display("%b\n",r);
    end else if(counter == 9) begin
        $display("Y:%b\n",r);
        r <= 10'b0000000000;
        counter = 0;
    end
end 

endmodule