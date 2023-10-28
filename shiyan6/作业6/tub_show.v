`timescale 1ns / 1ps

module tub_show(
    input wire clk,
    input wire rst,
    input wire [1:0] num7,
    input wire [1:0] num6,
    input wire [1:0] num5,
    input wire flag0,
    input wire flagf,
    output wire [7:0] led_en,
    output reg led_ca,
    output reg led_cb,
    output reg led_cc,
    output reg led_cd,
    output reg led_ce,
    output reg led_cf,
    output reg led_cg,
    output reg led_dp
);

always @ (posedge clk) begin
    if(flag0 == 1'b1) begin
        led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 0;led_ce <= 0;led_cf <= 0;led_cg <= 1;led_dp <= 1;
    end
    else if(flagf == 1'b1) begin
        led_ca <= 0;led_cb <= 1;led_cc <= 1;led_cd <= 1;led_ce <= 0;led_cf <= 0;led_cg <= 0;led_dp <= 1;
    end
    else begin
        if(~led_en[7]) begin
            if(num7 == 2'd0) begin
                led_ca <= 1;led_cb <= 1;led_cc <= 1;led_cd <= 1;led_ce <= 1;led_cf <= 1;led_cg <= 1;led_dp <= 1;
            end
            else if(num7 == 2'd1) begin
                led_ca <= 1;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 1;led_cf <= 1;led_cg <= 1;led_dp <= 1;
            end
            else if(num7 == 2'd2) begin
                led_ca <= 0;led_cb <= 0;led_cc <= 1;led_cd <= 0;led_ce <= 0;led_cf <= 1;led_cg <= 0;led_dp <= 1;
            end
            else if(num7 == 2'd3) begin
                led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 0;led_ce <= 1;led_cf <= 1;led_cg <= 0;led_dp <= 1;
            end
        end
        else if(~led_en[6]) begin
            if(num6 == 2'd0) begin
                led_ca <= 1;led_cb <= 1;led_cc <= 1;led_cd <= 1;led_ce <= 1;led_cf <= 1;led_cg <= 1;led_dp <= 1;
            end
            else if(num6 == 2'd1) begin
                led_ca <= 1;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 1;led_cf <= 1;led_cg <= 1;led_dp <= 1;
            end
            else if(num6 == 2'd2) begin
                led_ca <= 0;led_cb <= 0;led_cc <= 1;led_cd <= 0;led_ce <= 0;led_cf <= 1;led_cg <= 0;led_dp <= 1;
            end
            else if(num6 == 2'd3) begin
                led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 0;led_ce <= 1;led_cf <= 1;led_cg <= 0;led_dp <= 1;
            end
        end
        else if(~led_en[5]) begin
            if(num5 == 2'd0) begin
                led_ca <= 1;led_cb <= 1;led_cc <= 1;led_cd <= 1;led_ce <= 1;led_cf <= 1;led_cg <= 1;led_dp <= 1;
            end
            else if(num5 == 2'd1) begin
                led_ca <= 1;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 1;led_cf <= 1;led_cg <= 1;led_dp <= 1;
            end
            else if(num5 == 2'd2) begin
                led_ca <= 0;led_cb <= 0;led_cc <= 1;led_cd <= 0;led_ce <= 0;led_cf <= 1;led_cg <= 0;led_dp <= 1;
            end
            else if(num5 == 2'd3) begin
                led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 0;led_ce <= 1;led_cf <= 1;led_cg <= 0;led_dp <= 1;
            end
        end
        else begin
            led_ca <= 1;led_cb <= 1;led_cc <= 1;led_cd <= 1;led_ce <= 1;led_cf <= 1;led_cg <= 1;led_dp <= 1;
        end
    end
end

timer u_timer(
    .clk(clk),
    .rst(rst),
    .led_en(led_en)
);

endmodule