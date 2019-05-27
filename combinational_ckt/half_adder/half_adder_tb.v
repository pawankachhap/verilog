`timescale 1s/100ms
`include "half_adder.v"

module half_adder_tb();
    reg A;
    reg B;
    wire S;
    wire C;

half_adder HA1(A,B,S,C);

initial
begin
    $monitor("x=%b, y=%b, sum=%b, carry=%b",A,B,S,C);
    $dumpfile("half_adder.vcd");
    $dumpvars(0,half_adder_tb);

    A=0; B=0;
    #5; A=0; B=1;
    #5; A=1; B=0;
    #5; A=1; B=1;
    #5;

    $finish;
end

endmodule