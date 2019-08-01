/* An N-bit ripple carry adder design using the generate block available in Verilog */

module gen_add(sum, carry_out, a, b, carry_in);

// Declaring a constant
parameter N = 4;

// Port declaration
output [N-1:0] sum;
output carry_out;
input [N-1:0] a, b;
input carry_in;
wire [N:0] carry;

assign carry[0] = carry_in;
assign carry_out = carry[N];

// Declaring a variable with genvar keyword
// only purpose of this variable is to instantiate
// the generate block, it does not have any role in simulation and synthesis
genvar p;

// Generate loop block
generate for(p=0; p<N; p=p+1)
begin: fa_block
    wire t1,t2,t3;
    xor G1(t1, a[p], b[p]), G2(sum[p], t1, carry[p]);
    and G3(t2, a[p], b[p]), G4(t3, t1, carry[p]);
    or G5(carry[p+1], t2, t3);
end
endgenerate
endmodule