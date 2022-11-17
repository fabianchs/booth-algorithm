`timescale 1ns / 1ps

module BCD_control(
input[3:0]   bcd_d_out_1,
input[3:0]   bcd_d_out_2,
input[3:0]   bcd_d_out_3,
input[3:0]   bcd_d_out_4,
input[3:0]   bcd_d_out_5,
input[3:0]   plus_minus,
input[2:0]refreshcounter,

output reg [3:0] D_Desple = 0
);

always@(refreshcounter)
begin
    case(refreshcounter)
        3'd0:
             D_Desple = bcd_d_out_1;
         3'd1:
             D_Desple = bcd_d_out_2;
         3'd2:
             D_Desple = bcd_d_out_3;
         3'd3:
             D_Desple = bcd_d_out_4;
         3'd4:
             D_Desple = bcd_d_out_5;
         3'd5:
             D_Desple = plus_minus;
        endcase
end        
endmodule
