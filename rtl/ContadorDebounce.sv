`timescale 1ns / 1ps

module ContadorDebounce(CLK,SET,CUENTAENA,CUENTADONE);

input CLK,SET,CUENTAENA;
output logic CUENTADONE;

logic[19:0] CUENTA;

always @(posedge CLK)
		if (SET)
			CUENTA=20'd1000000;
		else if (CUENTAENA)
			CUENTA=CUENTA-1'b1;
		else
			CUENTA=CUENTA;
assign CUENTADONE = (CUENTA==20'd0);


endmodule
