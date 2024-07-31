module demux #(
	parameter DATA_WIDTH,
	parameter SEL_WIDTH, // binary number of width SEL_WIDTH must be able to count up to at least OUTPUT_WIDTH-1
	parameter OUTPUT_WIDTH
)(
	input logic [DATA_WIDTH-1:0] data_i,
	input logic [SEL_WIDTH-1:0] sel_i,

	output logic [DATA_WIDTH-1:0] data_o [OUTPUT_WIDTH-1:0]
);
	integer i;

	always_comb begin
		for (i = 0; i < OUTPUT_WIDTH; i = i + 1) begin
			if (i == sel_i) begin
				data_o[i] = data_i;
			end else begin
				data_o[i] = '0;
			end
		end
	end
endmodule
