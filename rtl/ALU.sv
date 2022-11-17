`timescale 1ns / 1ps

    module alu(
    output [7:0] out,
    input [7:0] a,
    input [7:0] b,
    input cin
    
    );
    
    assign out = a + b + cin;
    endmodule

