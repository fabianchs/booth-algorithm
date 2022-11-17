`timescale 1ns / 1ps

module refreshcounter(
input refresh_clock,
output reg [2:0] refreshcounter = 0
);

always@(posedge refresh_clock) 
begin
refreshcounter <= refreshcounter +1;
    if(refreshcounter == 3'd5)
        begin
            refreshcounter=0;
        end
end
endmodule
