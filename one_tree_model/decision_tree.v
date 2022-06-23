module decision_tree (
    CLOCK_50,
    rst,
    in_temp_max,
    in_temp_min,
    in_precipitation,
    in_wind,
    out);

    input CLOCK_50, rst;
    input[3:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output[4:0] out;

    parameter state_0 = 3'b000;
    parameter state_1 = 3'b001;
    parameter state_2 = 3'b010;
    parameter state_3 = 3'b100;

    reg[4:0] tmp_out;
    reg[2:0] present_state, next_state;

    always @ (posedge CLOCK_50 or posedge rst) begin
        if(rst) begin
            present_state <= state_0;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @ (posedge CLOCK_50 or posedge rst) begin
        case(present_state)
            state_0 : begin
                if (in_temp_max <= 17) begin
                    next_state = state_1;
                end
                else begin
                    next_state = state_2;
                end
            end
            state_1 : begin
                if (in_precipitation <= 1) begin
                    tmp_out = 3'b000; // sunny
                end
                else begin
                    next_state = state_3;
                end
            end
            state_2 : begin
                if (in_temp_max <= 26) begin
                    next_state = state_4;
                end
                else begin
                    tmp_out = 3'b000; // sunny
                end
            end
            state_3 : begin
                if (in_temp_min <= 1) begin
                    tmp_out = 3'b110; // snowy
                end
                else begin
                    tmp_out = 3'b001; // rainy
                end
            end
            state_4 : begin
                if (in_precipitation <= 1) begin
                    tmp_out = 3'b000; // sunny
                end
                else begin
                    tmp_out = 3'b001; // rainy
                end
            end
            default : begin
                tmp_out = 3'b111;
                next_state = state_0;
            end
        endcase
    end
    assign out = tmp_out;
endmodule
