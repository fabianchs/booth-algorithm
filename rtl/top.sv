`timescale 1ns / 1ps

module top(

input logic clk,
input logic [15:0]SW,
input logic reset,
//input logic start,
output logic [6:0]cathode,
output logic [5:0]anode
    );
    
//logic rst;
logic refresh_clock;
logic [3:0]digit0;
logic  [3:0]bcd_d_out_1;
logic  [3:0]bcd_d_out_2;
logic  [3:0]bcd_d_out_3;
logic  [3:0]bcd_d_out_4;
logic  [3:0]bcd_d_out_5;
logic  [3:0]plus_minus;
logic [2:0]refreshcounter;
logic en;
//logic mult_control;
//logic mult_control_t;
//logic Q_LSB;
logic [15:0]bin_d_in;
logic [3:0]D_Desple;
logic rdy;
logic busy;
logic cin;
logic a;
logic b;
logic out;

    
BCD_control BCD_control_const(

   .bcd_d_out_1(bcd_d_out_1),
   .bcd_d_out_2(bcd_d_out_2),
   .bcd_d_out_3(bcd_d_out_3),
   .bcd_d_out_4(bcd_d_out_4),
   .bcd_d_out_5(bcd_d_out_5),
   .plus_minus(plus_minus),  
   .refreshcounter(refreshcounter),
   .D_Desple(D_Desple)    
);

BCDConvert BCDConvert_const(
    .clk(clk),
    .en(en),
    .bin_d_in(bin_d_in),
    .bcd_d_out_1(bcd_d_out_1),
    .bcd_d_out_2(bcd_d_out_2),
    .bcd_d_out_3(bcd_d_out_3),
    .bcd_d_out_4(bcd_d_out_4),
    .bcd_d_out_5(bcd_d_out_5),
    .plus_minus(plus_minus),
    .rdy(rdy)

);

anodos anodos_const(
    .refreshcounter(refreshcounter),
    .anode(anode)
);

catodo catodo_const(
    .digito(D_Desple),
    .cathode(cathode)
);

refreshcounter refreshcounter_const(
.refresh_clock(refresh_clock),
.refreshcounter(refreshcounter)
);
alu alu_const (
.cin(cin),
.a(a),
.b(b),
.out(out)


);

mult mult_const(

.bin_d_in(bin_d_in),
.busy(busy), 
.mc(SW[7:0]), 
.mp(SW[15:8]),
.clk(clk),
.reset(reset)








//    .clk(clk),
//    .rst(rst),
//    .A(SW[7:0]),
//    .B(SW[15:8]),
//    .mult_control_t(mult_control_t),
//    .Q_LSB(Q_LSB),
//    .bin_d_in(bin_d_in)
);

endmodule
