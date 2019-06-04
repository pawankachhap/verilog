/* Testbench for the full adder module*/

`timescale 1ns/1ns
`include "full_adder.v"

module full_adder_tb();
    reg x;
    reg y;
    reg z;
    wire s;
    wire c;

full_adder DUT(x,y,z,s,c);

initial
begin
    $monitor("x=%b, y=%b, z=%b, sum=%b, carry=%b",x,y,z,s,c);
    $dumpfile("fa_tb.vcd");
    $dumpvars(0,full_adder_tb);

    x=0; y=0; z=0; #10;
    x=0; y=0; z=1; #10;
    x=0; y=1; z=0; #10;
    x=0; y=1; z=1; #10;
    x=1; y=0; z=0; #10;
    x=1; y=0; z=1; #10;
    x=1; y=1; z=0; #10;
    x=1; y=1; z=1; #10;

    $finish;
end

endmodule