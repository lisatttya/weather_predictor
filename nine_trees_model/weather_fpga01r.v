module decision_tree1_fpga(
   input CLOCK_50,
	input[1:0] KEY,
   input [3:0] SW,
   output [2:0] LED1,
   output [5:3] LED2
);
  wire clock;
  pll pll(CLOCK_50, ~KEY[1], clock);

 // input data, will be passed to decision_tree1.v
 // input[0]: max, input[1]: min, input[2]: p, input[3]: wind

 /****** Dataset 1 ******/  
 // 2012/1/1 correct: drizzle 
  wire [31:0] input0[0:3];    // each data 5bit, overall 4 pairs
  assign input0[0] = 32'b01000001010011001100110011001101; // 12.8
  assign input0[1] = 32'b01000000101000000000000000000000; // 5
  assign input0[2] = 32'b00000000000000000000000000000000; // 0
  assign input0[3] = 32'b01000000100101100110011001100110; // 4.7
  // 2012/1/2 correct: rain
  wire [31:0] input1[0:3];    // each data 5bit, overall 4 pairs
  assign input1[0] = 32'b01000001001010011001100110011010; // 10.6
  assign input1[1] = 32'b01000000001100110011001100110011; // 2.8
  assign input1[2] = 32'b01000001001011100110011001100110; // 10.9
  assign input1[3] = 32'b01000000100100000000000000000000; // 4.5
  // 2012/1/8 correct: sun
  wire [31:0] input2[0:3];    // each data 5bit, overall 4 pairs
  assign input2[0] = 32'b01000001001000000000000000000000; // 10
  assign input2[1] = 32'b01000000001100110011001100110011; // 2.8
  assign input2[2] = 32'b00000000000000000000000000000000; // 0
  assign input2[3] = 32'b01000000000000000000000000000000; // 2
  // 2012/1/3 correct: rain
  wire [31:0] input3[0:3];    // each data 5bit, overall 4 pairs
  assign input3[0] = 32'b01000001001110110011001100110011; // 11.7
  assign input3[1] = 32'b01000000111001100110011001100110; // 7.2
  assign input3[2] = 32'b00111111010011001100110011001101; // 0.8
  assign input3[3] = 32'b01000000000100110011001100110011; // 2.3
  // 2012/1/14 correct: snow
  wire [31:0] input4[0:3];    // each data 5bit, overall 4 pairs
  assign input4[0] = 32'b01000000100011001100110011001101; // 4.4
  assign input4[1] = 32'b00111111000110011001100110011010; // 0.6
  assign input4[2] = 32'b01000000100000110011001100110011; // 4.1
  assign input4[3] = 32'b01000000101010011001100110011010; // 5.3
  // 2012/1/5 correct: rain
  wire [31:0] input5[0:3];    // each data 5bit, overall 4 pairs
  assign input5[0] = 32'b01000001000011100110011001100110; // 8.9
  assign input5[1] = 32'b01000000001100110011001100110011; // 2.8
  assign input5[2] = 32'b00111111101001100110011001100110; // 1.3
  assign input5[3] = 32'b01000000110000110011001100110011; // 6.1
  // 2012/1/11 correct: sun
  wire [31:0] input6[0:3];    // each data 5bit, overall 4 pairs
  assign input6[0] = 32'b01000000110000110011001100110011; // 6.1
  assign input6[1] = 32'b10111111100011001100110011001101; // -1.1
  assign input6[2] = 32'b00000000000000000000000000000000; // 0
  assign input6[3] = 32'b01000000101000110011001100110011; // 5.1
  // 2012/1/15 correct: snow
  wire [31:0] input7[0:3];    // each data 5bit, overall 4 pairs
  assign input7[0] = 32'b00111111100011001100110011001101; // 1.1
  assign input7[1] = 32'b11000000010100110011001100110011; // -3.3
  assign input7[2] = 32'b01000000101010011001100110011010; // 5.3
  assign input7[3] = 32'b01000000010011001100110011001101; // 3.2
  // 2012/1/7 correct: rain
  wire [31:0] input8[0:3];    // each data 5bit, overall 4 pairs
  assign input8[0] = 32'b01000000111001100110011001100110; // 7.2
  assign input8[1] = 32'b01000000001100110011001100110011; // 2.8
  assign input8[2] = 32'b00000000000000000000000000000000; // 0
  assign input8[3] = 32'b01000000000100110011001100110011; // 2.3
  // 2012/1/12 correct: sun
  wire [31:0] input9[0:3];    // each data 5bit, overall 4 pairs
  assign input9[0] = 32'b01000000110000110011001100110011; // 6.1
  assign input9[1] = 32'b10111111110110011001100110011010; // -1.7
  assign input9[2] = 32'b00000000000000000000000000000000; // 0
  assign input9[3] = 32'b00111111111100110011001100110011; // 1.9
  //2012/1/16 correct: snow
  wire [31:0] input10[0:3];    // each data 5bit, overall 4 pairs
  assign input10[0] = 32'b00111111110110011001100110011010; // 1.7
  assign input10[1] = 32'b11000000001100110011001100110011; // -2.8
  assign input10[2] = 32'b01000000001000000000000000000000; // 2.5
  assign input10[3] = 32'b01000000101000000000000000000000; // 5
  // 2012/1/4 correct: rain
  wire [31:0] input11[0:3];    // each data 5bit, overall 4 pairs
  assign input11[0] = 32'b01000001010000110011001100110011; // 12.2
  assign input11[1] = 32'b01000000101100110011001100110011; // 5.6
  assign input11[2] = 32'b01000001101000100110011001100110; // 20.3
  assign input11[3] = 32'b01000000100101100110011001100110; // 4.7
  // 2012/1/13 correct: sun
  wire [31:0] input12[0:3];    // each data 5bit, overall 4 pairs
  assign input12[0] = 32'b01000000101000000000000000000000; // 5
  assign input12[1] = 32'b11000000001100110011001100110011; // -2.8
  assign input12[2] = 32'b00000000000000000000000000000000; // 0
  assign input12[3] = 32'b00111111101001100110011001100110; // 1.3
  // 2012/1/9 correct: rain
  wire [31:0] input13[0:3];    // each data 5bit, overall 4 pairs
  assign input13[0] = 32'b01000001000101100110011001100110; // 9.4
  assign input13[1] = 32'b01000000101000000000000000000000; // 5
  assign input13[2] = 32'b01000000100010011001100110011010; // 4.3
  assign input13[3] = 32'b01000000010110011001100110011010; // 3.4
  // 2012/1/10 correct: rain
  wire [31:0] input14[0:3];    // each data 5bit, overall 4 pairs
  assign input14[0] = 32'b01000000110000110011001100110011; // 6.1
  assign input14[1] = 32'b00111111000110011001100110011010; // 0.6
  assign input14[2] = 32'b00111111100000000000000000000000; // 1
  assign input14[3] = 32'b01000000010110011001100110011010; // 3.4
  // 2012/1/6 correct: rain
  wire [31:0] input15[0:3];    // each data 5bit, overall 4 pairs
  assign input15[0] = 32'b01000000100011001100110011001101; // 4.4
  assign input15[1] = 32'b01000000000011001100110011001101; // 2.2
  assign input15[2] = 32'b01000000001000000000000000000000; // 2.5
  assign input15[3] = 32'b01000000000011001100110011001101; // 2.2

   // correct data list
   wire [5:0] actual_ans;
   assign actual_ans =
      SW[3:0] == 4'b0000 ? 6'b000001 :
      SW[3:0] == 4'b0001 ? 6'b000011 :
      SW[3:0] == 4'b0010 ? 6'b000101 :
      SW[3:0] == 4'b0011 ? 6'b000011 :
      SW[3:0] == 4'b0100 ? 6'b000100 :
      SW[3:0] == 4'b0101 ? 6'b000011 :
      SW[3:0] == 4'b0110 ? 6'b000101 :
      SW[3:0] == 4'b0111 ? 6'b000100 :
      SW[3:0] == 4'b1000 ? 6'b000011 :
      SW[3:0] == 4'b1001 ? 6'b000101 :
      SW[3:0] == 4'b1010 ? 6'b000100 :
      SW[3:0] == 4'b1011 ? 6'b000011 :
      SW[3:0] == 4'b1100 ? 6'b000101 :
      SW[3:0] == 4'b1101 ? 6'b000011 :
      SW[3:0] == 4'b1110 ? 6'b000011 :
      SW[3:0] == 4'b1111 ? 6'b000011 : 6'b000000;
   /****** Set 1 till here ******/

	
  /****** Data Set 2 ******/
  /*
  // 2012/1/1 correct: drizzle 
  wire [31:0] input0[0:3];    // each data 5bit, overall 4 pairs
  assign input0[0] = 32'b01000001010011001100110011001101; // 12.8
  assign input0[1] = 32'b01000000101000000000000000000000; // 5
  assign input0[2] = 32'b00000000000000000000000000000000; // 0
  assign input0[3] = 32'b01000000100101100110011001100110; // 4.7
  // 2012/1/6 correct: rain
  wire [31:0] input1[0:3];    // each data 5bit, overall 4 pairs
  assign input1[0] = 32'b01000000100011001100110011001101; // 4.4
  assign input1[1] = 32'b01000000000011001100110011001101; // 2.2
  assign input1[2] = 32'b01000000001000000000000000000000; // 2.5
  assign input1[3] = 32'b01000000000011001100110011001101; // 2.2
  // 2012/2/10 correct: rain
  wire [31:0] input2[0:3];    // each data 5bit, overall 4 pairs
  assign input2[0] = 32'b01000001010011001100110011001101; // 12.8
  assign input2[1] = 32'b01000000110101100110011001100110; // 6.7
  assign input2[2] = 32'b01000000001000000000000000000000; // 2.5
  assign input2[3] = 32'b01000000010000000000000000000000; // 3
  // 2012/2/25 correct: rain
  wire [31:0] input3[0:3];    // each data 5bit, overall 4 pairs
  assign input3[0] = 32'b01000000111001100110011001100110; // 7.2
  assign input3[1] = 32'b01000000001100110011001100110011; // 2.8
  assign input3[2] = 32'b00000000000000000000000000000000; // 0
  assign input3[3] = 32'b01000000110011001100110011001101; // 6.4
  // 2012/3/8 correct: sun
  wire [31:0] input4[0:3];    // each data 5bit, overall 4 pairs
  assign input4[0] = 32'b01000001011110011001100110011010; // 15.6
  assign input4[1] = 32'b00111111000110011001100110011010; // 0.6
  assign input4[2] = 32'b00000000000000000000000000000000; // 0
  assign input4[3] = 32'b01000000001000000000000000000000; // 2.5
  // 2012/3/25 correct: rain
  wire [31:0] input5[0:3];    // each data 5bit, overall 4 pairs
  assign input5[0] = 32'b01000001010101001100110011001101; // 13.3
  assign input5[1] = 32'b01000000000011001100110011001101; // 2.2
  assign input5[2] = 32'b00000000000000000000000000000000; // 0
  assign input5[3] = 32'b01000000001011001100110011001101; // 2.7
  // 2012/4/29 correct: rain
  wire [31:0] input6[0:3];    // each data 5bit, overall 4 pairs
  assign input6[0] = 32'b01000001011110011001100110011010; // 15.6
  assign input6[1] = 32'b01000001000011100110011001100110; // 8.9
  assign input6[2] = 32'b01000000100010011001100110011010; // 4.3
  assign input6[3] = 32'b00111111110011001100110011001101; // 1.6
  // 2012/5/15 correct: drizzle
  wire [31:0] input7[0:3];    // each data 5bit, overall 4 pairs
  assign input7[0] = 32'b01000001110000110011001100110011; // 24.4
  assign input7[1] = 32'b01000001000101100110011001100110; // 9.4
  assign input7[2] = 32'b00000000000000000000000000000000; // 0
  assign input7[3] = 32'b01000000100000110011001100110011; // 4.1
  // 2012/6/1 correct: rain
  wire [31:0] input8[0:3];    // each data 5bit, overall 4 pairs
  assign input8[0] = 32'b01000001101000000000000000000000; // 20
  assign input8[1] = 32'b01000001010011001100110011001101; // 12.8
  assign input8[2] = 32'b01000000110100110011001100110011; // 6.6
  assign input8[3] = 32'b01000000011011001100110011001101; // 3.7
  // 2012/7/17 correct: sun
  wire [31:0] input9[0:3];    // each data 5bit, overall 4 pairs
  assign input9[0] = 32'b01000001101011011001100110011010; // 21.7
  assign input9[1] = 32'b01000001011100000000000000000000; // 15
  assign input9[2] = 32'b00000000000000000000000000000000; // 0
  assign input9[3] = 32'b01000000001001100110011001100110; // 2.6
  //2012/8/8 correct: sun
  wire [31:0] input10[0:3];    // each data 5bit, overall 4 pairs
  assign input10[0] = 32'b01000001101100011001100110011010; // 22.2
  assign input10[1] = 32'b01000001011100000000000000000000; // 15
  assign input10[2] = 32'b00000000000000000000000000000000; // 0
  assign input10[3] = 32'b01000000010000000000000000000000; // 3
  // 2012/10/9 correct: drizzle
  wire [31:0] input11[0:3];    // each data 5bit, overall 4 pairs
  assign input11[0] = 32'b01000001100000001100110011001101; // 16.1
  assign input11[1] = 32'b01000001000011100110011001100110; // 8.9
  assign input11[2] = 32'b00000000000000000000000000000000; // 0
  assign input11[3] = 32'b00111111110011001100110011001101; // 1.6
  // 2012/11/26 correct: fog
  wire [31:0] input12[0:3];    // each data 5bit, overall 4 pairs
  assign input12[0] = 32'b01000001000101100110011001100110; // 9.4
  assign input12[1] = 32'b00111111110110011001100110011010; // 1.7
  assign input12[2] = 32'b00000000000000000000000000000000; // 0
  assign input12[3] = 32'b01000000011100110011001100110011; // 3.8
  // 2012/12/18 correct: snow
  wire [31:0] input13[0:3];    // each data 5bit, overall 4 pairs
  assign input13[0] = 32'b01000000011110011001100110011010; // 3.9
  assign input13[1] = 32'b00111111000110011001100110011010; // 0.6
  assign input13[2] = 32'b01000000010100110011001100110011; // 3.3
  assign input13[3] = 32'b01000000101010011001100110011010; // 5.3
  // 2013/2/23 correct: rain
  wire [31:0] input14[0:3];    // each data 5bit, overall 4 pairs
  assign input14[0] = 32'b01000001001000000000000000000000; // 10
  assign input14[1] = 32'b01000000011110011001100110011010; // 3.9
  assign input14[2] = 32'b00111110100110011001100110011010; // 0.3
  assign input14[3] = 32'b01000000100100110011001100110011; // 4.6
  // 2013/4/27 correct: sun
  wire [31:0] input15[0:3];    // each data 5bit, overall 4 pairs
  assign input15[0] = 32'b01000001010111100110011001100110; // 13.9
  assign input15[1] = 32'b01000001001010011001100110011010; // 10.6
  assign input15[2] = 32'b00000000000000000000000000000000; // 0
  assign input15[3] = 32'b01000000101111001100110011001101; // 5.9

   // correct data list
   wire [5:0] actual_ans;
   assign actual_ans =
      SW[3:0] == 4'b0000 ? 6'b000001 :
      SW[3:0] == 4'b0001 ? 6'b000011 :
      SW[3:0] == 4'b0010 ? 6'b000011 :
      SW[3:0] == 4'b0011 ? 6'b000011 :
      SW[3:0] == 4'b0100 ? 6'b000101 :
      SW[3:0] == 4'b0101 ? 6'b000101 :
      SW[3:0] == 4'b0110 ? 6'b000011 :
      SW[3:0] == 4'b0111 ? 6'b000001 :
      SW[3:0] == 4'b1000 ? 6'b000011 :
      SW[3:0] == 4'b1001 ? 6'b000101 :
      SW[3:0] == 4'b1010 ? 6'b000101 :
      SW[3:0] == 4'b1011 ? 6'b000001 :
      SW[3:0] == 4'b1100 ? 6'b000010 :
      SW[3:0] == 4'b1101 ? 6'b000100 :
      SW[3:0] == 4'b1110 ? 6'b000011 :
      SW[3:0] == 4'b1111 ? 6'b000101 : 6'b000000;
   */
   /****** set 2 till here *****/

   // choose input data here
   //temp_max input
   wire [31:0] tree_input[0:3];
   assign tree_input[0] = 
		SW[3:0] == 4'b0000 ? input0[0] :
		SW[3:0] == 4'b0001 ? input1[0] :
		SW[3:0] == 4'b0010 ? input2[0] :
		SW[3:0] == 4'b0011 ? input3[0] :
		SW[3:0] == 4'b0100 ? input4[0] :
		SW[3:0] == 4'b0101 ? input5[0] :
		SW[3:0] == 4'b0110 ? input6[0] :
		SW[3:0] == 4'b0111 ? input7[0] :
		SW[3:0] == 4'b1000 ? input8[0] :
		SW[3:0] == 4'b1001 ? input9[0] :
		SW[3:0] == 4'b1010 ? input10[0] :
		SW[3:0] == 4'b1011 ? input11[0] :
		SW[3:0] == 4'b1100 ? input12[0] :
		SW[3:0] == 4'b1101 ? input13[0] :
		SW[3:0] == 4'b1110 ? input14[0] :
		SW[3:0] == 4'b1111 ? input15[0] : 32'b00000000000000000000000000000000 ;

   // temp_min input
   assign tree_input[1] = 
		SW[3:0] == 4'b0000 ? input0[1] :
		SW[3:0] == 4'b0001 ? input1[1] :
		SW[3:0] == 4'b0010 ? input2[1] :
		SW[3:0] == 4'b0011 ? input3[1] :
		SW[3:0] == 4'b0100 ? input4[1] :
		SW[3:0] == 4'b0101 ? input5[1] :
		SW[3:0] == 4'b0110 ? input6[1] :
		SW[3:0] == 4'b0111 ? input7[1] :
		SW[3:0] == 4'b1000 ? input8[1] :
		SW[3:0] == 4'b1001 ? input9[1] :
		SW[3:0] == 4'b1010 ? input10[1] :
		SW[3:0] == 4'b1011 ? input11[1] :
		SW[3:0] == 4'b1100 ? input12[1] :
		SW[3:0] == 4'b1101 ? input13[1] :
		SW[3:0] == 4'b1110 ? input14[1] :
		SW[3:0] == 4'b1111 ? input15[1] : 32'b00000000000000000000000000000000 ;

   // precpitation input
   assign tree_input[2] = 
		SW[3:0] == 4'b0000 ? input0[2] :
		SW[3:0] == 4'b0001 ? input1[2] :
		SW[3:0] == 4'b0010 ? input2[2] :
		SW[3:0] == 4'b0011 ? input3[2] :
		SW[3:0] == 4'b0100 ? input4[2] :
		SW[3:0] == 4'b0101 ? input5[2] :
		SW[3:0] == 4'b0110 ? input6[2] :
		SW[3:0] == 4'b0111 ? input7[2] :
		SW[3:0] == 4'b1000 ? input8[2] :
		SW[3:0] == 4'b1001 ? input9[2] :
		SW[3:0] == 4'b1010 ? input10[2] :
		SW[3:0] == 4'b1011 ? input11[2] :
		SW[3:0] == 4'b1100 ? input12[2] :
		SW[3:0] == 4'b1101 ? input13[2] :
		SW[3:0] == 4'b1110 ? input14[2] :
		SW[3:0] == 4'b1111 ? input15[2] : 32'b00000000000000000000000000000000 ;

   // wind input
   assign tree_input[3] = 
		SW[3:0] == 4'b0000 ? input0[3] :
		SW[3:0] == 4'b0001 ? input1[3] :
		SW[3:0] == 4'b0010 ? input2[3] :
		SW[3:0] == 4'b0011 ? input3[3] :
		SW[3:0] == 4'b0100 ? input4[3] :
		SW[3:0] == 4'b0101 ? input5[3] :
		SW[3:0] == 4'b0110 ? input6[3] :
		SW[3:0] == 4'b0111 ? input7[3] :
		SW[3:0] == 4'b1000 ? input8[3] :
		SW[3:0] == 4'b1001 ? input9[3] :
		SW[3:0] == 4'b1010 ? input10[3] :
		SW[3:0] == 4'b1011 ? input11[3] :
		SW[3:0] == 4'b1100 ? input12[3] :
		SW[3:0] == 4'b1101 ? input13[3] :
		SW[3:0] == 4'b1110 ? input14[3] :
		SW[3:0] == 4'b1111 ? input15[3] : 32'b00000000000000000000000000000000 ;
   
   wire [5:0] shifted_ans;
   assign shifted_ans = (actual_ans << 3);

   // give to random forest model (decision_tree1.v)
   wire[4:0] out1;
   wire[4:0] out2;
   wire[4:0] out3;
   wire[4:0] out4;
   wire[4:0] out5;
   wire[4:0] out6;
   wire[4:0] out7;
	wire[4:0] out8;
   wire[4:0] out9;
	wire[2:0] est;

   decision_tree1 tree1(clock, KEY[0], tree_input[0], tree_input[1], 
                        tree_input[2], tree_input[3], out1);
   decision_tree2 tree2(clock, KEY[0], tree_input[0], tree_input[1], 
                        tree_input[2], tree_input[3], out2);
	decision_tree3 tree3(clock, KEY[0], tree_input[0], tree_input[1], 
                        tree_input[2], tree_input[3], out3);
   decision_tree4 tree4(clock, KEY[0], tree_input[0], tree_input[1], 
                        tree_input[2], tree_input[3], out4);
	decision_tree5 tree5(clock, KEY[0], tree_input[0], tree_input[1], 
                        tree_input[2], tree_input[3], out5);
   decision_tree6 tree6(clock, KEY[0], tree_input[0], tree_input[1], 
                        tree_input[2], tree_input[3], out6);
	decision_tree7 tree7(clock, KEY[0], tree_input[0], tree_input[1], 
                        tree_input[2], tree_input[3], out7);
	decision_tree8 tree8(clock, KEY[0], tree_input[0], tree_input[1], 
                        tree_input[2], tree_input[3], out8);
	decision_tree9 tree9(clock, KEY[0], tree_input[0], tree_input[1], 
                        tree_input[2], tree_input[3], out9);
	majority_vote vote(clock, out1, out2, out3, out4, out5, out6, out7, out8, out9, est);

   // LED output
   assign LED1 = est;
   assign LED2 = shifted_ans[5:3];
endmodule