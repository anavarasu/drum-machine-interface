// Customizable counter, counts 0 to n-1.
// parameters: WIDTH - number of output bits
//	       n - number that counter counts up to

module n_counter #(
	parameter WIDTH = 2,
	parameter n = 3
)(
	input logic clk, 
	input logic rst, 
	input logic en_i_n,

	output logic [WIDTH-1:0] count_o
);
	wire logic rst_w;
	assign rst_w = (count_o == (n-1));
	logic [WIDTH-1:0] out_d, out_q;
  	assign count_o = out_q;

  	always_comb begin
		if (~en_i_n) begin
			if (rst_w) begin
				out_d = '0;
			end else begin
				out_d = out_q + 1;
			end
		end else begin
			out_d = out_q;
		end
  	end

	always_ff @(posedge clk or posedge rst) begin
  		if (rst) begin
    			out_q <= '0;
  		end else begin
    			out_q <= out_d;
  		end
	end
endmodule
