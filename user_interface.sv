module user_interface #(
	parameter PATTERN_WIDTH = 16,
	parameter COUNT_WIDTH = 5, // binary number of COUNT_WIDTH length must be able to count up to at least 2*PATTERN_WIDTH-1
	parameter DRUM_COUNT = 5,
	parameter DRUM_COUNT_WIDTH = 3 // binary number of DRUM_COUNT_WIDTH length must be able to count up to at least DRUM_COUNT-1
)(
	input logic [PATTERN_WIDTH-1:0] pattern_i,
	input logic [DRUM_COUNT_WIDTH-1:0] sel_i,
	input logic clk, 
	input logic rst,
	input logic en_i_n,
	input logic [COUNT_WIDTH-1:0] n,

	output logic pattern_o [0:DRUM_COUNT-1]
);
	wire logic [PATTERN_WIDTH-1:0] demux_o [DRUM_COUNT-1:0];

	drum_controller #(
		.PATTERN_WIDTH(PATTERN_WIDTH),
		.COUNT_WIDTH(COUNT_WIDTH)
	) drum[0:DRUM_COUNT-1] (
		.pattern_i(demux_o),
		.clk(clk),
		.rst(rst),
		.en_i_n(en_i_n),
		.n(n),

		.pattern_o(pattern_o)
	);

	demux #(
		.DATA_WIDTH(PATTERN_WIDTH),
		.SEL_WIDTH(DRUM_COUNT_WIDTH),
		.OUTPUT_WIDTH(DRUM_COUNT)
	) demux (
		.data_i(pattern_i),
		.sel_i(sel_i),
		
		.data_o(demux_o)
	);
endmodule
