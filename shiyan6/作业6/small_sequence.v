`timescale 1ns / 1ps

module small_sequence(
    input wire clk,
    input wire rst,
    input wire [4:0]big_current_state,
    input wire [1:0]num7,
    input wire [1:0]num6,
    input wire [1:0]num5,
    input wire test,
    output reg gled1,
    output reg rled0,
    output reg rled1,
    output reg rled2
);

reg[1:0] num_7;
reg[1:0] num_6;
reg[1:0] num_5;//密码
reg[3:0] cnt;
reg [4:0]current_state;
reg [4:0]next_state;
reg flag;
parameter S1 = 5'd1;//设置密码即输入将要设置的密码
parameter S2 = 5'd2;//确认设置密码
parameter S3 = 5'd3;//验证密码即输入将要验证的密码
parameter S4 = 5'd4;//状态机验证
parameter IDLE = 5'd4;
parameter s0 = 5'd0;
parameter s1 = 5'd1;
parameter s2 = 5'd2;
parameter s3 = 5'd3;

always @ (posedge clk or posedge rst) begin
    if(rst) begin
        gled1 <= 1'b0;
        rled0 <= 1'b0;
        rled1 <= 1'b0;
        rled2 <= 1'b0;
        flag <= 1'b0;
        end
    else if(big_current_state == S1) begin
        gled1 <= 1'b0;
        rled0 <= 1'b0;
        rled1 <= 1'b0;
        rled2 <= 1'b0;
        end
    else if(big_current_state == S3) begin
        flag <= 1'b0;
    end
    else if(current_state == s3) begin
        gled1 <= 1'b1;
        rled0 <= 1'b0;
        rled1 <= 1'b0;
        rled2 <= 1'b0;
    end
    else if(cnt == 4'd10 && current_state != s3 && rled0 == 1'b0 && flag == 1'b0) begin
        rled0 <= 1'b1;
        flag <= 1'b1;
    end
    else if(cnt == 4'd10 && current_state != s3 && rled0 == 1'b1 && rled1 == 1'b0 && flag == 1'b0) begin
        rled1 <= 1'b1;
        flag <= 1'b1;
    end
    else if(cnt == 4'd10 && current_state != s3 && rled0 == 1'b1 && rled1 == 1'b1 && rled2 == 1'b0 && flag == 1'b0) begin
        rled2 <= 1'b1;
        flag <= 1'b1;
    end
end

always @ (posedge clk or posedge rst) begin
    if(rst) begin
        num_7 <= 1'b0;
        num_6 <= 1'b0;
        num_5 <= 1'b0;
        end
    else if(big_current_state == S2 && test == 1'b0) begin
        num_7 <= num7;
        num_6 <= num6;
        num_5 <= num5;
        end
end

always @ (posedge clk or posedge rst) begin
    if(rst)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

always @ (posedge clk or posedge rst) begin
    if(rst)
        next_state <= s0;
    else if(big_current_state == S1 || big_current_state == S3)
        next_state <= s0;
    else if(big_current_state == S4)
        case(current_state)
            s0: if(num7 == num_7)
                    next_state <= s1;
                else ;
            s1: if(num6 == num_6)
                    next_state <= s2;
                else ;
            s2: if(num5 == num_5)
                    next_state <= s3;
                else ;
            default: ;
        endcase
end

always @ (posedge clk or posedge rst) begin
    if(rst)
        cnt <= 1'b0;
    else if(big_current_state == S3)
        cnt <= 1'b0;
    else if(big_current_state == S4 && cnt < 4'd10)
        cnt <= cnt + 1'b1;
end

endmodule