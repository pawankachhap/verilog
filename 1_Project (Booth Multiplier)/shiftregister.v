//  n-bit Arithmetic right Shift Register module for Booth Multiplier

module shiftreg(
    data_out,
    data_in,
    serial_in,
    clk,
    load,
    clear,
    shift
);

parameter N = 8;

input [N-1:0] data_in;
input serial_in;
input clk, load, clear, shift;

output reg [N-1:0] data_out;

always @(negedge clk)
begin
    if (clear) data_out <= 0;                       //initializing the register
    else if (load) data_out <= data_in;             //loading the register
    else if(shift)
        data_out <= {serial_in,data_out[N-1:1]};   //arithmetic right shift
end

endmodule