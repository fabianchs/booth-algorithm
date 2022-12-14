`timescale 1ns / 1ps


module mult(

output [15:0]bin_d_in,
output busy,
input [7:0] mc,
input [7:0]mp,
input clk, 
input reset

);  
    reg [7:0] A, Q, M;
    reg Q_1;
    reg [3:0] count;
    wire [7:0] sum, difference;
always @(posedge clk)
begin
    if (reset) begin
    A <= 8'b0;
    M <= mc;
    Q <= mp;
    Q_1 <= 1'b0;
    count <= 4'b0;
end
    else begin
    case ({Q[0], Q_1})
    2'b0_1 : {A, Q, Q_1} <= {sum[7], sum, Q};
    2'b1_0 : {A, Q, Q_1} <= {difference[7], difference, Q};
    default: {A, Q, Q_1} <= {A[7], A, Q};
    endcase
    count <= count + 1'b1;
    end
    
    end
    
    alu adder (sum, A, M, 1'b0);
    alu subtracter (difference, A, ~M, 1'b1);
    assign bin_d_in = {A, Q};
    assign busy = (count < 8);
    endmodule


    
    
    
