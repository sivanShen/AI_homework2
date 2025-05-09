`timescale 1ns / 1ps

module tb(
);
    reg input_clk;
    reg input_rst;
    reg [3:0] in1;
    reg [3:0] in2;
    reg [3:0] in3;
    reg [3:0] in4;
    wire [20:0] output_reg;
    wire output_reg_done;
    
    top_module uut(input_clk,input_rst,in1, in2, in3, in4,
                               output_reg,output_reg_done );
                               
    always #2.5 input_clk = ~input_clk;
    
    initial begin
        in1 = 0;
        in2 = 0;
        in3 = 0;
        in4 = 0;
        input_clk = 0;
        input_rst = 1;
        #5
        input_rst = 0;
        in1 = 1;
        in2 = 2;
        in3 = 3;
        in4 = 4;
        #25
        $finish;
    end
endmodule
