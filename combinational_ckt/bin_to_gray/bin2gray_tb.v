// test bench for the
// binary to gray converter

`timescale 1ns/100ps
`include "bin2gray.v"

module bin2gray_tb();

wire [7:0] gray;
reg [7:0] bin;

bin2gray DUT(gray,bin);

initial
begin
    $dumpfile("plot.vcd");
    $dumpvars(0,bin2gray_tb);
    bin = 8'b01010101;
    #5 bin = 8'b00100100;
    #5 bin = 8'b11011101;
    #5 bin = 8'b00011101;

    #5 $finish;
end

endmodule