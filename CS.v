`timescale 1ns/10ps
module CS(Y, X, reset, clk);

input clk, reset; 
input [7:0] X;
output [9:0] Y;

reg [7:0] delay_X [8:0];
/*
reg [7:0] delay_X_2 = 8'b00000000;
reg [7:0] delay_X_3 = 8'b00000000;
reg [7:0] delay_X_4 = 8'b00000000;
reg [7:0] delay_X_5 = 8'b00000000;
reg [7:0] delay_X_6 = 8'b00000000;
reg [7:0] delay_X_7 = 8'b00000000;
reg [7:0] delay_X_8 = 8'b00000000;
reg [7:0] delay_X_9 = 8'b00000000;
*/
reg [11:0] sum = 12'b000000000000;
reg [8:0] avg = 9'b000000000;
reg [7:0] gap = 8'b00000000;
reg [8:0] jmp = 9'b000000000;
reg [3:0] it = 4'b0000;

always@(negedge clk) begin
    // delay 9 clk
    delay_X[8] <= X;
    delay_X[7] <= delay_X[8];
    delay_X[6] <= delay_X[7];
    delay_X[5] <= delay_X[6];
    delay_X[4] <= delay_X[5];
    delay_X[3] <= delay_X[4];
    delay_X[2] <= delay_X[3];
    delay_X[1] <= delay_X[2];
    delay_X[0] <= delay_X[1];

    $display("delay_X_1:%d\n",delay_X[0]);
    $display("delay_X_2:%d\n",delay_X[1]);
    $display("delay_X_3:%d\n",delay_X[2]);
    $display("delay_X_4:%d\n",delay_X[3]);
    $display("delay_X_5:%d\n",delay_X[4]);
    $display("delay_X_6:%d\n",delay_X[5]);
    $display("delay_X_7:%d\n",delay_X[6]);
    $display("delay_X_8:%d\n",delay_X[7]);
    $display("delay_X_9:%d\n",delay_X[8]);
    
    sum = delay_X[0]+delay_X[1];
    sum = sum + delay_X[2];
    sum = sum + delay_X[3];
    sum = sum + delay_X[4];
    sum = sum + delay_X[5];
    sum = sum + delay_X[6];
    sum = sum + delay_X[7];
    sum = sum + delay_X[8];
    avg = sum/9;
    $display("sum:%d\n",sum);
    $display("avg:%d\n",avg);
end
/*
always@ (avg) begin
    if(avg > delay_X_1) 
        jmp[0] = 1;
    if(avg > delay_X_2) 
        jmp[1] = 1;
    if(avg > delay_X_3) 
        jmp[2] = 1;
    if(avg > delay_X_4) 
        jmp[3] = 1;
    if(avg > delay_X_5) 
        jmp[4] = 1;
    if(avg > delay_X_6) 
        jmp[5] = 1;
    if(avg > delay_X_7) 
        jmp[6] = 1;
    if(avg > delay_X_8) 
        jmp[7] = 1;
    if(avg > delay_X_9) 
        jmp[8] = 1;
    
    for(it = 4'b0000; it<4'b1001; it = it+1'b1) begin
        if(jmp[it]) begin
            if(gap < (avg-delay_X_1))
    

end*/
/*
reg [9:0] r=10'b0000000000;
reg [3:0] ini_counter=4'b0000;
reg stcnt = 1'b0;
reg [7:0] del_X;
reg [9:0] sum;
reg [7:0] div_sum;

always @(negedge clk or posedge reset) begin
    del_X <= X;
    if(stcnt == 0) begin
        if(ini_counter == 0) begin
            ini_counter <= ini_counter + 1;
        end else if(ini_counter < 9) begin
            ini_counter <= ini_counter + 1;
            r <= r+X;
            $display("middle:%d\n",r);
        end else if(ini_counter == 9) begin
            sum <= r;
            $display("Y:%d\n",r);
            r <= r-del_X;
            stcnt = 1'b1;
        end
    end else begin
        r <= r+X;
        div_sum <= sum/9;
        $display("div_sum:%d\n",div_sum);
    end
*/
endmodule