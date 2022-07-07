module weather_fpga01r(
    input CLOCK_50,
	 input[1:0] KEY,
    output [3:0] LED
);
    wire clock;
    wire[4:0] out1, out2, out3, out4, out5, out6, out7, out8, out9;
    wire[4:0] in_temp_max, in_temp_min, in_precipitation, in_wind;

    
   assign in_temp_max = 5'b01110;
   assign in_temp_min = 5'b00110;
   assign in_precipitation = 5'b00000;
   assign in_wind = 5'b00001;
   
	pll pll(CLOCK_50, ~KEY[1], clock);

    decision_tree1 tree1(clock, KEY[0], in_temp_max, in_temp_min, in_precipitation, in_wind, out1);
    decision_tree2 tree2(clock, KEY[0], in_temp_max, in_temp_min, in_precipitation, in_wind, out2);
    decision_tree3 tree3(clock, KEY[0], in_temp_max, in_temp_min, in_precipitation, in_wind, out3);
    decision_tree4 tree4(clock, KEY[0], in_temp_max, in_temp_min, in_precipitation, in_wind, out4);
    decision_tree5 tree5(clock, KEY[0], in_temp_max, in_temp_min, in_precipitation, in_wind, out5);
    decision_tree6 tree6(clock, KEY[0], in_temp_max, in_temp_min, in_precipitation, in_wind, out6);
    decision_tree7 tree7(clock, KEY[0], in_temp_max, in_temp_min, in_precipitation, in_wind, out7);
    decision_tree8 tree8(clock, KEY[0], in_temp_max, in_temp_min, in_precipitation, in_wind, out8);
    decision_tree9 tree9(clock, KEY[0], in_temp_max, in_temp_min, in_precipitation, in_wind, out9);

    majority_vote vote(clock, out1, out2, out3, out4, out5, out6, out7, out8, out9 ,result);

    assign LED = result;
endmodule
