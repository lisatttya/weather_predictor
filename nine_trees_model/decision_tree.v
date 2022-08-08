/********* module output list ***********//*
< decision tree(1-9) output[4:0] assign rule >
 - sunny: 10000
 - snowy: 01000
 - rainy: 00100
 - foggy: 00010
 - drizzle: 00001

< majority vote output[2:0] assign rule >
 - sunny: 101
 - snowy: 100
 - rainy: 011
 - foggy: 010
 - drizzle: 001

/*************** till here **************/
module decision_tree1 (
    CLOCK_50,
    rst,
    in_temp_max,
    in_temp_min,
    in_precipitation,
    in_wind,
    tmp_out);

    input CLOCK_50, rst;
    input[31:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;
    wire cmp_out0, cmp_out1, cmp_out2, cmp_out3, cmp_out4, cmp_out5, cmp_out6, cmp_out7, cmp_out8, 
        cmp_out9, cmp_out10, cmp_out11, cmp_out12, cmp_out13, cmp_out14, cmp_out15, cmp_out16, cmp_out17;

    reg [31:0] bc0 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc1 = 32'b01000001100011000000000000000000; // 17.5
    reg [31:0] bc2 = 32'b01000000100100000000000000000000; // 4.5
    reg [31:0] bc3 = 32'b01000000111100000000000000000000; // 7.5
    reg [31:0] bc4 = 32'b01000001111011000000000000000000; // 29.5
    reg [31:0] bc5 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc6 = 32'b00111111100000000000000000000000; // 1.0
    reg [31:0] bc7 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc8 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc9 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc10 = 32'b10111111000000000000000000000000; // -0.5
    reg [31:0] bc11 = 32'b01000000110100000000000000000000; // 6.5
    reg [31:0] bc12 = 32'b01000000011000000000000000000000; // 3.5
    reg [31:0] bc13 = 32'b01000000000000000000000000000000; // 2.0
    reg [31:0] bc14 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc15 = 32'b01000001111000000000000000000000; // 28
    reg [31:0] bc16 = 32'b01000001100001000000000000000000; // 16.5
    reg [31:0] bc17 = 32'b01000000001000000000000000000000; // 2.5

    cmp cmp0(CLOCK_50, in_precipitation, bc0, cmp_out0);
    cmp cmp1(CLOCK_50, in_temp_max, bc1, cmp_out1);
    cmp cmp2(CLOCK_50, in_wind, bc2, cmp_out2);
    cmp cmp3(CLOCK_50, in_temp_max, bc3, cmp_out3);
    cmp cmp4(CLOCK_50, in_temp_max, bc4, cmp_out4);
    cmp cmp5(CLOCK_50, in_temp_min, bc5, cmp_out5);
    cmp cmp6(CLOCK_50, in_temp_min, bc6, cmp_out6);
    cmp cmp7(CLOCK_50, in_wind, bc7, cmp_out7);
    cmp cmp8(CLOCK_50, in_wind, bc8, cmp_out8);
    cmp cmp9(CLOCK_50, in_wind, bc9, cmp_out9);
    cmp cmp10(CLOCK_50, in_temp_min, bc10, cmp_out10);
    cmp cmp11(CLOCK_50, in_temp_max, bc11, cmp_out11);
    cmp cmp12(CLOCK_50, in_temp_max, bc12, cmp_out12);
    cmp cmp13(CLOCK_50, in_temp_min, bc13, cmp_out13);
    cmp cmp14(CLOCK_50, in_temp_min, bc14, cmp_out14);
    cmp cmp15(CLOCK_50, in_temp_max, bc15, cmp_out15);
    cmp cmp16(CLOCK_50, in_temp_min, bc16, cmp_out16);
    cmp cmp17(CLOCK_50, in_wind, bc17, cmp_out17);

    parameter state_0 = 5'b00000;
    parameter state_1 = 5'b00001;
    parameter state_2 = 5'b00010;
    parameter state_3 = 5'b00011;
    parameter state_4 = 5'b00100;
    parameter state_5 = 5'b00101;
    parameter state_6 = 5'b00110;
    parameter state_7 = 5'b00111;
    parameter state_8 = 5'b01000;
    parameter state_9 = 5'b01001;
    parameter state_10 = 5'b01010;
    parameter state_11 = 5'b01011;
    parameter state_12 = 5'b01100;
    parameter state_13 = 5'b01101;
    parameter state_14 = 5'b01110;
    parameter state_15 = 5'b01111;
    parameter state_16 = 5'b10000;
    parameter state_17 = 5'b10001;

    reg[4:0] present_state, next_state;

    always @ (posedge CLOCK_50 or posedge rst) begin
        if(rst) begin
            present_state <= state_0;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @ (posedge CLOCK_50) begin
        case(present_state)
            state_0 : begin
                if (cmp_out0 == 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (cmp_out1 == 1) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (cmp_out2 == 1) begin
                    next_state = state_5;
                end
                else begin
                    next_state = state_6;
                end
            end
            state_3 : begin
                if (cmp_out3 == 1) begin
                    next_state = state_7;
                end
                else begin
                    next_state = state_8;
                end
            end
            state_4 : begin
                if (cmp_out4 == 1) begin
                    next_state = state_9;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_5 : begin
                if (cmp_out5 == 1) begin
                    next_state = state_10;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_6 : begin
                if (cmp_out6 == 1) begin
                    tmp_out = 5'b01000; // sonwy
                end
                else begin
                    next_state = state_11;
                end
            end
            state_7 : begin
                if (cmp_out7 == 1) begin
                    next_state = state_12;
                end
                else begin
                    next_state = state_13;
                end
            end
            state_8 : begin
                if (cmp_out8 == 1) begin
                    next_state = state_14;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_9 : begin
                if (cmp_out9 == 1) begin
                    next_state = state_15;
                end
                else begin
                    next_state = state_16;
                end
            end
            state_10 : begin
                if (cmp_out10 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    next_state = state_17;
                end
            end
            state_11 : begin
                if (cmp_out11 == 1) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_12 : begin
                if (cmp_out12 == 1) begin
                    tmp_out = 5'b00001; // drizzle
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_13 : begin
                if (cmp_out13 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_14 : begin
                if (cmp_out14 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_15 : begin
                if (cmp_out15 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_16 : begin
                if (cmp_out16 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_17 : begin
                if (cmp_out17 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            default : begin
                tmp_out = 5'b11111;
                next_state = state_0;
            end
        endcase
    end
endmodule

module decision_tree2 (
    CLOCK_50,
    rst,
    in_temp_max,
    in_temp_min,
    in_precipitation,
    in_wind,
    tmp_out);

    input CLOCK_50, rst;
    input[31:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;
    wire cmp_out0, cmp_out1, cmp_out2, cmp_out3, cmp_out4, cmp_out5, cmp_out6, cmp_out7, cmp_out8, 
        cmp_out9, cmp_out10, cmp_out11, cmp_out12, cmp_out13, cmp_out14, cmp_out15, cmp_out16, cmp_out17, cmp_out18;

    reg [31:0] bc0 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc1 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc2 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc3 = 32'b01000001100001000000000000000000; // 16.5
    reg [31:0] bc4 = 32'b01000001000010000000000000000000; // 8.5
    reg [31:0] bc5 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc6 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc7 = 32'b01000001011110000000000000000000; // 15.5
    reg [31:0] bc8 = 32'b01000001111011000000000000000000; // 29.5
    reg [31:0] bc9 = 32'b01000001100110000000000000000000; // 19
    reg [31:0] bc10 = 32'b01000000100100000000000000000000; // 4.5
    reg [31:0] bc11 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc12 = 32'b01000001101011000000000000000000; // 21.5
    reg [31:0] bc13 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc14 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc15 = 32'b01000001001110000000000000000000; // 11.5
    reg [31:0] bc16 = 32'b01000000101100000000000000000000; // 5.5 
    reg [31:0] bc17 = 32'b01000000100100000000000000000000; // 4.5
    reg [31:0] bc18 = 32'b01000001110001000000000000000000; // 24.5

    cmp cmp0(CLOCK_50, in_precipitation, bc0, cmp_out0);
    cmp cmp1(CLOCK_50, in_wind, bc1, cmp_out1);
    cmp cmp2(CLOCK_50, in_temp_min, bc2, cmp_out2);
    cmp cmp3(CLOCK_50, in_temp_max, bc3, cmp_out3);
    cmp cmp4(CLOCK_50, in_temp_min, bc4, cmp_out4);
    cmp cmp5(CLOCK_50, in_wind, bc5, cmp_out5);
    cmp cmp6(CLOCK_50, in_temp_min, bc6, cmp_out6);
    cmp cmp7(CLOCK_50, in_temp_max, bc7, cmp_out7);
    cmp cmp8(CLOCK_50, in_temp_max, bc8, cmp_out8);
    cmp cmp9(CLOCK_50, in_temp_max, bc9, cmp_out9);
    cmp cmp10(CLOCK_50, in_precipitation, bc10, cmp_out10);
    cmp cmp11(CLOCK_50, in_wind, bc11, cmp_out11);
    cmp cmp12(CLOCK_50, in_precipitation, bc12, cmp_out12);
    cmp cmp13(CLOCK_50, in_temp_min, bc13, cmp_out13);
    cmp cmp14(CLOCK_50, in_wind, bc14, cmp_out14);
    cmp cmp15(CLOCK_50, in_temp_min, bc15, cmp_out15);
    cmp cmp16(CLOCK_50, in_wind, bc16, cmp_out16);
    cmp cmp17(CLOCK_50, in_temp_max, bc17, cmp_out17);
    cmp cmp18(CLOCK_50, in_precipitation, bc18, cmp_out18);

    parameter state_0 = 5'b00000;
    parameter state_1 = 5'b00001;
    parameter state_2 = 5'b00010;
    parameter state_3 = 5'b00011;
    parameter state_4 = 5'b00100;
    parameter state_5 = 5'b00101;
    parameter state_6 = 5'b00110;
    parameter state_7 = 5'b00111;
    parameter state_8 = 5'b01000;
    parameter state_9 = 5'b01001;
    parameter state_10 = 5'b01010;
    parameter state_11 = 5'b01011;
    parameter state_12 = 5'b01100;
    parameter state_13 = 5'b01101;
    parameter state_14 = 5'b01110;
    parameter state_15 = 5'b01111;
    parameter state_16 = 5'b10000;
    parameter state_17 = 5'b10001;
    parameter state_18 = 5'b10010;

    
    reg[4:0] present_state, next_state;

    always @ (posedge CLOCK_50 or posedge rst) begin
        if(rst) begin
            present_state <= state_0;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @ (posedge CLOCK_50) begin
       case(present_state)
            state_0 : begin
                if (cmp_out0 == 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (cmp_out1 == 1) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (cmp_out2 == 1) begin
                    next_state = state_5;
                end
                else begin
                    next_state = state_6;
                end
            end
            state_3 : begin
                if (cmp_out3 == 1) begin
                    next_state = state_7;
                end
                else begin
                    next_state = state_8;
                end
            end
            state_4 : begin
                if (cmp_out4 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_9;
                end
            end
            state_5 : begin
                if (cmp_out5 == 1) begin
                    tmp_out = 5'b00100; // rainy;
                end
                else begin
                    next_state = state_10;
                end
            end
            state_6 : begin
                if (cmp_out6 == 1) begin
                    next_state = state_11;
                end
                else begin
                    next_state = state_12;
                end
            end
            state_7 : begin
                if (cmp_out7 == 1) begin
                    next_state = state_13;
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_8 : begin
                if (cmp_out8 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_14;
                end
            end
            state_9 : begin
                if (cmp_out9 == 1) begin
                    next_state = state_15;
                end
                else begin
                    next_state = state_16;
                end
            end
            state_10 : begin
                if (cmp_out10 == 1) begin
                    next_state = state_17;
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_11 : begin
                if (cmp_out11 == 1) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_12 : begin
                if (cmp_out12 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    next_state = state_18;
                end
            end
            state_13 : begin
                if (cmp_out13 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_14 : begin
                if (cmp_out14 == 1) begin
                    tmp_out = 3'b010; //drizzle 
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_15 : begin
                if (cmp_out15 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_16 : begin
                if (cmp_out16 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_17 : begin
                if (cmp_out17 == 1) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_18 : begin
                if (cmp_out18 == 1) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            default : begin
                tmp_out = 5'b11111;
                next_state = state_0;
            end
        endcase
    end
    
endmodule

module decision_tree3 (
    CLOCK_50,
    rst,
    in_temp_max,
    in_temp_min,
    in_precipitation,
    in_wind,
    tmp_out);

    input CLOCK_50, rst;
    input[31:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;
    wire cmp_out0, cmp_out1, cmp_out2, cmp_out3, cmp_out4, cmp_out5, cmp_out6, cmp_out7, cmp_out8, cmp_out9;

    reg [31:0] bc0 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc1 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc2 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc3 = 32'b01000001100001000000000000000000; // 16.5
    reg [31:0] bc4 = 32'b01000000101100000000000000000000; // 5.5
    reg [31:0] bc5 = 32'b01000000101100000000000000000000; // 5.5
    reg [31:0] bc6 = 32'b01000000101100000000000000000000; // 5.5
    reg [31:0] bc7 = 32'b01000000111100000000000000000000; // 7.5
    reg [31:0] bc8 = 32'b01000001001010000000000000000000; // 10.5
    reg [31:0] bc9 = 32'b01000001001110000000000000000000; // 11.5

    cmp cmp0(CLOCK_50, in_precipitation, bc0, cmp_out0);
    cmp cmp1(CLOCK_50, in_wind, bc1, cmp_out1);
    cmp cmp2(CLOCK_50, in_temp_min, bc2, cmp_out2);
    cmp cmp3(CLOCK_50, in_temp_max, bc3, cmp_out3);
    cmp cmp4(CLOCK_50, in_temp_max, bc4, cmp_out4);
    cmp cmp5(CLOCK_50, in_temp_max, bc5, cmp_out5);
    cmp cmp6(CLOCK_50, in_temp_max, bc6, cmp_out6);
    cmp cmp7(CLOCK_50, in_temp_max, bc7, cmp_out7);
    cmp cmp8(CLOCK_50, in_precipitation, bc8, cmp_out8);
    cmp cmp9(CLOCK_50, in_temp_min, bc9, cmp_out9);

    parameter state_0 = 5'b00000;
    parameter state_1 = 5'b00001;
    parameter state_2 = 5'b00010;
    parameter state_3 = 5'b00011;
    parameter state_4 = 5'b00100;
    parameter state_5 = 5'b00101;
    parameter state_6 = 5'b00110;
    parameter state_7 = 5'b00111;
    parameter state_8 = 5'b01000;
    parameter state_9 = 5'b01001;

    
    reg[4:0] present_state, next_state;

    always @ (posedge CLOCK_50 or posedge rst) begin
        if(rst) begin
            present_state <= state_0;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @ (posedge CLOCK_50) begin
       case(present_state)
            state_0 : begin
                if (cmp_out0 == 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (cmp_out1 == 1) begin
                    tmp_out = 5'b10000; // sunny;
                end
                else begin
                    next_state = state_3;
                end
            end
            state_2 : begin
                if (cmp_out2 == 1) begin
                    next_state = state_4;
                end
                else begin
                    next_state = state_5;
                end
            end
            state_3 : begin
                if (cmp_out3 == 1) begin
                    next_state = state_6;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_4 : begin
                if (cmp_out4 == 1) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    next_state = state_7;
                end
            end
            state_5 : begin
                if (cmp_out5 == 1) begin
                    next_state = state_8;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_6 : begin
                if (cmp_out6 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_9;
                end
            end
            state_7 : begin
                if (cmp_out7 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_8 : begin
                if (cmp_out8 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_9 : begin
                if (cmp_out9 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 3'b010; // drizzle 
                end
            end
            default : begin
                tmp_out = 5'b11111;
                next_state = state_0;
            end
        endcase
    end
    
endmodule

module decision_tree4 (
    CLOCK_50,
    rst,
    in_temp_max,
    in_temp_min,
    in_precipitation,
    in_wind,
    tmp_out);

    input CLOCK_50, rst;
    input[31:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;
    wire cmp_out0, cmp_out1, cmp_out2, cmp_out3, cmp_out4, cmp_out5, cmp_out6, cmp_out7, cmp_out8, 
        cmp_out9, cmp_out10, cmp_out11;

    reg [31:0] bc0 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc1 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc2 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc3 = 32'b01000000011000000000000000000000; // 3.5
    reg [31:0] bc4 = 32'b01000001100011000000000000000000; // 17.5
    reg [31:0] bc5 = 32'b01000000100100000000000000000000; // 4.5
    reg [31:0] bc6 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc7 = 32'b01000000110100000000000000000000; // 6.5
    reg [31:0] bc8 = 32'b01000000100000000000000000000000; // 4.0
    reg [31:0] bc9 = 32'b01000001001100000000000000000000; // 11.0
    reg [31:0] bc10 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc11 = 32'b01000000101100000000000000000000; // 5.5
    
    cmp cmp0(CLOCK_50, in_precipitation, bc0, cmp_out0);
    cmp cmp1(CLOCK_50, in_wind, bc1, cmp_out1);
    cmp cmp2(CLOCK_50, in_temp_min, bc2, cmp_out2);
    cmp cmp3(CLOCK_50, in_temp_max, bc3, cmp_out3);
    cmp cmp4(CLOCK_50, in_temp_max, bc4, cmp_out4);
    cmp cmp5(CLOCK_50, in_precipitation, bc5, cmp_out5);
    cmp cmp6(CLOCK_50, in_temp_max, bc6, cmp_out6);
    cmp cmp7(CLOCK_50, in_temp_max, bc7, cmp_out7);
    cmp cmp8(CLOCK_50, in_wind, bc8, cmp_out8);
    cmp cmp9(CLOCK_50, in_precipitation, bc9, cmp_out9);
    cmp cmp10(CLOCK_50, in_temp_max, bc10, cmp_out10);
    cmp cmp11(CLOCK_50, in_wind, bc11, cmp_out11);

    parameter state_0 = 5'b00000;
    parameter state_1 = 5'b00001;
    parameter state_2 = 5'b00010;
    parameter state_3 = 5'b00011;
    parameter state_4 = 5'b00100;
    parameter state_5 = 5'b00101;
    parameter state_6 = 5'b00110;
    parameter state_7 = 5'b00111;
    parameter state_8 = 5'b01000;
    parameter state_9 = 5'b01001;
    parameter state_10 = 5'b01010;
    parameter state_11 = 5'b01011;

    
    reg[4:0] present_state, next_state;

    always @ (posedge CLOCK_50 or posedge rst) begin
        if(rst) begin
            present_state <= state_0;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @ (posedge CLOCK_50) begin
       case(present_state)
            state_0 : begin
                if (cmp_out0 == 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (cmp_out1 == 1) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (cmp_out2 == 1) begin
                    next_state = state_5;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_3 : begin
                if (cmp_out3 == 1) begin
                    next_state = state_6;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_4 : begin
                if (cmp_out4 == 1) begin
                    next_state = state_7;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_5 : begin
                if (cmp_out5 == 1) begin
                    next_state = state_8;
                end
                else begin
                    next_state = state_9;
                end
            end
            state_6 : begin
                if (cmp_out6 == 1) begin
                    next_state = state_10;
                end
                else begin
                    tmp_out = 3'b010; // drizzle
                end
            end
            state_7 : begin
                if (cmp_out7 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_11;
                end
            end
            state_8 : begin
                if (cmp_out8 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_9 : begin
                if (cmp_out9 == 1) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_10 : begin
                if (cmp_out10 == 1) begin
                    tmp_out = 3'b010; // drizzle
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_11 : begin
                if (cmp_out11 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            default : begin
                tmp_out = 5'b11111;
                next_state = state_0;
            end
        endcase
    end
    
endmodule

module decision_tree5 (
    CLOCK_50,
    rst,
    in_temp_max,
    in_temp_min,
    in_precipitation,
    in_wind,
    tmp_out);

    input CLOCK_50, rst;
    input[31:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;
    wire cmp_out0, cmp_out1, cmp_out2, cmp_out3, cmp_out4, cmp_out5, cmp_out6, cmp_out7, cmp_out8, 
        cmp_out9, cmp_out10, cmp_out11, cmp_out12, cmp_out13, cmp_out14, cmp_out15, cmp_out16, cmp_out17;

    reg [31:0] bc0 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc1 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc2 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc3 = 32'b01000001100111000000000000000000; // 19.5
    reg [31:0] bc4 = 32'b01000001100001000000000000000000; // 16.5
    reg [31:0] bc5 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc6 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc7 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc8 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc9 = 32'b01000001100111000000000000000000; // 19.5
    reg [31:0] bc10 = 32'b01000000100000000000000000000000; // 4
    reg [31:0] bc11 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc12 = 32'b01000001101011000000000000000000; // 21.5
    reg [31:0] bc13 = 32'b01000000111100000000000000000000; // 7.5
    reg [31:0] bc14 = 32'b01000000011000000000000000000000; // 3.5
    reg [31:0] bc15 = 32'b01000001001010000000000000000000; // 10.5
    reg [31:0] bc16 = 32'b01000000101100000000000000000000; // 5.5
    reg [31:0] bc17 = 32'b10111111000000000000000000000000; // -0.5
    reg [31:0] bc18 = 32'b01000000010000000000000000000000; // 3.0
    reg [31:0] bc19 = 32'b01000001101101000000000000000000; // 22.5

    cmp cmp0(CLOCK_50, in_precipitation, bc0, cmp_out0);
    cmp cmp1(CLOCK_50, in_wind, bc1, cmp_out1);
    cmp cmp2(CLOCK_50, in_temp_min, bc2, cmp_out2);
    cmp cmp3(CLOCK_50, in_temp_max, bc3, cmp_out3);
    cmp cmp4(CLOCK_50, in_temp_max, bc4, cmp_out4);
    cmp cmp5(CLOCK_50, iin_wind, bc5, cmp_out5);
    cmp cmp6(CLOCK_50, in_temp_min, bc6, cmp_out6);
    cmp cmp7(CLOCK_50, in_temp_min, bc7, cmp_out7);
    cmp cmp8(CLOCK_50, in_wind, bc8, cmp_out8);
    cmp cmp9(CLOCK_50, in_temp_max, bc9, cmp_out9);
    cmp cmp10(CLOCK_50, in_wind, bc10, cmp_out10);
    cmp cmp11(CLOCK_50, in_wind, bc11, cmp_out11);
    cmp cmp12(CLOCK_50, in_precipitation, bc12, cmp_out12);
    cmp cmp13(CLOCK_50, in_temp_min, bc13, cmp_out13);
    cmp cmp14(CLOCK_50, in_temp_max, bc14, cmp_out14);
    cmp cmp15(CLOCK_50, in_temp_max, bc15, cmp_out15);
    cmp cmp16(CLOCK_50, in_wind, bc16, cmp_out16);
    cmp cmp17(CLOCK_50, in_temp_min, bc17, cmp_out17);
    cmp cmp18(CLOCK_50, in_precipitation, bc18, cmp_out18);
    cmp cmp19(CLOCK_50, in_precipitation, bc19, cmp_out19);

    parameter state_0 = 5'b00000;
    parameter state_1 = 5'b00001;
    parameter state_2 = 5'b00010;
    parameter state_3 = 5'b00011;
    parameter state_4 = 5'b00100;
    parameter state_5 = 5'b00101;
    parameter state_6 = 5'b00110;
    parameter state_7 = 5'b00111;
    parameter state_8 = 5'b01000;
    parameter state_9 = 5'b01001;
    parameter state_10 = 5'b01010;
    parameter state_11 = 5'b01011;
    parameter state_12 = 5'b01100;
    parameter state_13 = 5'b01101;
    parameter state_14 = 5'b01110;
    parameter state_15 = 5'b01111;
    parameter state_16 = 5'b10000;
    parameter state_17 = 5'b10001;
    parameter state_18 = 5'b10010;
    parameter state_19 = 5'b10011;

    
    reg[4:0] present_state, next_state;

    always @ (posedge CLOCK_50 or posedge rst) begin
        if(rst) begin
            present_state <= state_0;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @ (posedge CLOCK_50) begin
       case(present_state)
            state_0 : begin
                if (cmp_out0 == 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (cmp_out1 == 1) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (cmp_out2 == 1) begin
                    next_state = state_5;
                end
                else begin
                    next_state = state_6;
                end
            end
            state_3 : begin
                if (cmp_out3 == 1) begin
                    next_state = state_7;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_4 : begin
                if (cmp_out4 == 1) begin
                    next_state = state_8;
                end
                else begin
                    next_state = state_9;
                end
            end
            state_5 : begin
                if (cmp_out5 == 1) begin
                    tmp_out = 5'b00100; // rainy;
                end
                else begin
                    next_state = state_10;
                end
            end
            state_6 : begin
                if (cmp_out6 == 1) begin
                    next_state = state_11;
                end
                else begin
                    next_state = state_12;
                end
            end
            state_7 : begin
                if (cmp_out7 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_13;
                end
            end
            state_8 : begin
                if (cmp_out8 == 1) begin
                    next_state = state_14;
                end
                else begin
                    next_state = state_15;
                end
            end
            state_9 : begin
                if (cmp_out9 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_16;
                end
            end
            state_10 : begin
                if (cmp_out10 == 1) begin
                    next_state = state_17;
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_11 : begin
                if (cmp_out11 == 1) begin
                    next_state = state_18;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_12 : begin
                if (cmp_out12 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    next_state = state_19;
                end
            end
            state_13 : begin
                if (cmp_out13 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_14 : begin
                if (cmp_out14 == 1) begin
                    tmp_out = 3'b010; //drizzle 
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_15 : begin
                if (cmp_out15 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_16 : begin
                if (cmp_out16 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_17 : begin
                if (cmp_out17 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_18 : begin
                if (cmp_out18 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_19 : begin
                if (cmp_out19 == 1) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            default : begin
                tmp_out = 5'b11111;
                next_state = state_0;
            end
        endcase
    end
    
endmodule

module decision_tree6 (
    CLOCK_50,
    rst,
    in_temp_max,
    in_temp_min,
    in_precipitation,
    in_wind,
    tmp_out);

    input CLOCK_50, rst;
    input[31:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;
    wire cmp_out0, cmp_out1, cmp_out2, cmp_out3, cmp_out4, cmp_out5, cmp_out6, cmp_out7, cmp_out8, 
        cmp_out9, cmp_out10, cmp_out11, cmp_out12, cmp_out13, cmp_out14;

    reg [31:0] bc0 = 32'b01000001011110000000000000000000; // 15.5
    reg [31:0] bc1 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc2 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc3 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc4 = 32'b01000001001110000000000000000000; // 11.5
    reg [31:0] bc5 = 32'b01000001100101000000000000000000; // 18.5
    reg [31:0] bc6 = 32'b01000000100100000000000000000000; // 4.5
    reg [31:0] bc7 = 32'b01000000100100000000000000000000; // 4.5
    reg [31:0] bc8 = 32'b01000001100011000000000000000000; // 17.5
    reg [31:0] bc9 = 32'b01000000101100000000000000000000; // 5.5
    reg [31:0] bc10 = 32'b01000001111001000000000000000000; // 28.5
    reg [31:0] bc11 = 32'b01000000011000000000000000000000; // 3.5
    reg [31:0] bc12 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc13 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc14 = 32'b00111111110000000000000000000000; // 1.5


    cmp cmp0(CLOCK_50, in_temp_max, bc0, cmp_out0);
    cmp cmp1(CLOCK_50, in_temp_min, bc1, cmp_out1);
    cmp cmp2(CLOCK_50, in_precipitation, bc2, cmp_out2);
    cmp cmp3(CLOCK_50, in_precipitation, bc3, cmp_out3);
    cmp cmp4(CLOCK_50, in_temp_max, bc4, cmp_out4);
    cmp cmp5(CLOCK_50, in_temp_max, bc5, cmp_out5);
    cmp cmp6(CLOCK_50, in_wind, bc6, cmp_out6);
    cmp cmp7(CLOCK_50, in_temp_min, bc7, cmp_out7);
    cmp cmp8(CLOCK_50, in_temp_max, bc8, cmp_out8);
    cmp cmp9(CLOCK_50, in_wind, bc9, cmp_out9);
    cmp cmp10(CLOCK_50, in_precipitation, bc10, cmp_out10);
    cmp cmp11(CLOCK_50, in_temp_min, bc11, cmp_out11);
    cmp cmp12(CLOCK_50, in_wind, bc12, cmp_out12);
    cmp cmp13(CLOCK_50, in_wind, bc13, cmp_out13);
    cmp cmp14(CLOCK_50, in_wind, bc14, cmp_out14);


    parameter state_0 = 5'b00000;
    parameter state_1 = 5'b00001;
    parameter state_2 = 5'b00010;
    parameter state_3 = 5'b00011;
    parameter state_4 = 5'b00100;
    parameter state_5 = 5'b00101;
    parameter state_6 = 5'b00110;
    parameter state_7 = 5'b00111;
    parameter state_8 = 5'b01000;
    parameter state_9 = 5'b01001;
    parameter state_10 = 5'b01010;
    parameter state_11 = 5'b01011;
    parameter state_12 = 5'b01100;
    parameter state_13 = 5'b01101;
    parameter state_14 = 5'b01110;

    
    reg[4:0] present_state, next_state;

    always @ (posedge CLOCK_50 or posedge rst) begin
        if(rst) begin
            present_state <= state_0;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @ (posedge CLOCK_50) begin
       case(present_state)
            state_0 : begin
                if (cmp_out0 == 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (cmp_out1 == 1) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (cmp_out2 == 1) begin
                    next_state = state_5;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_3 : begin
                if (cmp_out3 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_6;
                end
            end
            state_4 : begin
                if (cmp_out4 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    next_state = state_7;
                end
            end
            state_5 : begin
                if (cmp_out5 == 1) begin
                    next_state = state_8;
                end
                else begin
                    next_state = state_9;
                end
            end
            state_6 : begin
                if (cmp_out6 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    next_state = state_10;
                end
            end
            state_7 : begin
                if (cmp_out7 == 1) begin
                    next_state = state_11;
                end
                else begin
                    next_state = state_12;
                end
            end
            state_8 : begin
                if (cmp_out8 == 1) begin
                    next_state = state_13;
                end
                else begin
                    next_state = state_14;
                end
            end
            state_9 : begin
                if (cmp_out9 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_10 : begin
                if (cmp_out10 == 1) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_11 : begin
                if (cmp_out11 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_12 : begin
                if (cmp_out12 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_13 : begin
                if (cmp_out13 == 1) begin
                    tmp_out = 5'b00010; // foggy
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_14 : begin
                if (cmp_out14 == 1) begin
                     tmp_out = 5'b00010; // foggy
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            default : begin
                tmp_out = 5'b11111;
                next_state = state_0;
            end
        endcase
    end
    
endmodule

module decision_tree7 (
    CLOCK_50,
    rst,
    in_temp_max,
    in_temp_min,
    in_precipitation,
    in_wind,
    tmp_out);

    input CLOCK_50, rst;
    input[31:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;
    wire cmp_out0, cmp_out1, cmp_out2, cmp_out3, cmp_out4, cmp_out5, cmp_out6, cmp_out7, cmp_out8, 
        cmp_out9, cmp_out10, cmp_out11, cmp_out12, cmp_out13, cmp_out14;

    reg [31:0] bc0 = 32'b01000001100111000000000000000000; // 19.5
    reg [31:0] bc1 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc2 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc3 = 32'b01000000110100000000000000000000; // 6.5
    reg [31:0] bc4 = 32'b01000000100100000000000000000000; // 4.5
    reg [31:0] bc5 = 32'b01000001101101000000000000000000; // 22.5
    reg [31:0] bc6 = 32'b10111111000000000000000000000000; // -0.5
    reg [31:0] bc7 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc8 = 32'b01000000011000000000000000000000; // 3.5
    reg [31:0] bc9 = 32'b01000001101011000000000000000000; // 21.5
    reg [31:0] bc10 = 32'b01000001010010000000000000000000; // 12.5
    reg [31:0] bc11 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc12 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc13 = 32'b01000000111000000000000000000000; // 7.0
    reg [31:0] bc14 = 32'b01000001011010000000000000000000; // 14.5

    cmp cmp0(CLOCK_50, in_temp_max, bc0, cmp_out0);
    cmp cmp1(CLOCK_50, in_precipitation, bc1, cmp_out1);
    cmp cmp2(CLOCK_50, in_precipitation, bc2, cmp_out2);
    cmp cmp3(CLOCK_50, in_temp_max, bc3, cmp_out3);
    cmp cmp4(CLOCK_50, in_temp_max, bc4, cmp_out4);
    cmp cmp5(CLOCK_50, in_temp_max, bc5, cmp_out5);
    cmp cmp6(CLOCK_50, in_temp_min, bc6, cmp_out6);
    cmp cmp7(CLOCK_50, in_wind, bc7, cmp_out7);
    cmp cmp8(CLOCK_50, in_wind, bc8, cmp_out8);
    cmp cmp9(CLOCK_50, in_precipitation, bc9, cmp_out9);
    cmp cmp10(CLOCK_50, in_temp_min, bc10, cmp_out10);
    cmp cmp11(CLOCK_50, in_wind, bc11, cmp_out11);
    cmp cmp12(CLOCK_50, in_temp_min, bc12, cmp_out12);
    cmp cmp13(CLOCK_50, in_temp_max, bc13, cmp_out13);
    cmp cmp14(CLOCK_50, in_temp_min, bc14, cmp_out14);

    parameter state_0 = 5'b00000;
    parameter state_1 = 5'b00001;
    parameter state_2 = 5'b00010;
    parameter state_3 = 5'b00011;
    parameter state_4 = 5'b00100;
    parameter state_5 = 5'b00101;
    parameter state_6 = 5'b00110;
    parameter state_7 = 5'b00111;
    parameter state_8 = 5'b01000;
    parameter state_9 = 5'b01001;
    parameter state_10 = 5'b01010;
    parameter state_11 = 5'b01011;
    parameter state_12 = 5'b01100;
    parameter state_13 = 5'b01101;
    parameter state_14 = 5'b01110;

    
    reg[4:0] present_state, next_state;

    always @ (posedge CLOCK_50 or posedge rst) begin
        if(rst) begin
            present_state <= state_0;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @ (posedge CLOCK_50) begin
       case(present_state)
            state_0 : begin
                if (cmp_out0 == 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (cmp_out1 == 1) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (cmp_out2 == 1) begin
                    next_state = state_5;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_3 : begin
                if (cmp_out3 == 1) begin
                    next_state = state_6;
                end
                else begin
                    next_state = state_7;
                end
            end
            state_4 : begin
                if (cmp_out4 == 1) begin
                    next_state = state_8;
                end
                else begin
                    next_state = state_9;
                end
            end
            state_5 : begin
                if (cmp_out5 == 1) begin
                    next_state = state_10;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_6 : begin
                if (cmp_out6 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_11;
                end
            end
            state_7 : begin
                if (cmp_out7 == 1) begin
                    next_state = state_12;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_8 : begin
                if (cmp_out8 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_9 : begin
                if (cmp_out9 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    next_state = state_13;
                end
            end
            state_10 : begin
                if (cmp_out10 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_14;
                end
            end
            state_11 : begin
                if (cmp_out11 == 1) begin
                    tmp_out = 5'b00010; // foggy
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_12 : begin
                if (cmp_out12 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_13 : begin
                if (cmp_out13 == 1) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_14 : begin
                if (cmp_out14 == 1) begin
                     tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            default : begin
                tmp_out = 5'b11111;
                next_state = state_0;
            end
        endcase
    end
    
endmodule

module decision_tree8 (
    CLOCK_50,
    rst,
    in_temp_max,
    in_temp_min,
    in_precipitation,
    in_wind,
    tmp_out);

    input CLOCK_50, rst;
    input[31:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;
    wire cmp_out0, cmp_out1, cmp_out2, cmp_out3, cmp_out4, cmp_out5, cmp_out6, cmp_out7, cmp_out8, 
        cmp_out9, cmp_out10, cmp_out11;

    reg [31:0] bc0 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc1 = 32'b01000001100111000000000000000000; // 19.5
    reg [31:0] bc2 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc3 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc4 = 32'b01000000101100000000000000000000; // 5.5
    reg [31:0] bc5 = 32'b01000000100100000000000000000000; // 4.5
    reg [31:0] bc6 = 32'b11000000011000000000000000000000; // -3.5
    reg [31:0] bc7 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc8 = 32'b01000001000100000000000000000000; // 9.0
    reg [31:0] bc9 = 32'b11000000001000000000000000000000; // -2.5
    reg [31:0] bc10 = 32'b01000001000010000000000000000000; // 8.5
    reg [31:0] bc11 = 32'b01000000100100000000000000000000; // 4.5

    cmp cmp0(CLOCK_50, in_precipitation, bc0, cmp_out0);
    cmp cmp1(CLOCK_50, in_temp_max, bc1, cmp_out1);
    cmp cmp2(CLOCK_50, in_temp_min, bc2, cmp_out2);
    cmp cmp3(CLOCK_50, in_temp_min, bc3, cmp_out3);
    cmp cmp4(CLOCK_50, in_wind, bc4, cmp_out4);
    cmp cmp5(CLOCK_50, in_temp_max, bc5, cmp_out5);
    cmp cmp6(CLOCK_50, in_temp_min, bc6, cmp_out6);
    cmp cmp7(CLOCK_50, in_wind, bc7, cmp_out7);
    cmp cmp8(CLOCK_50, in_temp_max, bc8, cmp_out8);
    cmp cmp9(CLOCK_50, in_temp_min, bc9, cmp_out9);
    cmp cmp10(CLOCK_50, in_temp_max, bc10, cmp_out10);
    cmp cmp11(CLOCK_50, in_precipitation, bc11, cmp_out11);

    parameter state_0 = 5'b00000;
    parameter state_1 = 5'b00001;
    parameter state_2 = 5'b00010;
    parameter state_3 = 5'b00011;
    parameter state_4 = 5'b00100;
    parameter state_5 = 5'b00101;
    parameter state_6 = 5'b00110;
    parameter state_7 = 5'b00111;
    parameter state_8 = 5'b01000;
    parameter state_9 = 5'b01001;
    parameter state_10 = 5'b01010;
    parameter state_11 = 5'b01011;

    
    reg[4:0] present_state, next_state;

    always @ (posedge CLOCK_50 or posedge rst) begin
        if(rst) begin
            present_state <= state_0;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @ (posedge CLOCK_50) begin
       case(present_state)
            state_0 : begin
                if (cmp_out0 == 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (cmp_out1 == 1) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (cmp_out2 == 1) begin
                    next_state = state_5;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_3 : begin
                if (cmp_out3 == 1) begin
                    next_state = state_6;
                end
                else begin
                    next_state = state_7;
                end
            end
            state_4 : begin
                if (cmp_out4 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_5 : begin
                if (cmp_out5 == 1) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    next_state = state_8;
                end
            end
            state_6 : begin
                if (cmp_out6 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_9;
                end
            end
            state_7 : begin
                if (cmp_out7 == 1) begin
                    next_state = state_10;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_8 : begin
                if (cmp_out8 == 1) begin
                    next_state = state_11;
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_9 : begin
                if (cmp_out9 == 1) begin
                    tmp_out = 5'b00010; // foggy
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_10 : begin
                if (cmp_out10 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_11 : begin
                if (cmp_out11 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            default : begin
                tmp_out = 5'b11111;
                next_state = state_0;
            end
        endcase
    end
    
endmodule

module decision_tree9 (
    CLOCK_50,
    rst,
    in_temp_max,
    in_temp_min,
    in_precipitation,
    in_wind,
    tmp_out);

    input CLOCK_50, rst;
    input[31:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;
    wire cmp_out0, cmp_out1, cmp_out2, cmp_out3, cmp_out4, cmp_out5, cmp_out6, cmp_out7, cmp_out8, 
        cmp_out9, cmp_out10, cmp_out11, cmp_out12, cmp_out13, cmp_out14, cmp_out15, cmp_out16;

    reg [31:0] bc0 = 32'b01000001100011000000000000000000; // 17.5
    reg [31:0] bc1 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc2 = 32'b00111111000000000000000000000000; // 0.5
    reg [31:0] bc3 = 32'b01000000011000000000000000000000; // 3.5
    reg [31:0] bc4 = 32'b01000000100100000000000000000000; // 4.5
    reg [31:0] bc5 = 32'b01000001101101000000000000000000; // 22.5
    reg [31:0] bc6 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc7 = 32'b01000000001000000000000000000000; // 6.5
    reg [31:0] bc8 = 32'b01000000001000000000000000000000; // 2.5
    reg [31:0] bc9 = 32'b01000000011000000000000000000000; // 3.5
    reg [31:0] bc10 = 32'b01000001010010000000000000000000; // 12.5
    reg [31:0] bc11 = 32'b01000001010010000000000000000000; // 12.5
    reg [31:0] bc12 = 32'b01000001000010000000000000000000; // 8.5
    reg [31:0] bc13 = 32'b00111111110000000000000000000000; // 1.5
    reg [31:0] bc14 = 32'b01000000101100000000000000000000; // 5.5
    reg [31:0] bc15 = 32'b01000001100111000000000000000000; // 19.5
    reg [31:0] bc16 = 32'b01000000100100000000000000000000; // 4.5

    cmp cmp0(CLOCK_50, in_temp_max, bc0, cmp_out0);
    cmp cmp1(CLOCK_50, in_precipitation, bc1, cmp_out1);
    cmp cmp2(CLOCK_50, in_precipitation, bc2, cmp_out2);
    cmp cmp3(CLOCK_50, in_temp_max, bc3, cmp_out3);
    cmp cmp4(CLOCK_50, in_wind, bc4, cmp_out4);
    cmp cmp5(CLOCK_50, in_temp_max, bc5, cmp_out5);
    cmp cmp6(CLOCK_50, in_wind, bc6, cmp_out6);
    cmp cmp7(CLOCK_50, in_temp_max, bc7, cmp_out7);
    cmp cmp8(CLOCK_50, in_temp_min, bc8, cmp_out8);
    cmp cmp9(CLOCK_50, in_precipitation, bc9, cmp_out9);
    cmp cmp10(CLOCK_50, in_temp_min, bc10, cmp_out10);
    cmp cmp11(CLOCK_50, in_temp_min, bc11, cmp_out11);
    cmp cmp12(CLOCK_50, in_temp_max, bc12, cmp_out12);
    cmp cmp13(CLOCK_50, in_wind, bc13, cmp_out13);
    cmp cmp14(CLOCK_50, in_temp_max, bc14, cmp_out14);
    cmp cmp15(CLOCK_50, in_temp_max, bc15, cmp_out15);
    cmp cmp16(CLOCK_50, in_wind, bc16, cmp_out16);


    parameter state_0 = 5'b00000;
    parameter state_1 = 5'b00001;
    parameter state_2 = 5'b00010;
    parameter state_3 = 5'b00011;
    parameter state_4 = 5'b00100;
    parameter state_5 = 5'b00101;
    parameter state_6 = 5'b00110;
    parameter state_7 = 5'b00111;
    parameter state_8 = 5'b01000;
    parameter state_9 = 5'b01001;
    parameter state_10 = 5'b01010;
    parameter state_11 = 5'b01011;
    parameter state_12 = 5'b01100;
    parameter state_13 = 5'b01101;
    parameter state_14 = 5'b01110;
    parameter state_15 = 5'b01111;
    parameter state_16 = 5'b10000;

    reg[4:0] present_state, next_state;

    always @ (posedge CLOCK_50 or posedge rst) begin
        if(rst) begin
            present_state <= state_0;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @ (posedge CLOCK_50) begin
       case(present_state)
            state_0 : begin
                if (cmp_out0 == 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (cmp_out1 == 1) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (cmp_out2 == 1) begin
                    next_state = state_5;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_3 : begin
                if (cmp_out3 == 1) begin
                    next_state = state_6;
                end
                else begin
                    next_state = state_7;
                end
            end
            state_4 : begin
                if (cmp_out4 == 1) begin
                    next_state = state_8;
                end
                else begin
                    next_state = state_9;
                end
            end
            state_5 : begin
                if (cmp_out5 == 1) begin
                    next_state = state_10;
                end
                else begin
                    next_state = state_11;
                end
            end
            state_6 : begin
                if (cmp_out6 == 1) begin
                    tmp_out = 3'b010; // drizzle
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_7 : begin
                if (cmp_out7 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_12;
                end
            end
            state_8 : begin
                if (cmp_out8 == 1) begin
                    next_state = state_13;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_9 : begin
                if (cmp_out9 == 1) begin
                    next_state = state_14;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_10 : begin
                if (cmp_out10 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_15;
                end
            end
            state_11 : begin
                if (cmp_out11 == 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_16;
                end
            end
            state_12 : begin
                if (cmp_out12 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_13 : begin
                if (cmp_out13 == 1) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_14 : begin
                if (cmp_out14 == 1) begin
                     tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_15 : begin
                if (cmp_out15 == 1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_16 : begin
                if (cmp_out16 == 1) begin
                     tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            default : begin
                tmp_out = 5'b11111;
                next_state = state_0;
            end
        endcase
    end
    
endmodule

module majority_vote(
    CLOCK_50,
    out1, out2, out3, out4, out5, out6, out7, out8, out9,
    result);
    input CLOCK_50;
    input [4:0] out1, out2, out3, out4, out5, out6, out7, out8, out9;
    output wire [2:0] result;

    wire [4:0] tree1;
    assign tree1 = out1;
    wire [4:0] tree2;
    assign tree2 = out2;
    wire [4:0] tree3;
    assign tree3 = out3;
    wire [4:0] tree4;
    assign tree4 = out4;
    wire [4:0] tree5;
    assign tree5 = out5;
    wire [4:0] tree6;
    assign tree6 = out6;
    wire [4:0] tree7;
    assign tree7 = out7;
    wire [4:0] tree8;
    assign tree8 = out8;
    wire [4:0] tree9;
    assign tree9 = out9;

    // weather count
    wire [4:0] drizzle_1;
    assign drizzle_1 = out1[0] + out2[0] + out3[0] + out4[0] + out5[0] + out6[0] + out7[0] + out8[0] + out9[0];
    wire [4:0] fog_2;
    assign fog_2 = out1[1] + out2[1] + out3[1] + out4[1] + out5[1] + out6[1] + out7[1] + out8[1] + out9[1];
    wire [4:0] rainy_3;
    assign rainy_3 = out1[2] + out2[2] + out3[2] + out4[2] + out5[2] + out6[2] + out7[2] + out8[2] + out9[2];
    wire [4:0] snowy_4;
    assign snowy_4 = out1[3] + out2[3] + out3[3] + out4[3] + out5[3] + out6[3] + out7[3] + out8[3] + out9[3];
    wire [4:0] sunny_5;
    assign sunny_5 = out1[4] + out2[4] + out3[4] + out4[4] + out5[4] + out6[4] + out7[4] + out8[4] + out9[4];    
    
    wire [4:0] winner_cnt_1vs2;
    wire [4:0] winner_cnt_3vs4;
    wire [4:0] winner_cnt_12vs34;

    wire [2:0] winner_1vs2;
    wire [2:0] winner_3vs4;
    wire [2:0] winner_12vs34;

    wire [2:0] winner;

    assign winner_cnt_1vs2 = drizzle_1 > fog_2 ? drizzle_1 : fog_2;
    assign winner_1vs2 = drizzle_1 > fog_2 ? 1 : 2;
    assign winner_cnt_3vs4 = rainy_3 > snowy_4 ? rainy_3 : snowy_4;
    assign winner_3vs4 = rainy_3 > snowy_4 ? 3 : 4;   

    assign winner_cnt_12vs34 = winner_cnt_1vs2 > winner_cnt_3vs4 ? winner_cnt_1vs2 : winner_cnt_3vs4;
    assign winner_12vs34 = winner_cnt_1vs2 > winner_cnt_3vs4 ? winner_1vs2 : winner_3vs4;

    assign winner = winner_cnt_12vs34 > sunny_5 ? winner_12vs34 : 5; 
    assign result = winner; 
endmodule

module cmp(CLOCK_50, in1, in2, out);
	input CLOCK_50;
	input [31:0] in1, in2;
	output reg out;
	wire in1_neg, in2_neg;
	assign in1_neg = in1[31];
	assign in2_neg = in2[31];

	always @ (posedge CLOCK_50) begin
		if(in1_neg == 1 && in2_neg == 1) begin // neg <= neg
			if(in1[30:0] >= in2[30:0]) begin
				out = 1;
			end
			else begin
				out = 0;
			end
		end
		else if(in1_neg == 1 && in2_neg == 0) begin // neg <= pos
			out = 1;
		end
		else if(in1_neg == 0 && in2_neg == 1) begin // pos <= neg
			out = 0;
		end
		else begin  // pos <= pos
			if(in1[30:0] <= in2[30:0]) begin
				out = 1;
			end
			else begin
				out = 0;
			end                           
		end
	end
endmodule

module testbench;
    reg[31:0] in_temp_max, in_temp_min, in_precipitation, in_wind;
    wire[4:0] out1, out2, out3, out4, out5, out6, out7, out8, out9;
    wire clock;
    reg rst;
    wire [3:0] result;
    
    decision_tree1 tree1(clock, rst, in_temp_max, in_temp_min, in_precipitation, in_wind, out1);
    decision_tree2 tree2(clock, rst, in_temp_max, in_temp_min, in_precipitation, in_wind, out2);
    decision_tree3 tree3(clock, rst, in_temp_max, in_temp_min, in_precipitation, in_wind, out3);
    decision_tree4 tree4(clock, rst, in_temp_max, in_temp_min, in_precipitation, in_wind, out4);
    decision_tree5 tree5(clock, rst, in_temp_max, in_temp_min, in_precipitation, in_wind, out5);
    decision_tree6 tree6(clock, rst, in_temp_max, in_temp_min, in_precipitation, in_wind, out6);
    decision_tree7 tree7(clock, rst, in_temp_max, in_temp_min, in_precipitation, in_wind, out7);
    decision_tree8 tree8(clock, rst, in_temp_max, in_temp_min, in_precipitation, in_wind, out8);
    decision_tree9 tree9(clock, rst, in_temp_max, in_temp_min, in_precipitation, in_wind, out9);
    majority_vote vote(clock, out1, out2, out3, out4, out5, out6, out7, out8, out9 ,result);

    initial begin
        in_temp_max = 32'b01000001011010000000000000000000; // 14.5
        in_temp_min = 32'b10111111000000000000000000000000; // -0.5
        in_precipitation = 32'b00111111101001100110011001100110; // 1.3
        in_wind = 32'b01000000100000000000000000000000; // 4
        rst = 0;
        # 50 rst = 1;
        # 30 rst = 0;
        # 100;
    end
 
endmodule
