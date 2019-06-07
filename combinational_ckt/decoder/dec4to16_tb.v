/* Testbench for the decoder module*/

`timescale 1ns/1ns
`include "dec4to16.v"

module decoder_tb();
wire [15:0] out;
reg [3:0] in;
reg en;

integer k;
decoder dut(.out(out), .in(in), .en(en));

initial begin
    $dumpfile("plot.vcd");
    $dumpvars(0,decoder_tb);
    en = 1; #10;
    en = 0;
    for(k=0;k<16;++k) begin
        in = k; #10;
    end

    $finish;
end

endmodule