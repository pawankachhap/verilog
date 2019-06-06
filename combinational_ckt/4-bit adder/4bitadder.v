/* Module for a 4-bit ripple carry adder using four full adders */

`include "full_adder.v"

module adder4bit(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] sum,
    output carry
);
 wire C1,C2,C3;

full_adder fa1(A[0], B[0], Cin, sum[0], C1);
full_adder fa2(A[1], B[1], C1, sum[1], C2);
full_adder fa3(A[2], B[2], C2, sum[2], C3);
full_adder fa4(A[3], B[3], C3, sum[3], carry);

endmodule