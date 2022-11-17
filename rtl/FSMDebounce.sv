`timescale 1ns / 1ps

module FSMDebounce(		//MAQUINA DE ESTADOS DEBOUNCE SWITCH

input logic CLK,
input logic RESET,
input logic [15:0]SW,
input logic CUENTADONE,
output logic SET,
output logic CUENTAENA,
output logic [15:0]SWOUT

);


//Registros de Estado

reg [1:0] PRE,FUT;
parameter T0=2'b00, T1=2'b01, T2=2'b10, T3=2'b11;


//Registro de Transicion de estado
always @(negedge CLK or posedge RESET)
	if (RESET)
			PRE=T0;
	else
		PRE=FUT;

//Red del estado futuro
always @(PRE or SW or CUENTADONE)
	case (PRE)
		T0: if (SW)
				FUT=T1;
			 else
				FUT=T0;
		T1: if (CUENTADONE)
				FUT=T2;
			 else
				FUT=T1;
		T2: if (SW)
				FUT=T1;
			 else
				FUT=T3;
		T3: FUT=T0;
	endcase

//Asignacion de Salidas
always @(PRE)
	case (PRE)
		T0:begin
				SET = 1;
				CUENTAENA = 0;
				SWOUT = 0;
			end
		T1:begin
				SET = 0;
				CUENTAENA = 1;
				SWOUT = 0;
			end
		T2:begin
				SET = 1;
				CUENTAENA = 0;
				SWOUT = 0;
			end
		T3:begin
				SET = 0;
				CUENTAENA = 0;
				SWOUT = 1;
			end
	endcase
		
endmodule
