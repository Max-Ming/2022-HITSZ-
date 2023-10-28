`timescale 1ns / 1ps

module counter (
	input wire clk,
    input wire rst,
    input wire button,
    input wire en1,
    input wire en0,
    input wire signal,
    output reg [3:0]num
);

reg [4:0]cnt;
reg cnt_inc;
reg sig_r0;
reg sig_r1;
wire rst_n = ~rst;
wire pos_edge;

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        cnt_inc <= 1'd0;
    end
    else if(button) begin
        cnt_inc <= 1'd1;
    end
end

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        sig_r0 <= 1'b0;
    end
    else begin
        sig_r0 <= signal;
    end
end

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        sig_r1 <= 1'b0;
    end
    else begin
        sig_r1 <= sig_r0;
    end
end

assign pos_edge = ~sig_r1 & sig_r0;

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        cnt <= 5'd0;
    end
    else begin
        if(cnt_inc) begin
            if(pos_edge) begin
                if(cnt == 5'd20)
                    cnt <= 5'd0;
                else
                    cnt <= cnt + 5'd1;
            end
            else
                cnt <= cnt;
        end
        else ;
    end
end

always @ (*) begin
    if(~en0) begin
        if(cnt < 5'd10)
            num = cnt;
        else if(cnt < 5'd20)
            num = cnt - 5'd10;
        else
            num = 0;
    end
    else if(~en1) begin
        if(cnt < 5'd10)
            num = 0;
        else if(cnt < 5'd20)
            num = 1;
        else
            num = 2;
    end
    else ;
end
endmodule