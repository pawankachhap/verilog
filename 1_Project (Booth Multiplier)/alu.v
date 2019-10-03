// ALU module for Booth's Multiplier
// which performs addition and subtraction of
// partial products

module ALU(
    out,
    in1,
    in2,
    addsub
);

parameter N = 8;

input [N-1:0] in1,in2;
input addsub;

output reg [N-1:0] out;

always @(*)
begin
    if (addsub==0)
        out = in1-in2;
    else if(addsub == 1)
        out = in1+in2;    
end

endmodule