//Testbench for the pipe1 module
`include "pipe1.v"

module pipe1_tb();
parameter N = 8;
wire [N-1:0] F;
reg [N-1:0] A,B,C,D;
reg clk;

pipe1 DUT(F,A,B,C,D,clk);

// Clock signal initialization
initial
begin
    clk = 1'b0;
end

// Clock signal with time period 10 units
always
begin
    #10 clk = ~clk;
end

initial
begin
    $dumpfile("plot.vcd");
    $dumpvars(0,pipe1_tb);
    $monitor($time, " A=%h B=%h C=%h D=%h F=%h", A,B,C,D,F);

    #250 $finish;
end

//The stream of inputs
initial
begin
    #5  A=1; B=1; C=2; D=1;
    #20 A=2; B=3; C=4; D=2;
    #20 A=3; B=5; C=6; D=3;    
    #20 A=4; B=7; C=8; D=4;
    #20 A=5; B=9; C=10; D=5;
    #20 A=6; B=11; C=12; D=6;
    #20 A=7; B=13; C=14; D=7;
    #20 A=8; B=15; C=16; D=8;
    #20 A=9; B=17; C=18; D=9;
    #20 A=10; B=19; C=20; D=10;
    #20 A=11; B=21; C=22; D=11;
end

endmodule