`timescale 1ns/1ps        

module sequence_detection_sim();   
    reg clk;
    reg rst;
    reg button;
    reg[7:0] switch;
    wire led;
    
   initial    
   begin
        clk = 1'b0;rst = 1'b1;button = 1'b0;switch = 8'b11111010;   
        #5 rst = 1'b0;
        #20 button = 1'b1;
        #20 button = 1'b0;
        #100 button = 1'b1;switch = 8'b01010101;
        #20 button = 1'b0;                                                              
   end
   always #5 clk = ~clk;
      
   sequence_detection u_sequence_detection(
        .clk(clk),
        .rst(rst),
        .button(button),
        .switch(switch),
        .led(led)
   );
endmodule
