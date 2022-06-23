module weather_fpga01r(
    input CLOCK_50,
	 input[1:0] KEY,
    output [2:0] LED
);
    wire clock;
    wire [2:0] out;

	pll pll(CLOCK_50, ~KEY[1], clock);
    decision_tree tree1(clock, KEY[0], 5'b01010, 5'b00000, 
                        5'b00010, 5'b00100, out);
    assign LED = out[2:0];
endmodule