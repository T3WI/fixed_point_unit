`ifndef DEFS_DONE           // preprocessor directive for include guarding
    `define DEFS_DONE 
    package fpu_package;
        // type definitions
        typedef enum {LOGIC_SHIFT, ARITH_SHIFT, CIRC_SHIFT, LZD, BARREL, REV, ADD, SUB, MUL, DIV,
        MAC} sel_modes;
        parameter INPUT_WIDTH = 32;
        parameter OUTPUT_WIDTH = 40;
        
        // function definitions
        /* Each shift function takes the data in in1, and the number of bits shifted in in2. Shift 
            direction is specified with dir. To shift left, set dir to 0, to shift right, set dir to 1.
        */
        function automatic logic[OUTPUT_WIDTH - 1:0] logic_shift(logic [INPUT_WIDTH - 1: 0] in1, logic [INPUT_WIDTH - 1: 0] in2, logic dir);
            return (dir) ? in1 >> in2 : in1 << in2; 
        endfunction

        function automatic logic[OUTPUT_WIDTH - 1:0] arith_shift(logic [INPUT_WIDTH - 1: 0] in1, logic [INPUT_WIDTH - 1: 0] in2, logic dir);
            return (dir) ? in1 >>> in2 : in1 <<< in2;
        endfunction 

        function automatic logic[OUTPUT_WIDTH - 1:0] circ_shift(logic [INPUT_WIDTH - 1: 0] in1, logic [INPUT_WIDTH - 1: 0] in2, logic dir);
            return (dir) ? (in1 >> in2) | (in1 << INPUT_WIDTH - in2): (in1 << in2) | (in1 >> INPUT_WIDTH - in2);
        endfunction 

        function automatic logic[OUTPUT_WIDTH - 1:0] lzd(logic [INPUT_WIDTH - 1: 0] in1);
        endfunction 

        function automatic logic[OUTPUT_WIDTH - 1:0] barrel(logic [INPUT_WIDTH - 1: 0] in1);
        endfunction 

        function automatic logic[OUTPUT_WIDTH - 1:0] rev(logic [INPUT_WIDTH - 1: 0] in1);
        endfunction 

    endpackage

    import fpu_package::*;  // import package into $unit
`endif