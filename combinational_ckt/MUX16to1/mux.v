/* A 16:1 multiplexer model using structural modeling of two 8:1 mux(s) and a 2:1 mux.
   8:1 mux structural modeling using two 4:1 mux(s) and a 2:1 mux.
   4:1 mux structural modeling using three 2:1 multiplexers.
   2:1 mux is designed using gate-level model
*/

// 16:1 multiplexer structural model using 8:1 & 2:1 mux blocks
module mux16(
    output Y,
    input [15:0] X,
    input [3:0] sel
);
wire [1:0] T;

mux8 dut1(.Y(T[0]),.X(X[7:0]),.sel(sel[2:0]));
mux8 dut2(.Y(T[1]),.X(X[15:8]),.sel(sel[2:0]));
mux2 dut3(.Y(Y),.X(T[1:0]),.sel(sel[3]));

endmodule

// 8:1 multiplexer structural model using 4:1 & 2:1 mux blocks
module mux8(
    output Y,
    input [7:0] X,
    input [2:0] sel
);
wire [1:0] T;

mux4 dut1(.Y(T[0]),.X(X[3:0]),.sel(sel[1:0]));
mux4 dut2(.Y(T[1]),.X(X[7:4]),.sel(sel[1:0]));
mux2 dut3(.Y(Y),.X(T[1:0]),.sel(sel[2]));

endmodule

// 4:1 multiplexer structural model using 2:1 mux block
module mux4(
    output Y,
    input [3:0] X,
    input [1:0] sel
);
wire [1:0] T;

mux2 dut1(.Y(T[0]),.X(X[1:0]),.sel(sel[0]));
mux2 dut2(.Y(T[1]),.X(X[3:2]),.sel(sel[0]));
mux2 dut3(.Y(Y),.X(T[1:0]),.sel(sel[1]));

endmodule

// 2:1 multiplexer gate-level model
module mux2(
    output Y,
    input [1:0] X,
    input sel
);
wire k1,k2;

and G1(k1,X[0],~sel),
    G2(k2,X[1],sel);
or G3(Y,k1,k2);

endmodule