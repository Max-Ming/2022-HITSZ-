`timescale 1ns / 1ps

module timer(
	input wire clk,
    input wire rst,
    output reg [7:0]led_en
);

reg [25:0]cnt_2ms;
wire flag_2ms;
parameter cnt2ms_Max = 26'd200000;
assign flag_2ms = (cnt_2ms == cnt2ms_Max - 26'd1);

always @ (posedge clk or posedge rst) begin
    if(rst) begin
        cnt_2ms <= 26'd0;
    end
    else begin
        if(flag_2ms)
            cnt_2ms <= 26'd0;
        else
            cnt_2ms <= cnt_2ms + 26'd1;
    end
end

always @ (posedge clk or posedge rst) begin
    if(rst) led_en <= 8'b11111110;
    else begin
        if(flag_2ms)
            led_en <= {led_en[6:0], led_en[7]};
        else
            led_en <= led_en;
    end
end

endmodule