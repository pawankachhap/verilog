// A 1-bit D-FF for Booth Multiplier

module d_flop(
    q,
    d,
    clk,
    clr
);

input d, clk, clr;
output q;

always @(posedge clk)
begin
    if (clr)
        q <= 0;
    else
        q <= d;    
end

endmodule