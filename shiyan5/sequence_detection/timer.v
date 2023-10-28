`timescale 1ns / 1ps

module timer(
	input wire clk,
    input wire rst,
    input wire button,
    output reg [3:0]num
);

reg End;
reg flag;
reg flag1;
wire rst_n = ~rst;


always @ (posedge clk or negedge rst_n) begin
    if(~rst_n || num == 4'd8)
        flag <= 1'b0;
    else if(button == 1'b1)
        flag <= 1'b1;
end

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n || button == 1'b1)
        flag1 <= 1'b0;
    else if(flag == 1'b1)
        flag1 <= 1'b1;
end

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n || button == 1'b1) begin
        num <= 4'd0;
    end
    else begin
        if(num == 4'd8) begin
            num <= num;
        end
        else if(flag1 == 1'b1)
            num <= num + 1'd1;
    end
end
endmodule