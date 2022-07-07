module decision_tree (
    CLOCK_50,
    rst,
    in_temp_max,
    in_temp_min,
    in_precipitation,
    in_wind,
    tmp_out);

    input CLOCK_50, rst;
    input[4:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    //output[2:0] out;

    parameter state_0 = 3'b000;
    parameter state_1 = 3'b001;
    parameter state_2 = 3'b010;
    parameter state_3 = 3'b011;
    parameter state_4 = 3'b100;

    output reg[4:0] tmp_out;
    reg[2:0] present_state, next_state;

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
                if (in_temp_max <= 17) begin
                    next_state <= state_1;
                end
                else begin
                    next_state <= state_2;
                end
            end
            state_1 : begin
                if (in_precipitation <= 1) begin
                    tmp_out <= 5'b10000; // sunny
                end
                else begin
                    next_state <= state_3;
                end
            end
            state_2 : begin
                if (in_temp_max <= 26) begin
                    next_state <= state_4;
                end
                else begin
                    tmp_out <= 5'b10000; // sunny
                end
            end
            state_3 : begin
                if (in_temp_min <= 1) begin
                    tmp_out <= 5'b01000; // snowy
                end
                else begin
                    tmp_out <= 5'b00100; // rainy
                end
            end
            state_4 : begin
                if (in_precipitation <= 1) begin
                    tmp_out <= 5'b10000; // sunny
                end
                else begin
                    tmp_out <= 5'b00100; // rainy
                end
            end
            default : begin
                tmp_out <= 5'b11111;
                next_state <= state_0;
            end
        endcase
    end
    //assign out = tmp_out;
endmodule

module decision_tree1 (
    CLOCK_50,
    rst,
    in_temp_max,
    in_temp_min,
    in_precipitation,
    in_wind,
    tmp_out);

    input CLOCK_50, rst;
    input[4:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;

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
                if (in_precipitation <= 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (in_temp_max <= 18) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (in_wind <= 5) begin
                    next_state = state_5;
                end
                else begin
                    next_state = state_6;
                end
            end
            state_3 : begin
                if (in_temp_max <= 8) begin
                    next_state = state_7;
                end
                else begin
                    next_state = state_8;
                end
            end
            state_4 : begin
                if (in_temp_max <= 30) begin
                    next_state = state_9;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_5 : begin
                if (in_temp_min <= 1) begin
                    next_state = state_10;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_6 : begin
                if (in_temp_min <= 1) begin
                    tmp_out = 5'b01000; // sonwy
                end
                else begin
                    next_state = state_11;
                end
            end
            state_7 : begin
                if (in_wind <= 3) begin
                    next_state = state_12;
                end
                else begin
                    next_state = state_13;
                end
            end
            state_8 : begin
                if (in_wind <= 2) begin
                    next_state = state_14;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_9 : begin
                if (in_wind <= 2) begin
                    next_state = state_15;
                end
                else begin
                    next_state = state_16;
                end
            end
            state_10 : begin
                if (in_temp_min <= -1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    next_state = state_17;
                end
            end
            state_11 : begin
                if (in_temp_max <= 7) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_12 : begin
                if (in_temp_max <= 4) begin
                    tmp_out = 5'b00001; // drizzle
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_13 : begin
                if (in_temp_min <= 2) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_14 : begin
                if (in_temp_min <= 3) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_15 : begin
                if (in_temp_max <= 28) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_16 : begin
                if (in_temp_min <= 17) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_17 : begin
                if (in_wind <= 3) begin
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
    input[4:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;

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
                if (in_precipitation <= 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (in_wind <= 3) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (in_temp_min <= 1) begin
                    next_state = state_5;
                end
                else begin
                    next_state = state_6;
                end
            end
            state_3 : begin
                if (in_temp_max <= 17) begin
                    next_state = state_7;
                end
                else begin
                    next_state = state_8;
                end
            end
            state_4 : begin
                if (in_temp_min <= 9) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_9;
                end
            end
            state_5 : begin
                if (in_wind <= 3) begin
                    tmp_out = 5'b00100; // rainy;
                end
                else begin
                    next_state = state_10;
                end
            end
            state_6 : begin
                if (in_temp_min <= 3) begin
                    next_state = state_11;
                end
                else begin
                    next_state = state_12;
                end
            end
            state_7 : begin
                if (in_temp_max <= 16) begin
                    next_state = state_13;
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_8 : begin
                if (in_temp_max <= 30) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_14;
                end
            end
            state_9 : begin
                if (in_temp_max <= 19) begin
                    next_state = state_15;
                end
                else begin
                    next_state = state_16;
                end
            end
            state_10 : begin
                if (in_precipitation <= 5) begin
                    next_state = state_17;
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_11 : begin
                if (in_wind <= 2) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_12 : begin
                if (in_precipitation <= 22) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    next_state = state_18;
                end
            end
            state_13 : begin
                if (in_temp_min <= 3) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_14 : begin
                if (in_wind <= 2) begin
                    tmp_out = 3'b010; //drizzle 
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_15 : begin
                if (in_temp_min <= 12) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_16 : begin
                if (in_wind <= 6) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_17 : begin
                if (in_temp_max <= 5) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_18 : begin
                if (in_precipitation <= 25) begin
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
    input[4:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;

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
                if (in_precipitation <= 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (in_wind <= 2) begin
                    tmp_out = 5'b10000; // sunny;
                end
                else begin
                    next_state = state_3;
                end
            end
            state_2 : begin
                if (in_temp_min <= 1) begin
                    next_state = state_4;
                end
                else begin
                    next_state = state_5;
                end
            end
            state_3 : begin
                if (in_temp_max <= 17) begin
                    next_state = state_6;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_4 : begin
                if (in_temp_max <= 6) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    next_state = state_7;
                end
            end
            state_5 : begin
                if (in_temp_max <= 6) begin
                    next_state = state_8;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_6 : begin
                if (in_temp_max <= 6) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_9;
                end
            end
            state_7 : begin
                if (in_temp_max <= 8) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_8 : begin
                if (in_precipitation <= 11) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_9 : begin
                if (in_temp_min <= 12) begin
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
    input[4:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;

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
                if (in_precipitation <= 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (in_wind <= 2) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (in_temp_min <= 1) begin
                    next_state = state_5;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_3 : begin
                if (in_temp_max <= 4) begin
                    next_state = state_6;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_4 : begin
                if (in_temp_max <= 18) begin
                    next_state = state_7;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_5 : begin
                if (in_precipitation <= 5) begin
                    next_state = state_8;
                end
                else begin
                    next_state = state_9;
                end
            end
            state_6 : begin
                if (in_temp_max <= 3) begin
                    next_state = state_10;
                end
                else begin
                    tmp_out = 3'b010; // drizzle
                end
            end
            state_7 : begin
                if (in_temp_max <= 7) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_11;
                end
            end
            state_8 : begin
                if (in_wind <= 4) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_9 : begin
                if (in_precipitation <= 11) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_10 : begin
                if (in_temp_max <= 2) begin
                    tmp_out = 3'b010; // drizzle
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_11 : begin
                if (in_wind <= 6) begin
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
    input[4:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;

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
                if (in_precipitation <= 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (in_wind <= 2) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (in_temp_min <= 1) begin
                    next_state = state_5;
                end
                else begin
                    next_state = state_6;
                end
            end
            state_3 : begin
                if (in_temp_max <= 20) begin
                    next_state = state_7;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_4 : begin
                if (in_temp_max <= 17) begin
                    next_state = state_8;
                end
                else begin
                    next_state = state_9;
                end
            end
            state_5 : begin
                if (in_wind <= 3) begin
                    tmp_out = 5'b00100; // rainy;
                end
                else begin
                    next_state = state_10;
                end
            end
            state_6 : begin
                if (in_temp_min <= 3) begin
                    next_state = state_11;
                end
                else begin
                    next_state = state_12;
                end
            end
            state_7 : begin
                if (in_temp_min <= 3) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_13;
                end
            end
            state_8 : begin
                if (in_wind <= 3) begin
                    next_state = state_14;
                end
                else begin
                    next_state = state_15;
                end
            end
            state_9 : begin
                if (in_temp_max <= 20) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_16;
                end
            end
            state_10 : begin
                if (in_wind <= 4) begin
                    next_state = state_17;
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_11 : begin
                if (in_wind <= 2) begin
                    next_state = state_18;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_12 : begin
                if (in_precipitation <= 22) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    next_state = state_19;
                end
            end
            state_13 : begin
                if (in_temp_min <= 8) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_14 : begin
                if (in_temp_max <= 4) begin
                    tmp_out = 3'b010; //drizzle 
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_15 : begin
                if (in_temp_max <= 11) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_16 : begin
                if (in_wind <= 6) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_17 : begin
                if (in_temp_min <= -1) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_18 : begin
                if (in_precipitation <= 3) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_19 : begin
                if (in_precipitation <= 23) begin
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
    input[4:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;

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
                if (in_temp_max <= 16) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (in_temp_min <= 2) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (in_precipitation <= 1) begin
                    next_state = state_5;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_3 : begin
                if (in_precipitation <= 1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_6;
                end
            end
            state_4 : begin
                if (in_temp_max <= 12) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    next_state = state_7;
                end
            end
            state_5 : begin
                if (in_temp_max <= 19) begin
                    next_state = state_8;
                end
                else begin
                    next_state = state_9;
                end
            end
            state_6 : begin
                if (in_wind <= 5) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    next_state = state_10;
                end
            end
            state_7 : begin
                if (in_temp_min <= 5) begin
                    next_state = state_11;
                end
                else begin
                    next_state = state_12;
                end
            end
            state_8 : begin
                if (in_temp_max <= 18) begin
                    next_state = state_13;
                end
                else begin
                    next_state = state_14;
                end
            end
            state_9 : begin
                if (in_wind <= 6) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_10 : begin
                if (in_precipitation <= 29) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_11 : begin
                if (in_temp_min <= 4) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_12 : begin
                if (in_wind <= 2) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_13 : begin
                if (in_wind <= 2) begin
                    tmp_out = 5'b00010; // foggy
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_14 : begin
                if (in_wind <= 2) begin
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
    input[4:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;

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
                if (in_temp_max <= 20) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (in_precipitation <= 1) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (in_precipitation <= 1) begin
                    next_state = state_5;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_3 : begin
                if (in_temp_max <= 7) begin
                    next_state = state_6;
                end
                else begin
                    next_state = state_7;
                end
            end
            state_4 : begin
                if (in_temp_max <= 5) begin
                    next_state = state_8;
                end
                else begin
                    next_state = state_9;
                end
            end
            state_5 : begin
                if (in_temp_max <= 23) begin
                    next_state = state_10;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_6 : begin
                if (in_temp_min <= -1) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_11;
                end
            end
            state_7 : begin
                if (in_wind <= 2) begin
                    next_state = state_12;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_8 : begin
                if (in_wind <= 4) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_9 : begin
                if (in_wind <= 6) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    next_state = state_13;
                end
            end
            state_10 : begin
                if (in_temp_min <= 13) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_14;
                end
            end
            state_11 : begin
                if (in_wind <= 2) begin
                    tmp_out = 5'b00010; // foggy
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_12 : begin
                if (in_temp_min <= 3) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_13 : begin
                if (in_temp_max <= 7) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_14 : begin
                if (in_temp_min <= 15) begin
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
    input[4:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;

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
                if (in_precipitation <= 1) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (in_temp_max <= 20) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (in_temp_min <= 1) begin
                    next_state = state_5;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_3 : begin
                if (in_temp_min <= 3) begin
                    next_state = state_6;
                end
                else begin
                    next_state = state_7;
                end
            end
            state_4 : begin
                if (in_wind <= 6) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    tmp_out = 5'b00010; // foggy
                end
            end
            state_5 : begin
                if (in_temp_max <= 5) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    next_state = state_8;
                end
            end
            state_6 : begin
                if (in_temp_min <= -4) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_9;
                end
            end
            state_7 : begin
                if (in_wind <= 2) begin
                    next_state = state_10;
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_8 : begin
                if (in_temp_max <= 9) begin
                    next_state = state_11;
                end
                else begin
                    tmp_out = 5'b01000; // snowy
                end
            end
            state_9 : begin
                if (in_temp_min <= -3) begin
                    tmp_out = 5'b00010; // foggy
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_10 : begin
                if (in_temp_max <= 9) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_11 : begin
                if (in_precipitation <= 5) begin
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
    input[4:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output reg[4:0] tmp_out;

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
                if (in_temp_max <= 18) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (in_precipitation <= 1) begin
                    next_state = state_3;
                end
                else begin
                    next_state = state_4;
                end
            end
            state_2 : begin
                if (in_precipitation <= 1) begin
                    next_state = state_5;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_3 : begin
                if (in_temp_max <= 4) begin
                    next_state = state_6;
                end
                else begin
                    next_state = state_7;
                end
            end
            state_4 : begin
                if (in_wind <= 5) begin
                    next_state = state_8;
                end
                else begin
                    next_state = state_9;
                end
            end
            state_5 : begin
                if (in_temp_max <= 23) begin
                    next_state = state_10;
                end
                else begin
                    next_state = state_11;
                end
            end
            state_6 : begin
                if (in_wind <= 3) begin
                    tmp_out = 3'b010; // drizzle
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_7 : begin
                if (in_temp_max <= 7) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_12;
                end
            end
            state_8 : begin
                if (in_temp_min <= 3) begin
                    next_state = state_13;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_9 : begin
                if (in_precipitation <= 4) begin
                    next_state = state_14;
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_10 : begin
                if (in_temp_min <= 13) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_15;
                end
            end
            state_11 : begin
                if (in_temp_min <= 13) begin
                    tmp_out = 5'b10000; // sunny
                end
                else begin
                    next_state = state_16;
                end
            end
            state_12 : begin
                if (in_temp_max <= 9) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_13 : begin
                if (in_wind <= 2) begin
                    tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_14 : begin
                if (in_temp_max <= 6) begin
                     tmp_out = 5'b01000; // snowy
                end
                else begin
                    tmp_out = 5'b00100; // rainy
                end
            end
            state_15 : begin
                if (in_temp_max <= 20) begin
                    tmp_out = 5'b00100; // rainy
                end
                else begin
                    tmp_out = 5'b10000; // sunny
                end
            end
            state_16 : begin
                if (in_wind <= 5) begin
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
    output wire [3:0] result;

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

    wire [3:0] winner_1vs2;
    wire [3:0] winner_3vs4;
    wire [3:0] winner_12vs34;

    wire [3:0] winner;

    assign winner_cnt_1vs2 = drizzle_1 > fog_2 ? drizzle_1 : fog_2;
    assign winner_1vs2 = drizzle_1 > fog_2 ? 1 : 2;
    assign winner_cnt_3vs4 = rainy_3 > snowy_4 ? rainy_3 : snowy_4;
    assign winner_3vs4 = rainy_3 > snowy_4 ? 3 : 4;   

    assign winner_cnt_12vs34 = winner_cnt_1vs2 > winner_cnt_3vs4 ? winner_cnt_1vs2 : winner_cnt_3vs4;
    assign winner_12vs34 = winner_cnt_1vs2 > winner_cnt_3vs4 ? winner_1vs2 : winner_3vs4;

    assign winner = winner_cnt_12vs34 > sunny_5 ? winner_12vs34 : 5; 
    assign result = winner; 
endmodule

module testbench;
    reg[4:0] in_temp_max, in_temp_min, in_precipitation, in_wind;
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
        in_temp_max = 5'b01110;
        in_temp_min = 5'b00110;
        in_precipitation = 5'b00000;
        in_wind = 5'b00001;
        rst = 0;
        # 50 rst = 1;
        # 30 rst = 0;
        # 100;
    end
 
endmodule