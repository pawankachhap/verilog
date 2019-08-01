/* Testbench for the N-bit ripple carry adder */

`timescale 1ns/1ns
`include "gen_adder.v"

module adder_tb();
parameter N = 4;
reg [N-1:0] A;
reg [N-1:0] B;
reg Cin=0;
wire [N-1:0] sum;
wire carry;

gen_add DUT(.sum(sum), .carry_out(carry), .a(A), .b(B), .carry_in(Cin));

initial begin
    $monitor("A=%b B=%b sum=%b carry=%b",A,B,sum,carry);
    $dumpfile("plot.vcd");
    $dumpvars(0,adder_tb);
    
    A= 4'b0001; B= 4'b0001; #10;
    A= 4'b0010; B= 4'b0010; #10;
    A= 4'b0100; B= 4'b0011; #10;
    A= 4'b1001; B= 4'b0100; #10;
    A= 4'b1101; B= 4'b0101; #10;

    $finish;
end

endmodule