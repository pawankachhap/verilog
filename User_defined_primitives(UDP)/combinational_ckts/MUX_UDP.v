/* An UDP for 4:1 multiplexer */

primitive udp_mux(out, s1,s2, i3,i2,i2,i0);
input s1,s0,i3,i2,i1,i0;
output out;

// truth table for 4:1 mux
table
  //s1 s0  i3 i2 i1 i0 : out
    0  0   ?  ?  ?  0  :  0;
    0  0   ?  ?  ?  1  :  1;
    0  1   ?  ?  0  ?  :  0;
    0  1   ?  ?  1  ?  :  1;
    1  0   ?  0  ?  ?  :  0;
    1  0   ?  1  ?  ?  :  1;
    1  1   0  ?  ?  ?  :  0;
    1  1   1  ?  ?  ?  :  1;
endtable
endprimitive