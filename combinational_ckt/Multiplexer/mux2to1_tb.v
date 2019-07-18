/* Testbench for the 2:1 multiplexer */

`timescale 10ns/1ns
`include "mux2to1.v"

module mux_tb();
wire out;
reg [1:0] in;
reg select;
integer k;

mux2to1 dut(.Y(out),.X(in),.sel(select));

initial begin
    $dumpfile("plot.vcd");
    $dumpvars(0,mux_tb);

    for(k=0;k<2;++k)
    begin
        select = k;
        in = 2'b00;
        #5 in = 2'b01;
        #5 in = 2'b10;
        #5 in = 2'b11;
        #5;
    end
    $finish;
end

endmodule