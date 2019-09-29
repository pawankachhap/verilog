//Pipelining example - 1
//A combinational logic system with :
//Four N-bit unsigned numbers A,B,C and D ans inputs
//An N-bit number F as output
//The logic is given in three stages:
// S1 : x1 = A+B; x2 = C-D;
// S2 : x3 = x1+x2;
// S3 : F = x3*D;

module pipe1(
    F,A,B,C,D,clk
);

parameter N = 8;

output [N-1:0] F;
input [N-1:0] A,B,C,D;
input clk;

reg [N-1:0] L12_x1, L12_x2, L12_D, L23_x3, L23_D, L34_F;

assign F = L34_F;    // assigning the output reg to wire output F

//stage 1
always @(posedge clk)
begin
    L12_x1 <= #4 A + B;
    L12_x2 <= #4 C - D;
    L12_D  <= D;
end

//stage 2
always @(posedge clk)
begin
    L23_x3 <= #4 L12_x1 + L12_x2;
    L23_D  <= L12_D;
end

//stage 3
always @(posedge clk)
begin
    L34_F <= #6 L23_x3 * L23_D;
end

endmodule