// Data Path module for the Booth's Multiplier

`include "shiftregister.v"
`include "PIPO_reg.v"
`include "d_flop.v"
`include "alu.v"
`include "counter.v"

module data_path(
    stop,
    q0,
    qd,
    clk,
    data_in,
    ldA,
    clrA,
    sftA,
    ldQ,
    clrQ,
    sftQ,
    clrff,
    ldM,
    addsub,
    ldcount,
    decount
);

parameter N = 8;

input [N-1:0] data_in;
input clk, ldA, clrA, sftA;
input ldQ, clrQ, sftQ;
input ldM, clrff, addsub, ldcount,decount;

output stop, q0, qd;

wire [N-1:0] A,M,Z,Q;
wire [3:0] count;

assign stop = ~|count;    //to check when count reaches 4'b0000
assign q0 = Q[0];         //q0 gives the LSB of Q(Multiplier)

shiftreg AR(.data_out(A),.data_in(Z),.serial_in(A[N-1]),.clk(clk),.load(ldA),.clear(clrA),.shift(sftA));
shiftreg QR(.data_out(Q),.data_in(data_in),.serial_in(A[0]),.clk(clk),.load(ldQ),.clear(clrQ),.shift(sftQ));
PIPO_reg MR(.data_out(M),.data_in(data_in),.clk(clk),.load(ldM));
d_flop dff(.q(qd),.d(Q[0]),.clk(clk),.clr(clrff));
ALU DUT(.out(Z),.in1(A),.in2(M),.addsub(addsub));
counter CR(.count(count),.clk(clk),.load(ldcount),.dec(decount));

endmodule