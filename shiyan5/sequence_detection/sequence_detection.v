`timescale 1ns / 1ps

module sequence_detection(
	input wire clk,
    input wire rst,
    input wire button,
    input wire[7:0] switch,
    output reg led
);

parameter IDLE = 5'd6;
parameter S0 = 5'd0;
parameter S1 = 5'd1;
parameter S2 = 5'd2;
parameter S3 = 5'd3;
parameter S4 = 5'd4;
parameter S5 = 5'd5;

wire [3:0] num;
wire rst_n = ~rst;
reg [4:0]current_state;
reg [4:0]next_state;
reg input_seq;
reg flag;
reg flag1;
reg End;

always @ (*) begin
    case(num)
        3'd0 : if(flag1 == 1'b0)
                    input_seq = switch[0];
               else if(flag1 == 1'b1)
                    input_seq = switch[1];
        3'd1 : input_seq = switch[2];
        3'd2 : input_seq = switch[3];
        3'd3 : input_seq = switch[4];
        3'd4 : input_seq = switch[5];
        3'd5 : input_seq = switch[6];
        3'd6 : input_seq = switch[7];
        3'd7 : input_seq = switch[7];
        default : ;
    endcase
end

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n || button == 1'b1)
        End <= 1'b0;
    else if(num == 4'd6)
        End <= 1'b1;
end

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
    if(~rst_n)
        current_state <= IDLE;
    else if(num == 4'd8)
        current_state <= current_state;
    else if(flag == 1'b1)
        current_state <= next_state;
end

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n)
        next_state <= IDLE;
    else if(button == 1'b1)
        next_state <= S0;
    else if(flag == 1'b1)begin
        case(next_state)
            S0 : if(input_seq == 1'b1)
                    next_state <= S0;
                else if(input_seq == 1'b0)
                    next_state <= S1;
            S1 : if(input_seq == 1'b1)
                    next_state <= S2;
                else if(input_seq == 1'b0)
                    next_state <= S1;
            S2 : if(input_seq == 1'b1)
                    next_state <= S0;
                else if(input_seq == 1'b0)
                    next_state <= S3;
            S3 : if(input_seq == 1'b1)
                    next_state <= S4;
                else if(input_seq == 1'b0)
                    next_state <= S1;
            S4 : if(input_seq == 1'b1)
                    next_state <= S5;
                else if(input_seq == 1'b0)
                    next_state <= S3;
            S5 : if(input_seq == 1'b1)
                    next_state <= S0;
                else if(input_seq == 1'b0)
                    next_state <= S1;
        endcase
    end
end

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n || button == 1'b1)
        led <= 1'b0;
    else
        if(current_state == S5)
            led <= 1'b1;
        else;
end

timer u_timer(
    .clk(clk),
    .rst(rst),
    .button(button),
    .num(num)
);
endmodule