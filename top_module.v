`timescale 1ns / 1ps

module top_module(
    input input_clk,
    input input_rst,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input [3:0] in4,
    output reg [20:0] output_reg,
    output reg output_reg_done
    );
    
    reg [3:0] input_PE1;
    reg [3:0] input_PE2;
    reg [3:0] input_PE3;
    reg [3:0] input_PE4;
    
    wire [9:0] output_PE1;
    wire [9:0] output_PE2;
    wire [9:0] output_PE3;
    
    wire [15:0] output_PE4;
    wire [15:0] output_PE5;
    wire [15:0] output_PE6;
    
    wire [20:0] output_PE7;
    wire [20:0] output_PE8;
    wire [20:0] output_PE9;
    
    reg [1:0] cnt;
    
    always @(posedge input_clk) begin
        if(input_rst) begin
            input_PE1<=0;
            input_PE2<=0;
            input_PE3<=0;
            input_PE4<=0;
            cnt <= 0;
            output_reg_done <= 0;
        end
        else if(cnt == 0)begin
            input_PE1<=in1;input_PE2<=in2;input_PE3<=in3;input_PE4<=in4;
            cnt <= cnt + 1;
        end
        else if(cnt == 1)begin
            output_reg <= output_PE7;
            cnt <= cnt + 1;
        end
        else if(cnt == 2)begin
            output_reg <= output_PE8;
            cnt <= cnt + 1;
        end
        else if(cnt == 3)begin
            output_reg <= output_PE9;
            output_reg_done <= 1;
        end
    end
    
    PE_4input #(1,0,0,0,4,10) PE1 (input_rst,input_PE1,input_PE2,input_PE3,input_PE4, output_PE1);
    PE_4input #(0,1,0,0,4,10) PE2 (input_rst,input_PE1,input_PE2,input_PE3,input_PE4, output_PE2);
    PE_4input #(0,0,1,1,4,10) PE3 (input_rst,input_PE1,input_PE2,input_PE3,input_PE4, output_PE3);
    
    PE_3input #(1,0,0,10,16) PE4 (input_rst,output_PE1, output_PE2, output_PE3, output_PE4);
    PE_3input #(0,1,0,10,16) PE5 (input_rst,output_PE1, output_PE2, output_PE3, output_PE5);
    PE_3input #(0,0,1,10,16) PE6 (input_rst,output_PE1, output_PE2, output_PE3, output_PE6);
    
    PE_3input #(1,0,0,16,21) PE7 (input_rst,output_PE4, output_PE5, output_PE6, output_PE7);
    PE_3input #(0,1,0,16,21) PE8 (input_rst,output_PE4, output_PE5, output_PE6, output_PE8);
    PE_3input #(0,0,1,16,21) PE9 (input_rst,output_PE4, output_PE5, output_PE6, output_PE9);
    
endmodule
