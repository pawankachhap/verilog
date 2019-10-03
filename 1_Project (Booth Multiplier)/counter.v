// Down counter for Booth's Multiplier

module counter (
    count,
    clk,
    load,
    dec
);

parameter N = 3;    //Number of bits of the counter
parameter M = 8;    //Number of steps in the Booth's algorithn

input clk, load, dec;
output reg [N:0] count;

always @(negedge clk)
begin
    if (load)
        count <= M;
    else if (dec)
        count <= count - 1;    
end

endmodule