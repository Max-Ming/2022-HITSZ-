`timescale 1ns / 1ps

module flowing_water_lights (
	input wire clk,
    input wire rst,
    input wire button,
    input wire [1:0]freq_set,
	output reg [7:0]led
);
wire rst_n = ~rst;
reg [25:0]cnt_01;
reg [25:0]cnt_02;
reg [25:0]cnt_05;
reg [26:0]cnt_1;
reg cnt_inc;
wire flag_01s;
wire flag_02s;
wire flag_05s;
wire flag_1s;
parameter cnt01_Max = 26'd10000000;
parameter cnt02_Max = 26'd20000000;
parameter cnt05_Max = 26'd50000000;
parameter cnt1_Max = 27'd100000000;

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) cnt_inc <= 1'b0;//按下button开始计数，按下rst停止计数
    else if(button) cnt_inc <= 1'b1;
end

    assign flag_01s = (cnt_01 == cnt01_Max - 26'd1);
    assign flag_02s = (cnt_02 == cnt02_Max - 26'd1);
    assign flag_05s = (cnt_05 == cnt05_Max - 26'd1);
    assign flag_1s = (cnt_1 == cnt1_Max - 26'd1);
    
always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) begin//按下rst计数器清零
        cnt_01 <= 26'd0;
        cnt_02 <= 26'd0;
        cnt_05 <= 26'd0;
        cnt_1 <= 27'd0;
    end
    else begin
        case(freq_set)
            2'b00:  if(flag_01s)
                        cnt_01 <= 26'd0;
                    else if(cnt_inc)
                        cnt_01 <= cnt_01 + 26'd1;
            2'b01:  if(flag_02s)
                        cnt_02 <= 26'd0;
                    else if(cnt_inc)
                        cnt_02 <= cnt_02 + 26'd1;
            2'b10:  if(flag_05s)
                        cnt_05 <= 26'd0;
                    else if(cnt_inc)
                        cnt_05 <= cnt_05 + 26'd1;
            default:  if(flag_1s)
                        cnt_1 <= 27'd0;
                    else if(cnt_inc)
                        cnt_1 <= cnt_1 + 27'd1;
        endcase
    end
end

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) led <= 8'b00000001;//按下rst复位只有第一个灯亮起
    else begin
        case(freq_set)
            2'b00:  if(flag_01s)
                        led <= {led[6:0], led[7]};
                    else
                        led <= led;
            2'b01:  if(flag_02s)
                        led <= {led[6:0], led[7]};
                    else
                        led <= led;
            2'b10:  if(flag_05s)
                        led <= {led[6:0], led[7]};
                    else
                        led <= led;
            default:  if(flag_1s)
                        led <= {led[6:0], led[7]};
                    else
                        led <= led;
        endcase
    end
end
endmodule