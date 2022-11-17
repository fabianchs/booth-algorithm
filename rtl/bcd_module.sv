`timescale 1ns / 1ps

module BCDConvert(
    input           clk,
    input           en,
    input   [15:0]  bin_d_in,
    output  [3:0]   bcd_d_out_1,
    output  [3:0]   bcd_d_out_2,
    output  [3:0]   bcd_d_out_3,
    output  [3:0]   bcd_d_out_4,
    output  [3:0]   bcd_d_out_5,
    output  [3:0]   plus_minus,    
    output          rdy
    );    
    //State variables
    parameter IDLE          = 3'b000;
    parameter SETUP         = 3'b001;
    parameter ADD           = 3'b010;
    parameter SHIFT         = 3'b011;
    parameter DONE          = 3'b100;
    parameter SENDING_OUT   = 3'b101;
    
    //reg [11:0]  bin_data    = 0;
    reg [31:0]  bcd_data    = 0;
    reg [2:0]   state       = 0;
    reg         busy        = 0;
    reg [3:0]   sh_counter  = 0;
    reg [3:0]   output_counter  = 0;
    reg [2:0]   add_counter = 0;
    reg         result_rdy  = 0;
    reg [3:0]   direction   = 0;
    reg [3:0]   bcd_data_reg= 0;
 
        reg   [15:0]  bin_d_in_reg= 0;
        reg  [3:0]   bcd_d_out_1_reg= 0;
        reg  [3:0]   bcd_d_out_2_reg= 0;
        reg  [3:0]   bcd_d_out_3_reg= 0;
        reg  [3:0]   bcd_d_out_4_reg= 0;
        reg  [3:0]   bcd_d_out_5_reg= 0;
        reg  [3:0]   plus_minus_reg= 0;     
    
    always @(posedge clk)
        begin
        if(en)
            begin
                if(~busy)
                    begin
                    bcd_data     <= {16'b0, bin_d_in[14:0]};
                    direction    <= {4'b0, bin_d_in[15:15]};
                    state       <= SETUP;
                    end
            end
        
        case(state)
        
            IDLE:
                begin
                    result_rdy  <= 0;
                    busy        <= 0;
                    output_counter <= 0;
                end
                
            SETUP:
                begin
                busy        <= 1;
                state       <= ADD;
                end
                    
            ADD:
                begin
                
                case(add_counter)
                    0:
                        begin
                        if(bcd_data[15:12] > 4)
                            begin
                                bcd_data[27:12] <= bcd_data[27:12] + 3;
                            end
                            add_counter <= add_counter + 1;
                        end
                    
                    1:
                        begin
                        if(bcd_data[19:16] > 4)
                            begin
                                bcd_data[27:16] <= bcd_data[27:16] + 3;
                            end
                            add_counter <= add_counter + 1;
                        end
                        
                    2:
                        begin
                        if((add_counter == 2) && (bcd_data[23:20] > 4))
                            begin
                                bcd_data[27:20] <= bcd_data[27:20] + 3;
                            end
                            add_counter <= add_counter + 1;
                        end
                        
                    3:
                        begin
                        if((add_counter == 3) && (bcd_data[27:24] > 4))
                            begin
                                bcd_data[27:24] <= bcd_data[27:24] + 3;
                            end
                            add_counter <= add_counter +1;
                        end
                     4:
                                                begin
                                                if((add_counter == 4) && (bcd_data[31:28] > 4))
                                                    begin
                                                        bcd_data[31:28] <= bcd_data[31:28] + 3;
                                                    end
                                                    add_counter <= 0;
                                                    state   <= SHIFT;
                                                end
                    endcase
                end
                
            SHIFT:
                begin
                sh_counter      <= sh_counter + 1;
                bcd_data        <= bcd_data << 1;
                
                if(sh_counter == 11)
                    begin
                    sh_counter  <= 0;
                    state       <= SENDING_OUT;
                    end
                else
                    begin
                    state       <= ADD;
                    end

                end
            SENDING_OUT:
                begin
                       result_rdy      <= 1;
                    bcd_d_out_1_reg    <= bcd_data[15:12];
                    bcd_d_out_2_reg    <= bcd_data[19:16];
                    bcd_d_out_3_reg    <= bcd_data[23:20];
                    bcd_d_out_4_reg    <= bcd_data[27:24];
                    bcd_d_out_5_reg    <= bcd_data[31:28];
                    plus_minus_reg     <= direction;
                    state              <= DONE;
                end
            DONE:
                begin
                state       <= IDLE;
                result_rdy  <= 0;
                end
            default:
                begin
                state <= IDLE;
                end
            
            endcase
            
        end
                                assign bcd_d_out_1    = bcd_d_out_1_reg;
                                assign bcd_d_out_2    = bcd_d_out_2_reg;
                                assign bcd_d_out_3    = bcd_d_out_3_reg;
                                assign bcd_d_out_4    = bcd_d_out_4_reg;
                                assign bcd_d_out_5    = bcd_d_out_5_reg;
                                assign plus_minus     = plus_minus_reg;
    assign rdy          = result_rdy;
endmodule