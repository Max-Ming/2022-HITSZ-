`timescale 1ns / 1ps

module set_num(
    input wire clk,
    input wire rst,
    input wire set_password,
    input wire test,
    input wire [3:0] num,
    input wire [4:0] current_state,
    output reg [1:0] num7,
    output reg [1:0] num6,
    output reg [1:0] num5
);

always @ (posedge clk or posedge rst) begin
    if(rst) begin
        num7 <= 2'd0;
        num6 <= 2'd0;
        num5 <= 2'd0;
    end
    else if(set_password || test) begin
        num7 <= 1'b0;
        num6 <= 1'b0;
        num5 <= 1'b0;
    end
    else if(current_state == 5'd1 || current_state == 5'd3) begin
        if(num7 == 1'b0 && (num == 2'd1 || num == 2'd2 || num == 2'd3))
            num7 <= num;
        else if(num7 != 1'b0 && num6 == 1'b0 &&(num == 2'd1 || num == 2'd2 || num == 2'd3))
            num6 <= num;
        else if(num6 != 1'b0 && num5 == 1'b0 &&(num == 2'd1 || num == 2'd2 || num == 2'd3))
            num5 <= num;
    end
end

endmodule