`timescale 1ns / 1ps

module top(
    input wire clk,
    input wire rst,//S1������λ
    input wire set_password,//S2������������
    input wire enter,//S5����ȷ��
    input wire test,//S3������֤����
    input wire [3:0] row,
    output wire [3:0] col,
    output wire [7:0] led_en,
    output wire led_ca,
    output wire led_cb,
    output wire led_cc,
    output wire led_cd,
    output wire led_ce,
    output wire led_cf,
    output wire led_cg,
    output wire led_dp,
    output wire gled0,//��������ɹ�
    output wire gled1,//�����ɹ�
    output wire rled0,//����ʧ��һ��
    output wire rled1,//����ʧ�ܶ���
    output wire rled2//����ʧ�����β���ס
);

wire flag0;
wire flagf;
wire [3:0] num;
wire [1:0] num7;
wire [1:0] num6;
wire [1:0] num5;
wire [4:0] current_state;

keyboard u_keyboard(
    .clk(clk), 
    .reset(rst), 
    .row(row), 
    .col(col), 
    .keyboard_num(num)
);

set_num u_set_num(
    .clk(clk),
    .rst(rst),
    .set_password(set_password),
    .test(test),
    .num(num),
    .current_state(current_state),
    .num7(num7),
    .num6(num6),
    .num5(num5)
);

big_sequence u_big_sequence(
    .clk(clk), 
    .rst(rst),  
    .set_password(set_password),
    .enter(enter),
    .test(test),
    .gled1(gled1),
    .rled2(rled2),
    .flag0(flag0),//����ܶ���ʾ0
    .flagf(flagf),//����ܶ���ʾf
    .gled0(gled0),
    .current_state(current_state)
);

small_sequence u_small_sequence(//��֤�����״̬��
    .clk(clk),
    .rst(rst),
    .big_current_state(current_state),
    .num7(num7),
    .num6(num6),
    .num5(num5),
    .test(test),
    .gled1(gled1),
    .rled0(rled0),
    .rled1(rled1),
    .rled2(rled2)
);

tub_show u_tub_show(
    .clk(clk),
    .rst(rst),
    .num7(num7),
    .num6(num6),
    .num5(num5),
    .flag0(flag0),
    .flagf(flagf),
    .led_en(led_en),
    .led_ca(led_ca),
    .led_cb(led_cb),
    .led_cc(led_cc),
    .led_cd(led_cd),
    .led_ce(led_ce),
    .led_cf(led_cf),
    .led_cg(led_cg),
    .led_dp(led_dp)
);
endmodule
