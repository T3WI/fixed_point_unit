//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2025 09:18:27 PM
// Design Name: 
// Module Name: my_fpu
// Project Name: Fixed-Point Unit
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "fpu_package.sv"                          // Include the package info

module my_fpu(
    output logic [OUTPUT_WIDTH - 1:0] out,
    input logic [INPUT_WIDTH - 1:0] in1,
    input logic [INPUT_WIDTH - 1:0] in2,
    input logic in3,
    input logic [3:0] sel,
    input logic reset,
    input logic clk
    );
    logic [OUTPUT_WIDTH - 1: 0] temp;
    always_ff @(posedge clk)
    begin
        if(reset) 
        begin
            output <= 0;
        end
        else 
        begin 
            case(sel)
                LOGIC_SHIFT: 
                begin 
                    temp <= logic_shift(in1, in2, in3);
                end
                ARITH_SHIFT:
                begin
                    temp <= arith_shift(in1, in2, in3);
                end
                CIRC_SHIFT:
                begin 
                    temp <= circ_shift(in1, in2, in3);
                end
                LZD: 
                begin 
                    temp <= lzd(in1);
                end
                BARREL:
                begin 
                    temp <= barrel(in1);
                end
                REV: 
                begin
                    temp <= rev(in1);
                end
                // FOR THE BINARY OPERATIONS, NEED TO IMPLEMENT ALGORITHMS, THESE WILL TAKE
                // MULTIPLE CLOCK CYCLES, SO NO FUNCTIONS CAN BE USED. WILL NEED TO USE AN FSM
                ADD: 
                begin
                    temp <= 0;
                end
                SUB: 
                begin 
                    temp <= 0;
                end
                MUL: 
                begin 
                    temp <= 0;
                end
                DIV: 
                begin 
                    temp <= 0;
                end
                default:
                begin 
                    temp <= 0;
                end
            endcase
        end
    end
    assign out = temp;
endmodule
