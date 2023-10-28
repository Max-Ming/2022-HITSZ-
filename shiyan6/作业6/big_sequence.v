`timescale 1ns / 1ps

module big_sequence(
    input wire clk,
    input wire rst,//S1按键复位
    input wire set_password,//S2按键设置密码
    input wire enter,//S5按键确认
    input wire test,//S3按键验证密码
    input wire gled1,
    input wire rled2,
    output reg flag0,
    output reg flagf,
    output reg gled0,
    output reg [4:0] current_state
);

parameter IDLE = 5'd7;
parameter S0 = 5'd0;//未设置密码
parameter S1 = 5'd1;//设置密码即输入将要设置的密码
parameter S2 = 5'd2;//确认设置密码
parameter S3 = 5'd3;//验证密码即输入将要验证的密码
parameter S4 = 5'd4;//状态机验证
parameter S5 = 5'd5;//解锁状态
parameter S6 = 5'd6;//密码锁锁住
reg [4:0]next_state;

always @ (posedge clk or posedge rst) begin
    if(rst)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

always @ (posedge clk or posedge rst) begin
    if(rst)
        next_state <= S0;
    else
        case(current_state)
            S0: if(set_password == 1'b1)
                    next_state <= S1;
                else ;
            S1: if(enter == 1'b1)
                    next_state <= S2;
                else ;
            S2: if(test == 1'b1)
                    next_state <= S3;
                else ;
            S3: if(enter == 1'b1)
                    next_state <= S4;
                else ;
            S4: if(gled1 == 1'b1)
                    next_state <= S5;
                else if(rled2 == 1'b1)
                    next_state <= S6;
                else if(test == 1'b1)
                    next_state <= S3;
            S5: if(set_password == 1'b1)
                    next_state <= S1;
                else ;
            S6: ;
            default: ;
        endcase
end

always @ (posedge clk) begin
        case(current_state)
            S0: begin
                flag0 <= 1'b1;
                flagf <= 1'b0;
                gled0 <= 1'b0;
                end
            S1: begin
                flag0 <= 1'b0;
                gled0 <= 1'b0;
                end
            S2: begin
                flag0 <= 1'b1;
                gled0 <= 1'b1;
                end
            S3: begin
                flag0 <= 1'b0;
                end
            S4: begin
                flag0 <= 1'b1;
                end
            S5: begin
                flag0 <= 1'b1;
                end
            S6: begin
                flag0 <= 1'b0;
                flagf <= 1'b1;
                end
            default ;
        endcase
end

endmodule