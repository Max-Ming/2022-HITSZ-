`timescale 1ns / 1ps

module tub_show(
	input wire clk,
    input wire rst,
    input wire button,
    output reg [7:0]led_en
);

reg [25:0]cnt_2ms;
reg cnt_inc;
wire flag_2ms;
wire rst_n = ~rst;
parameter cnt2ms_Max = 26'd200000;
assign flag_2ms = (cnt_2ms == cnt2ms_Max - 26'd1);

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) begin 
        cnt_inc <= 1'b0;
    end
    else if(button) begin
        cnt_inc <= 1'b1;
    end
    else ;
end

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        cnt_2ms <= 26'd0;
    end
    else begin
        if(flag_2ms)
            cnt_2ms <= 26'd0;
        else if(cnt_inc)
            cnt_2ms <= cnt_2ms + 26'd1;
    end
end

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) led_en <= 8'b11111110;
    else begin
        if(flag_2ms)
            led_en <= {led_en[6:0], led_en[7]};
        else
            led_en <= led_en;
    end
end



endmodule