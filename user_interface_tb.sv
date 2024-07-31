module user_interface_tb;
	parameter PATTERN_WIDTH = 8;
	parameter COUNT_WIDTH = 4; // binary number of COUNT_WIDTH length must be able to count up to at least 2*PATTERN_WIDTH-1
	parameter DRUM_COUNT = 5;
	parameter DRUM_COUNT_WIDTH = 3; // binary number of DRUM_COUNT_WIDTH length must be able to count up to at least DRUM_COUNT-1
	
	logic [PATTERN_WIDTH-1:0] pattern_i;
	logic [DRUM_COUNT_WIDTH-1:0] sel_i;
	logic clk;
	logic rst;
	logic en_i_n;
	logic [COUNT_WIDTH-1:0] n;

	wire logic pattern_o [0:DRUM_COUNT-1];

	user_interface #(
		.PATTERN_WIDTH(PATTERN_WIDTH),
		.COUNT_WIDTH(COUNT_WIDTH),
		.DRUM_COUNT(DRUM_COUNT),
		.DRUM_COUNT_WIDTH(DRUM_COUNT_WIDTH)
	) interface_1 (
		.pattern_i(pattern_i),
		.sel_i(sel_i),
		.clk(clk),
		.rst(rst),
		.en_i_n(en_i_n),
		.n(n),

		.pattern_o(pattern_o)
	);
	
	initial begin
        	clk = 0;  // Initialize the clock
    	end

    	always begin
        	#5 clk = ~clk;  // Toggle the clock every 5 time units (creates a clock with a period of 10 time units)
    	end

	integer i;
	initial begin
		en_i_n = 0;
		rst = 1;
		#20 rst = 0;

		n = 4'b0000_0000;
		pattern_i = 8'b1001_1010;
		for (i = 0; i < DRUM_COUNT; i = i + 1) begin
			sel_i = i;
			#80;
		end
		$finish;
	end
endmodule
