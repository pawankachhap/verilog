// A PIPO register for multiplicand application in
// Booth's Multiplier

module PIPO_reg(
    data_out,
    data_in,
    clk,
    load
);

parameter N = 8;

input [N-1:0] data_in;
input clk, load;

output reg [N-1:0] data_out;

always @(posedge clk)
begin
    if(load)
        data_out <= data_in;
end

endmodule