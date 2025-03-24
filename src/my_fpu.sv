//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2025 09:18:27 PM
// Design Name: 
// Module Name: my_fpu
// Project Name: 
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


module my_fpu(
    output [39:0] out,
    input [31:0] in1,
    input [31:0] in2,
    input [3:0] sel
    );
    import fpu_package::*;                          // Import select info
    assign out = (sel == ADD) ? in1 + in2 : in1 - in2;
endmodule
