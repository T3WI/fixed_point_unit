module my_fpu_sim;
    // set time units and precision for simulation
    timeunit 1ns;               
    timeprecision 10ps;
    // set up clock
    logic clk;
    forever #5 clk = ~clk;
endmodule