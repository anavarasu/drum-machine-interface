module demux_tb #(
	parameter DATA_WIDTH = 4,
	parameter SEL_WIDTH = 3,
	parameter OUTPUT_WIDTH = 5
);
	wire logic [DATA_WIDTH-1:0] wire_out [OUTPUT_WIDTH-1:0];
	logic [SEL_WIDTH-1:0] sel;

	demux #(
		.DATA_WIDTH(DATA_WIDTH),
		.SEL_WIDTH(SEL_WIDTH),
		.OUTPUT_WIDTH(OUTPUT_WIDTH)
	) demux (
		.data_i(4'b1010),
		.sel_i(sel),
		
		.data_o(wire_out)
	);

	initial begin
		sel = 3'b000;
		#10;
		sel = 3'b001;
		#10;
		sel = 3'b010;
		#10;
		sel = 3'b011;
		#10;
		sel = 3'b100;
		#10;
	end
endmodule
