/* Testbench for 16:1 mux module*/

`timescale 1ns/1ns
`include "mux.v"

module mux_tb();
wire out;
reg [15:0] in;
reg [3:0] select;

mux16 DUT(.Y(out),.X(in),.sel(select));

initial
begin
    $monitor($time," in = %b, select = %b, out = %b",in,select,out);
    $dumpfile("plot.vcd");
    $dumpvars(0,mux_tb);
    select = 4'b0001; in = 16'h1234;
    #5 select = 4'b0010; in = 16'h1234;
    #5 select = 4'b0100; in = 16'h1234;
    #5 select = 4'b1000; in = 16'h1234;
    $finish;
end

endmodule