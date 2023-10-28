`timescale 1ns / 1ps

module key(
input wire clk,
input wire rst,
input wire signal,
output reg key
);

parameter max_cnt = 1000000;
reg key_d1;
reg key_d2;
reg [26:0]cnt;

always@(posedge clk or posedge rst)
if(rst)
   {key_d2, key_d1} <= 2'b00;
else
   {key_d2, key_d1} <= {key_d1,signal};

always@(posedge clk or posedge rst)
if(rst)
   cnt <= 0;
else if(key_d1^key_d2)
   cnt <= 0;
else
   cnt <= cnt+1;

always@(posedge clk or posedge rst)
if(rst)
   key <= 0;
else if(cnt == max_cnt - 1)
   key <= signal;
else ;
endmodule