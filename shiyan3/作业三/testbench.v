`timescale 1ns/1ps        

module flowing_water_lights_sim();   
    reg clk;
    reg rst;
    reg button;
    reg [1:0]freq_set;
    wire [7:0]led;
    
    
   initial    
   begin
        clk = 1'b0;rst = 1'b1;button = 1'b1;freq_set = 2'b00;
        #5 rst = 1'b0;button = 1'b1;freq_set = 2'b00;
        #5 button = 1'b0;
        #500000000  rst = 1'b1;freq_set = 2'b01;
        #5 rst = 1'b0;button = 1'b1;freq_set = 2'b01;
        #5 button = 1'b0;                                                                   
   end
   always #5 clk = ~clk;
      
   flowing_water_lights u_flowing_water_ligts(
        .clk      (clk     ),
        .rst      (rst     ),
        .button   (button  ),
        .freq_set (freq_set),
        .led      (led     )
    );
endmodule
