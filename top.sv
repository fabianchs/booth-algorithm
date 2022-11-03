`timescale 1ns / 1ps

module top(

output [7:0]catodo,
output [6:0]anodo,
output [15:0]leds,
input [7:0]switch_A,
input [7:0]switch_B

    );
    
    subsistema_lectura subsistema_lectura_const(
    .A(A),
    .B(B),
    .valid(valid)
    );
    
    calculo_multiplicacion calculo_multiplicacion_const(
    .valid(valid),
    .bin_result(bin_result)
    );
    
    BCD BCD_const(
    .dec_result(dec_result)
    );
    
    anodo anodo_const(
    .anodo(anodo)
    );
    
    catodo catodo_const(
    .catodo(catodo)
    );
    
    
    
endmodule
