/* UDP description of a D latch */

primitive udp_dlatch(q,d,clk,clr);
input d,clk,clr;
output reg q;

//initializing the state of latch, it is optional
initial
    q = 0;

// state-transition table for D-latch
table
  // d clk clr : q : q_new
     ?  ?   1  : ? :   0;
     1  1   0  : ? :   1;
     0  1   0  : ? :   0;
     ?  0   0  : ? :   -;    // retains previous state
endtable
endprimitive