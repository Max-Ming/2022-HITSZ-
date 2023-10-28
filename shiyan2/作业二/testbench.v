`timescale 1ns/1ps        

module reg8file_sim();   

    reg [2:0] wsel;
    reg [2:0] rsel;
    reg en;
    reg [7:0] d;
    reg clk;
    reg clr;
    wire [7:0] q;
    
    
   initial    
   begin
        clk = 1'b0;clr = 1'b1;en = 1'b1;d = 8'b00000001;wsel = 3'b000;rsel = 3'b001;
		#5 clr = 1'b0;en = 1'b1;d = 8'b00000001;wsel = 3'b000;rsel = 3'b001;
		#5 clr = 1'b0;en = 1'b1;d = 8'b00000100;wsel = 3'b010;rsel = 3'b000;
		#5 clr = 1'b0;en = 1'b1;d = 8'b00000100;wsel = 3'b010;rsel = 3'b000;
		#5 clr = 1'b0;en = 1'b0;d = 8'b00000000;wsel = 3'b000;rsel = 3'b010;
		#5 clr = 1'b0;en = 1'b0;d = 8'b00000000;wsel = 3'b000;rsel = 3'b010;
		#5 clr = 1'b0;en = 1'b1;d = 8'b00000010;wsel = 3'b001;rsel = 3'b000;
		#5 clr = 1'b0;en = 1'b1;d = 8'b00000010;wsel = 3'b001;rsel = 3'b000;
		#5 clr = 1'b0;en = 1'b1;d = 8'b00000010;wsel = 3'b001;rsel = 3'b001;
		#5 clr = 1'b0;en = 1'b1;d = 8'b00000000;wsel = 3'b001;rsel = 3'b001;                                                                       
   end
   always #5 clk = ~clk;
      
   reg8file u_reg8file (
        .wsel(wsel),
        .rsel(rsel),
        .clk (clk),
        .clr (clr),
        .en  (en ),
        .d   (d  ),
        .q   (q  )
    );
endmodule
