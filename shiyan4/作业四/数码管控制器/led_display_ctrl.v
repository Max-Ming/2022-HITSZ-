`timescale 1ns / 1ps

module led_display_ctrl(
	input wire clk,
    input wire rst,
    input wire button,
    input wire signal,
    output wire [7:0]led_en,
    output reg led_ca,
    output reg led_cb,
    output reg led_cc,
    output reg led_cd,
    output reg led_ce,
    output reg led_cf,
    output reg led_cg,
    output reg led_dp
);

wire rst_n = ~rst;
wire [3:0]num1;
wire [3:0]num2; 
wire key;
reg [3:0]num;
reg [1:0]class;
reg [1:0]student_ID;

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        class[1] <= 1'd0;
        class[0] <= 1'd0;
        student_ID[1] <= 1'd0;
        student_ID[0] <= 1'd0;
    end
    else if(button) begin
        class[1] <= 1'd1;
        class[0] <= 1'd1;
        student_ID[1] <= 1'd1;
        student_ID[0] <= 1'd1;
    end
    else ;
end

always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 0;led_ce <= 0;led_cf <= 0;led_cg <= 1;led_dp <= 1;
    end
    else begin
    if(~led_en[3] && class[1]) begin
        led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 0;led_ce <= 0;led_cf <= 0;led_cg <= 1;led_dp <= 1;
    end
    else if(~led_en[2] && class[0]) begin
        led_ca <= 0;led_cb <= 1;led_cc <= 0;led_cd <= 0;led_ce <= 0;led_cf <= 0;led_cg <= 0;led_dp <= 1;
    end
    else if(~led_en[1] && student_ID[1]) begin
        led_ca <= 1;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 1;led_cf <= 1;led_cg <= 1;led_dp <= 1;
    end
    else if(~led_en[0] && student_ID[0]) begin
        led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 1;led_cf <= 1;led_cg <= 1;led_dp <= 1;
    end
    else if(~led_en[7] || ~led_en[6]) begin
        if(num1 == 4'h0) begin
            led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 0;led_ce <= 0;led_cf <= 0;led_cg <= 1;led_dp <= 1;
        end
        else if(num1 == 4'h1) begin
            led_ca <= 1;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 1;led_cf <= 1;led_cg <= 1;led_dp <= 1;
        end
        else if(num1 == 4'h2) begin
            led_ca <= 0;led_cb <= 0;led_cc <= 1;led_cd <= 0;led_ce <= 0;led_cf <= 1;led_cg <= 0;led_dp <= 1;
        end
        else if(num1 == 4'h3) begin
            led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 0;led_ce <= 1;led_cf <= 1;led_cg <= 0;led_dp <= 1;
        end
        else if(num1 == 4'h4) begin
            led_ca <= 1;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 1;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num1 == 4'h5) begin
            led_ca <= 0;led_cb <= 1;led_cc <= 0;led_cd <= 0;led_ce <= 1;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num1 == 4'h6) begin
            led_ca <= 0;led_cb <= 1;led_cc <= 0;led_cd <= 0;led_ce <= 0;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num1 == 4'h7) begin
            led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 1;led_cf <= 1;led_cg <= 1;led_dp <= 1;
        end
        else if(num1 == 4'h8) begin
            led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 0;led_ce <= 0;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num1 == 4'h9) begin
            led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 1;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num1 == 4'ha) begin
            led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 0;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num1 == 4'hb) begin
            led_ca <= 1;led_cb <= 1;led_cc <= 0;led_cd <= 0;led_ce <= 0;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num1 == 4'hc) begin
            led_ca <= 1;led_cb <= 1;led_cc <= 1;led_cd <= 0;led_ce <= 0;led_cf <= 1;led_cg <= 0;led_dp <= 1;
        end
        else if(num1 == 4'hd) begin
            led_ca <= 1;led_cb <= 0;led_cc <= 0;led_cd <= 0;led_ce <= 0;led_cf <= 1;led_cg <= 0;led_dp <= 1;
        end
        else if(num1 == 4'he) begin
            led_ca <= 0;led_cb <= 1;led_cc <= 1;led_cd <= 0;led_ce <= 0;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num1 == 4'hf) begin
            led_ca <= 0;led_cb <= 1;led_cc <= 1;led_cd <= 1;led_ce <= 0;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else ;
    end
    else if(~led_en[5] || ~led_en[4]) begin
        if(num2 == 4'h0) begin
            led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 0;led_ce <= 0;led_cf <= 0;led_cg <= 1;led_dp <= 1;
        end
        else if(num2 == 4'h1) begin
            led_ca <= 1;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 1;led_cf <= 1;led_cg <= 1;led_dp <= 1;
        end
        else if(num2 == 4'h2) begin
            led_ca <= 0;led_cb <= 0;led_cc <= 1;led_cd <= 0;led_ce <= 0;led_cf <= 1;led_cg <= 0;led_dp <= 1;
        end
        else if(num2 == 4'h3) begin
            led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 0;led_ce <= 1;led_cf <= 1;led_cg <= 0;led_dp <= 1;
        end
        else if(num2 == 4'h4) begin
            led_ca <= 1;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 1;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num2 == 4'h5) begin
            led_ca <= 0;led_cb <= 1;led_cc <= 0;led_cd <= 0;led_ce <= 1;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num2 == 4'h6) begin
            led_ca <= 0;led_cb <= 1;led_cc <= 0;led_cd <= 0;led_ce <= 0;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num2 == 4'h7) begin
            led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 1;led_cf <= 1;led_cg <= 1;led_dp <= 1;
        end
        else if(num2 == 4'h8) begin
            led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 0;led_ce <= 0;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num2 == 4'h9) begin
            led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 1;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num2 == 4'ha) begin
            led_ca <= 0;led_cb <= 0;led_cc <= 0;led_cd <= 1;led_ce <= 0;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num2 == 4'hb) begin
            led_ca <= 1;led_cb <= 1;led_cc <= 0;led_cd <= 0;led_ce <= 0;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num2 == 4'hc) begin
            led_ca <= 1;led_cb <= 1;led_cc <= 1;led_cd <= 0;led_ce <= 0;led_cf <= 1;led_cg <= 0;led_dp <= 1;
        end
        else if(num2 == 4'hd) begin
            led_ca <= 1;led_cb <= 0;led_cc <= 0;led_cd <= 0;led_ce <= 0;led_cf <= 1;led_cg <= 0;led_dp <= 1;
        end
        else if(num2 == 4'he) begin
            led_ca <= 0;led_cb <= 1;led_cc <= 1;led_cd <= 0;led_ce <= 0;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else if(num2 == 4'hf) begin
            led_ca <= 0;led_cb <= 1;led_cc <= 1;led_cd <= 1;led_ce <= 0;led_cf <= 0;led_cg <= 0;led_dp <= 1;
        end
        else ;
        end
    end
end

tub_show u_tub_show(
    .clk(clk),
    .rst(rst),
    .button(button),
    .led_en(led_en)
);
timer u_timer(
    .clk(clk),
    .rst(rst),
    .button(button),
    .en1(led_en[7]),
    .en0(led_en[6]),
    .num(num1)
);
counter u_counter(
    .clk(clk),
    .rst(rst),
    .button(button),
    .en1(led_en[5]),
    .en0(led_en[4]),
    .signal(key),
    .num(num2)
);
key u_key(
    .clk(clk),
    .rst(rst),
    .signal(signal),
    .key(key)
);
endmodule