// A 1-bit D-FF for Booth Multiplier

module d_flop(
    q,
    d,
    clk,
    clr
);

input d, clk, clr;
output reg q;

always @(negedge clk)
begin
    if (clr)
        q <= 0;
    else
        q <= d;    
end

endmodule