module decision_tree (
    clk,
    rst,
    in_temp_max,
    in_temp_min,
    in_precipitation,
    in_wind,
    out);

    input clk, rst;
    input[3:0] in_temp_max, in_temp_min,
                in_precipitation, in_wind;
    output[4:0] out;

    parameter state_0 = 3'b000;
    parameter state_1 = 3'b001;
    parameter state_2 = 3'b010;
    parameter state_3 = 3'b100;

    reg[4:0] out;
    reg[2:0] present_state, next_state;

    always @ (posedge clk or posedge rst) begin
        if(rst) begin
            present_state <= state_0;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @ (posedge clk or posedge rst) begin
        case(present_state)
            state_0 : begin
                
            end
            state_1 : begin
            end
            state_2 : begin
            end
            state_3 : begin
            end
            state_4 : begin
            end
            default : begin
            end
        endcase
    end
    assign out = out;
endmodule
