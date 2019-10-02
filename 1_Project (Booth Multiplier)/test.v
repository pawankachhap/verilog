//testbench for Booth's Multiplier

module test();
reg [7:0] data_in;
reg start;

wire done;

data_path dut1();
controller dut2();