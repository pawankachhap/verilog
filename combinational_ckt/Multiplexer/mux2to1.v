/* Behavioural model for a 2:1 multiplexer*/

module mux2to1(
    output Y,
    input [1:0] X,
    input sel
);

assign Y = X[sel];

endmodule