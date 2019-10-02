//  n-bit Arithmetic right Shift Register module for Booth Multiplier

module shiftreg(
    data_out,
    data_in,
    serial_in,
    clk,
    load,
    clear,
    shfit
);

parameter N = 8;

input [N-1:0] data_in;
input serial_in;
input clk, load, clear, shift;

output reg [N-1] data_out;

always @(posedge clk)
begin
    if (clr) data_out <= 0;                       //initializing the register
    else if (ld) data_out <= data_in;             //loading the register
    else if(sft)
        data_out <= {serial_in,data_out[15:1]};   //arithmetic right shift
end

endmodule