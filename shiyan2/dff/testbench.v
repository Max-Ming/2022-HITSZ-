`timescale 1ns/1ps        

module dff_sim();   

    reg clk;
    reg clr;
    reg en;
    reg d;
    wire q;

   initial    
   begin
        clk = 1'b0;clr = 1'b1;en = 1'b0;d = 1'b0;
		#5 clr = 1'b1;en = 1'b0;d = 1'b0;
		#5 clr = 1'b0;en = 1'b1;d = 1'b1;   
		#5 clr = 1'b0;en = 1'b1;d = 1'b1;
		#5 clr = 1'b0;en = 1'b1;d = 1'b0;
		#5 clr = 1'b0;en = 1'b1;d = 1'b0;
		#5 clr = 1'b0;en = 1'b1;d = 1'b1;
		#5 clr = 1'b0;en = 1'b1;d = 1'b1; 
		#5 clr = 1'b0;en = 1'b0;d = 1'b0;  
		#5 clr = 1'b0;en = 1'b1;d = 1'b1;    
		#5 clr = 1'b1;en = 1'b1;d = 1'b1;                                                                          
   end
   always #5 clk = ~clk;
  
   
   dff u_dff (
        .clk (clk),
        .clr (clr),
        .en  (en ),
        .d   (d  ),
        .q   (q  )
    );
endmodule
