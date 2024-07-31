// Controls a single drum.
module drum_controller#(
	parameter PATTERN_WIDTH = 8,
	parameter COUNT_WIDTH = 4 // binary number of this width must be able to count to 2*PATTERN_WIDTH-1
	// parameter N = 16
)(
	input logic [PATTERN_WIDTH-1:0] pattern_i,
	input logic clk, 
	input logic rst,
	input logic en_i_n,
	input logic [COUNT_WIDTH-1:0] n,

	output logic pattern_o
);
	logic [COUNT_WIDTH-1:0] count;

	n_counter #(
		.WIDTH(COUNT_WIDTH)
	) counter (
		.clk(clk),
		.rst(rst),
		.en_i_n(en_i_n),
		.n(n),

		.count_o(count)
	);
	
	drum_mux #(
		.n(PATTERN_WIDTH),
		.s(COUNT_WIDTH),
		.m(1)
	) mux (
		.data_i(pattern_i),
		.sel_i(count),
		
		.data_o(pattern_o)
	);
endmodule
