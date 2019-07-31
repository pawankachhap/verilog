/* Verilog module for a 4 to 16 bit decoder with enable inout*/

module decoder(
    output [15:0] out,
    input [3:0] in,
    input en
);

reg [15:0] out;

always @(en,in)
    if(en)
        out = 16'h0000;
    else    
    case(in)
    4'b0000: out = 16'h0001;
    4'b0001: out = 16'h0002;
    4'b0010: out = 16'h0004;
    4'b0011: out = 16'h0008;
    4'b0100: out = 16'h0010;
    4'b0101: out = 16'h0020;
    4'b0110: out = 16'h0040;
    4'b0111: out = 16'h0080;
    4'b1000: out = 16'h0100;
    4'b1001: out = 16'h0200;
    4'b1010: out = 16'h0400;
    4'b1011: out = 16'h0800;
    4'b1100: out = 16'h1000;
    4'b1101: out = 16'h2000;
    4'b1110: out = 16'h4000;
    4'b1111: out = 16'h8000;
    default: out = 16'h0;
    endcase

endmodule