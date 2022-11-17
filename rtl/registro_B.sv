`timescale 1ns / 1ps

module registro_B(
                             
    input logic B8,          
    input logic B9,          
    input logic B10,          
    input logic B11,          
    input logic B12,          
    input logic B13,          
    input logic B14,          
    input logic B15,          
    output logic [7:0]switch_B
       );                    
                             
assign switch_B[0] = B8;     
assign switch_B[1] = B9;     
assign switch_B[2] = B10;     
assign switch_B[3] = B11;     
assign switch_B[4] = B12;     
assign switch_B[5] = B13;     
assign switch_B[6] = B14;     
assign switch_B[7] = B15;     

endmodule



