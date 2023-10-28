`timescale 1ns / 1ps

module timer(
	input wire clk,
    input wire rst,
    input wire button,
    input wire en1,
    input wire en0,
    output reg [3:0]num
);

reg [25:0]cnt_02;
reg [5:0]cnt;
reg cnt_inc;
wire flag_02s;
wire rst_n = ~rst;

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        cnt_inc <= 1'b0;
    end
    else if(button) cnt_inc <= 1'b1;
end

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        cnt_02 <= 26'd0;
    end
    else begin
        if(flag_02s)
            cnt_02 <= 26'd0;
        else if(cnt_inc)
            cnt_02 <= cnt_02 + 26'd1;
    end
end

parameter cnt02_Max = 26'd20000000;
assign flag_02s = (cnt_02 == cnt02_Max - 26'd1);

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) cnt <= 6'd0;
    else begin
            if(flag_02s)
                if(cnt == 6'd32)
                    cnt <= 6'd0;
                else
                    cnt <= cnt + 6'd1;
            else
                cnt <= cnt;
    end
end

always @ (*) begin
    if(~en0) begin
        if(cnt < 6'd10)
            num = cnt;
        else if(cnt < 6'd20)
            num = cnt - 6'd10;
        else if(cnt < 6'd30)
            num = cnt - 6'd20;
        else
            num = cnt - 6'd30;
    end
    else if(~en1) begin
        if(cnt < 6'd10)
            num = 0;
        else if(cnt < 6'd20)
            num = 1;
        else if(cnt < 6'd30)
            num = 2;
        else
            num = 3;
    end
    else ;
end
endmodule