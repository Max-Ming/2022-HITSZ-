module decoder_38 (
	input  wire [2:0] enable,
	input  wire [2:0] switch,
	output reg  [7:0] led
);

always @ (*) begin
	if (enable == 3'b100) begin
	    case (switch)
		    3'h0 : led = 8'hfe;
			3'h1 : led = 8'hfd;
			3'h2 : led = 8'hfb;
			3'h3 : led = 8'hf7;
			3'h4 : led = 8'hef;
			3'h5 : led = 8'hdf;
			3'h6 : led = 8'hbf;
			3'h7 : led = 8'h7f;
			default : led = 8'hff;
		endcase
	end
	else led = 8'hff;
end

endmodule