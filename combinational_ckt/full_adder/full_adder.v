/* Module for full adder using two half adders*/

`include "half_adder.v"

module full_adder(
    input A,
    input B,
    input Z,
    output sum,
    output carr
);

wire s1;
wire c1;
wire c2;

half_adder HA1(A,B,s1,c1);
half_adder HA2(s1,Z,sum,c2);

assign carr = c1|c2;

endmodule