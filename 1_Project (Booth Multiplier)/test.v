//testbench for Booth's Multiplier

`timescale 1ns/10ps
`include "data_path.v"
`include "controller.v"

module test();
reg [7:0] data_in;
reg start,clk;
wire done;

wire [15:0] result;

data_path dut1(stop,q0,qd,clk,data_in,ldA,clrA,sftA,ldQ,clrQ,sftQ,clrff,ldM,addsub,ldcount,decount);
controller dut2(ldA,clrA,sftA,ldQ,clrQ,sftQ,clrff,ldM,addsub,ldcount,decount,done,clk,q0,qd,stop,start);

assign result = {dut1.A,dut1.Q};

initial
begin
    clk=1'b0;
    start= 0;
    #200 $finish;
end

//Generating CLK signal with time period 10 units
always #5 clk= ~clk;

initial
begin
    #2 start = 1;
    #15 data_in = 8'b00000110;
    #10 data_in = 8'b00000100;
end

initial
begin
    $dumpfile("plot.vcd");
    $dumpvars(0,test);

    $monitor($time," Result : %b", result);
end

endmodule