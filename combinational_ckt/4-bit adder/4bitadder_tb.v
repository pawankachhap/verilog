/* Testbench for the 4-bit ripple carry adder */

`timescale 1ns/1ns
`include "4bitadder.v"

module adder4bit_tb();
reg [3:0] A;
reg [3:0] B;
reg Cin=0;
wire [3:0] sum;
wire carry;

adder4bit DUT(.A(A), .B(B), .Cin(Cin), .sum(sum), .carry(carry));

initial begin
    $monitor("A=%b B=%b sum=%b carry=%b",A,B,sum,carry);
    $dumpfile("plot.vcd");
    $dumpvars(0,adder4bit_tb);
    
    A= 4'b0001; B= 4'b0001; #10;
    A= 4'b0010; B= 4'b0010; #10;
    A= 4'b0100; B= 4'b0011; #10;
    A= 4'b1001; B= 4'b0100; #10;
    A= 4'b1101; B= 4'b0101; #10;

    $finish;
end

endmodule