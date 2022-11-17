`timescale 1ns / 1ps


module Antirebote(

input J,
input K,
input wire CLK,
output Q,
output Qnot,
output reg Q

);



assign Qnot = ~ Q ;
always @ (posedge CLK)

case ({J,K})

4'b0000: Q = Q;
4'b0001: Q = 2'b00;
4'b0010: Q = 2'b01;
4'b0011: Q = ~ Q;

endcase
endmodule
