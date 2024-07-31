// n input bits, m output bits mux.
module nxm_mux #(
	parameter n = 16,
	parameter s = 4,
	parameter m = 1
)(
	input logic [n-1:0] data_i,
	input logic [s-1:0] sel_i,
	output logic [m-1:0] data_o
);
	always_comb begin
		data_o = data_i[sel_i];
	end
endmodule
