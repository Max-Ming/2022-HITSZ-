`timescale 1ns/1ps        

module led_display_ctrl_sim();   
    reg clk;
    reg rst;
    reg button;
    reg signal;
    wire [7:0]led_en;
    wire led_ca;
    wire led_cb;
    wire led_cc;
    wire led_cd;
    wire led_ce;
    wire led_cf;
    wire led_cg;
    wire led_dp;
    
   initial    
   begin
        clk = 1'b0;rst = 1'b1;button = 1'b0;signal = 1'b0;
        #4 rst = 1'b0;
        #6 button = 1'b1;
        #10000000 signal = 1'b1;button = 1'b0;
        #1000000 signal = 1'b0;
        #500000 signal = 1'b1;
        #1000000 signal = 1'b0;
        #500000 signal = 1'b1;
        #1000000 signal = 1'b0;
        #500000 signal = 1'b1;
        #15000000 signal = 1'b0; 
        #500000 signal = 1'b1;
        #1000000 signal = 1'b0;
        #500000 signal = 1'b1;
        #1000000 signal = 1'b0;
        #500000 signal = 1'b1;
        #1000000 signal = 1'b0;
        #11000000 signal = 1'b1;
        #1000000 signal = 1'b0;
        #500000 signal = 1'b1;
        #1000000 signal = 1'b0;
        #500000 signal = 1'b1;
        #1000000 signal = 1'b0;
        #500000 signal = 1'b1;
        #15000000 signal = 1'b0; 
        #500000 signal = 1'b1;
        #1000000 signal = 1'b0;
        #500000 signal = 1'b1;
        #1000000 signal = 1'b0;
        #500000 signal = 1'b1;
        #1000000 signal = 1'b0;                                                              
   end
   always #5 clk = ~clk;
      
   led_display_ctrl u_led_display_ctrl(
        .clk      (clk   ),
        .rst      (rst   ),
        .button   (button),
        .signal   (signal),
        .led_en   (led_en),
        .led_ca   (led_ca),
        .led_cb   (led_cb),
        .led_cc   (led_cc),
        .led_cd   (led_cd),
        .led_ce   (led_ce),
        .led_cf   (led_cf),
        .led_cg   (led_cg),
        .led_dp   (led_dp)
    );
endmodule
