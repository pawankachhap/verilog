// 2:1 multiplexer gate-level model
module mux2to1(
    output Y,
    input [1:0] X,
    input sel
);
wire k1,k2;

and G1(k1,X[0],~sel),
    G2(k2,X[1],sel);
or G3(Y,k1,k2);

endmodule