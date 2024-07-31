// n input bits, m output bits mux.
module drum_mux #(
	parameter n,
	parameter s,
	parameter m
)(
	input logic [n-1:0] data_i,
	input logic [s-1:0] sel_i,
	output logic [m-1:0] data_o
);
	always_comb begin
		if (sel_i[0] == 0) begin
			data_o = data_i[sel_i];
		end else begin
			data_o = 0;
		end
	end
endmodule
