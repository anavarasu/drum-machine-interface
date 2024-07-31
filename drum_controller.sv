// Controls a single drum.
module drum_controller#(
	parameter PATTERN_WIDTH = 16,
	parameter COUNT_WIDTH = 4
	// parameter N = 16
)(
	input logic [PATTERN_WIDTH-1:0] pattern_i,
	input logic clk, 
	input logic rst,
	input logic en_i_n,

	output logic pattern_o
);
	logic [COUNT_WIDTH-1:0] count;

	n_counter #(
		.WIDTH(COUNT_WIDTH),
		.n(PATTERN_WIDTH)
	) counter (
		.clk(clk),
		.rst(rst),
		.en_i_n(en_i_n),

		.count_o(count)
	);
	
	nxm_mux #(
		.n(PATTERN_WIDTH),
		.s(COUNT_WIDTH),
		.m(1)
	) mux (
		.data_i(pattern_i),
		.sel_i(count),
		
		.data_o(pattern_o)
	);
endmodule
