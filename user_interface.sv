module user_interface #(
	parameter PATTERN_WIDTH = 8,
	parameter COUNT_WIDTH = 4,
	parameter DRUM_COUNT = 5
)(
	input logic [PATTERN_WIDTH-1:0] pattern_i,
	input logic clk, 
	input logic rst,
	input logic en_i_n,

	output logic pattern_o [0:DRUM_COUNT]
);
	wire logic [PATTERN_WIDTH-1:0] demux_o [DRUM_COUNT-1:0];

	drum_controller #(
		.PATTERN_WIDTH(PATTERN_WIDTH),
		.COUNT_WIDTH(COUNT_WIDTH)
	) drum[0:DRUM_COUNT] (
		.pattern_i(demux_o),
		.clk(clk),
		.rst(rst),
		.en_i_n(en_i_n),
		.n(n),

		.pattern_o(pattern_o)
	);
endmodule
