module dff8 (
	input wire en,
	input wire [7:0] d,
    input wire clk,
    input wire clr, 
	output reg [7:0] r
);
                               
always @ (posedge clk or posedge clr) begin
    if(clr)
        r <= 8'b00000000;
    else if(en)
        r <= d;
end

endmodule