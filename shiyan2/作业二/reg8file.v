`timescale 1ns / 1ps

module reg8file (
	input wire [2:0] wsel,
    input wire [2:0] rsel,
    input wire en,
    input wire clk,
    input wire clr,   
    input wire [7:0] d,
	output reg [7:0]q
);
reg [7:0] En;
wire [7:0] r0;
wire [7:0] r1;
wire [7:0] r2;
wire [7:0] r3;
wire [7:0] r4;
wire [7:0] r5;
wire [7:0] r6;
wire [7:0] r7;

                               
always @ (*) begin
	    case (rsel) 
		    3'b000 : q = r0;
			3'b001 : q = r1;
			3'b010 : q = r2;
			3'b011 : q = r3;
			3'b100 : q = r4;
			3'b101 : q = r5;
			3'b110 : q = r6;
			3'b111 : q = r7;
			default : q = 8'b00000000;
		endcase	
        if (en == 1'b1) begin
        En = 8'b00000000;
	    case (wsel)
		    3'b000 : En[0] = 1'b1;
			3'b001 : En[1] = 1'b1;
			3'b010 : En[2] = 1'b1;
			3'b011 : En[3] = 1'b1;
			3'b100 : En[4] = 1'b1;
			3'b101 : En[5] = 1'b1;
			3'b110 : En[6] = 1'b1;
			3'b111 : En[7] = 1'b1;
			default : En = 8'b00000000;
		endcase
	   end
	   else  En = 8'b00000000;
end
dff8 u_dff80(
        .en(En[0]),
        .d(d),
        .clk(clk),
        .clr(clr),
        .r(r0)
   );
   dff8 u_dff81(
        .en(En[1]),
        .d(d),
        .clk(clk),
        .clr(clr),
        .r(r1)
   );
   dff8 u_dff82(
        .en(En[2]),
        .d(d),
        .clk(clk),
        .clr(clr),
        .r(r2)
   );
   dff8 u_dff83(
        .en(En[3]),
        .d(d),
        .clk(clk),
        .clr(clr),
        .r(r3)
   );
   dff8 u_dff84(
        .en(En[4]),
        .d(d),
        .clk(clk),
        .clr(clr),
        .r(r4)
   );
   dff8 u_dff85(
        .en(En[5]),
        .d(d),
        .clk(clk),
        .clr(clr),
        .r(r5)
   );
   dff8 u_dff86(
        .en(En[6]),
        .d(d),
        .clk(clk),
        .clr(clr),
        .r(r6)
   );
   dff8 u_dff87(
        .en(En[7]),
        .d(d),
        .clk(clk),
        .clr(clr),
        .r(r7)
   );
endmodule


