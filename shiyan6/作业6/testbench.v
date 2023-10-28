`timescale 1ns/1ps         

module top_sim();    
    reg clk;
    reg rst;
    reg set_password;
    reg enter;
    reg test;
    reg  [3:0] row;
    wire [3:0] col;
    wire [7:0] led_en;
    wire led_ca;
    wire led_cb;
    wire led_cc;
    wire led_cd;
    wire led_ce;
    wire led_cf;
    wire led_cg;
    wire led_dp;
    wire gled0;
    wire gled1;
    wire rled0;
    wire rled1;
    wire rled2;

    initial 
    begin
        clk = 1'b0;rst = 1'b1;row = 4'b1111;set_password = 1'b0;enter = 1'b0;test = 1'b0;
        #5 rst = 1'b0;
        #10 set_password = 1'b1;
        #10 set_password = 1'b0;
        #470 row = 4'b0111;
        #150 row = 4'b1111; 
        #330 row = 4'b0111;
        #150 row = 4'b1111;
        #330 row = 4'b0111;
        #150 row = 4'b1111;
        #30 enter = 1'b1;
        #10 enter = 1'b0;
        #100 test = 1'b1;
        #20 test = 1'b0;
        #50 row = 4'b0111;
        #120 row = 4'b1111;
        #330 row = 4'b0111;
        #150 row = 4'b1111;
        #330 row = 4'b0111;
        #150 row = 4'b1111;
        #30 enter = 1'b1;
        #10 enter = 1'b0;
        #300 set_password = 1'b1;
        #10 set_password = 1'b0;
        #450 row = 4'b0111;
        #150 row = 4'b1111;
        #1130 row = 4'b0111;
        #150 row = 4'b1111;
        #1130 row = 4'b0111;
        #150 row = 4'b1111;
        #30 enter = 1'b1;
        #10 enter = 1'b0;
        #100 test = 1'b1;
        #20 test = 1'b0;
        #970 row = 4'b0111;
        #150 row = 4'b1111;
        #330 row = 4'b0111;
        #150 row = 4'b1111;
        #330 row = 4'b0111;
        #150 row = 4'b1111;
        #30 enter = 1'b1;
        #10 enter = 1'b0;
        #200 test = 1'b1;
        #20 test = 1'b0;
        #550 row = 4'b0111;
        #150 row = 4'b1111;
        #330 row = 4'b0111;
        #150 row = 4'b1111;
        #650 row = 4'b0111;
        #150 row = 4'b1111;
        #30 enter = 1'b1;
        #10 enter = 1'b0;
        #200 test = 1'b1;
        #20 test = 1'b0;
        #20 row = 4'b0111;
        #40 row = 4'b1111;
        #650 row = 4'b0111;
        #150 row = 4'b1111;
        #650 row = 4'b0111;
        #150 row = 4'b1111;
        #30 enter = 1'b1;
        #10 enter = 1'b0;
    end
    always #5 clk = ~clk;
    
    top u_top(
        .clk(clk),
        .rst(rst),
        .set_password(set_password),
        .enter(enter),
        .test(test),
        .row(row),
        .col(col),
        .led_en(led_en),
        .led_ca(led_ca),
        .led_cb(led_cb),
        .led_cc(led_cc),
        .led_cd(led_cd),
        .led_ce(led_ce),
        .led_cf(led_cf),
        .led_cg(led_cg),
        .led_dp(led_dp),
        .gled0(gled0),
        .gled1(gled1),
        .rled0(rled0),
        .rled1(rled1),
        .rled2(rled2)
    );
endmodule

