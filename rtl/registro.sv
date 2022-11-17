`timescale 1ns / 1ps

module registro(
    
    input logic B0,
    input logic B1,
    input logic B2,
    input logic B3,
    input logic B4,
    input logic B5,
    input logic B6,
    input logic B7,
    output logic [7:0]switch_A 
       );
    
assign switch_A[0] = B0;
assign switch_A[1] = B1;
assign switch_A[2] = B2;
assign switch_A[3] = B3;
assign switch_A[4] = B4;
assign switch_A[5] = B5;
assign switch_A[6] = B6;
assign switch_A[7] = B7;

endmodule





