`timescale 1ns / 1ps

module PE_3input #(
    parameter weight_1 = 1,
    parameter weight_2 = 1,
    parameter weight_3 = 1,
    parameter DATA_IN_WIDTH = 4,
    parameter DATA_OUT_WIDTH = 4
    )(
    input reset,
    input [DATA_IN_WIDTH - 1:0] data_in_1,
    input [DATA_IN_WIDTH - 1:0] data_in_2,
    input [DATA_IN_WIDTH - 1:0] data_in_3,
    output reg [DATA_OUT_WIDTH - 1:0] result
    );
    reg [7:0] mul1,mul2,mul3;
    reg [8:0] add1;
    
    always @(*) begin
        if(reset) begin
            mul1 = 0;
            mul2 = 0;
            mul3 = 0;
            add1 = 0;
            result = 0;
        end
        else begin
            mul1 = weight_1 * data_in_1;
            mul2 = weight_2 * data_in_2;
            mul3 = weight_3 * data_in_3;
            add1 = mul1 + mul2;
            result = add1 + mul3;
        end
    end

endmodule
