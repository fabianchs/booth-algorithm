`timescale 1ns / 1ps

module anodos(
input [2:0] refreshcounter,
output reg [5:0] anode = 0
    );
    
always@(refreshcounter)
begin
    case(refreshcounter)
        3'b000:
            anode = 8'b11111110;
        3'b001:
            anode = 8'b11111101;
        3'b010:
            anode = 8'b11111011;
        3'b011:
            anode = 8'b11110111;
        3'b100:
            anode = 8'b11101111;
        3'b101:
            anode = 8'b11011111;
     endcase
end
endmodule
