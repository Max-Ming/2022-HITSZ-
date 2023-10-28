`timescale 1ns / 1ps

module dff (
	input wire clk,
    input wire clr,
    input wire en,
	input wire d,
	output reg q
);

always @ (posedge clk or posedge clr) begin
    if(clr)
        q <= 0;
    else if(en)
	    q <= d;
end




endmodule