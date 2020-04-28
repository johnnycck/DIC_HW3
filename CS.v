`timescale 1ns/10ps
module CS(Y, X, reset, clk);

input clk, reset; 
input [7:0] X;
output reg [9:0] Y;

reg [7:0] delay_X [9:0];
reg [11:0] sum = 12'b000000000000;
reg [8:0] avg = 9'b000000000;
reg [7:0] gap;
reg [8:0] jmp = 9'b000000000;
reg [3:0] it = 4'b0000;
reg [11:0] avg_close_sum = 12'b000000000000;

reg [3:0]index;
always@(negedge clk) begin
    // delay 9 clk
    gap <= 0;
    delay_X[8] <= X;
    delay_X[7] <= delay_X[8];
    delay_X[6] <= delay_X[7];
    delay_X[5] <= delay_X[6];
    delay_X[4] <= delay_X[5];
    delay_X[3] <= delay_X[4];
    delay_X[2] <= delay_X[3];
    delay_X[1] <= delay_X[2];
    delay_X[0] <= delay_X[1];
    gap <= delay_X[3];
end

always@ (gap) begin
    sum = delay_X[0]+delay_X[1];
    sum = sum + delay_X[2];
    sum = sum + delay_X[3];
    sum = sum + delay_X[4];
    sum = sum + delay_X[5];
    sum = sum + delay_X[6];
    sum = sum + delay_X[7];
    sum = sum + delay_X[8];
    avg = sum/9;
    for(it = 4'b0000; it<4'b1001; it = it+1'b1) begin
        if(avg >= delay_X[it]) 
            jmp[it] = 1;
        else 
            jmp[it] = 0;
    end
    gap = 8'b11111111;
    for(it = 4'b0000; it<4'b1001; it = it+1'b1) begin
        if(jmp[it]) begin
            if((avg - delay_X[it]) < gap) begin
                gap = avg - delay_X[it];
                index = it;
            end else
                gap = gap;
        end
    end
    avg_close_sum = delay_X[index] * 9;
    sum = sum + avg_close_sum;
    sum = sum/8;
    Y = sum;
end
endmodule