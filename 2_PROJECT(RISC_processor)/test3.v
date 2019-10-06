// Test program to run on the
// 32-bit RISC processor
// Program :
// Swapping the stored data of two memory loacations
// Stored word : Mem[120] = 40 ; Mem[240] = 80;

`timescale 1ns/10ps
`include "pipe_MIPS32.v"

module test3;
reg clk1, clk2;
integer k;

//instantiation of the RISC processor
pipe_MIPS risc(clk1,clk2);

//Generating two-phase clock
initial
begin
    clk1 = 0;
    clk2 = 0;
    repeat(20)
    begin
      #5 clk1 = 1; #5 clk1 = 0;
      #5 clk2 = 1; #5 clk2 = 0;
    end
end

//Initializing the registers
initial
begin
    for(k=0;k<32;k++)
        risc.Reg[k]=k;

    // Loading the program code in the Memory
    risc.Mem[0] = 32'h28010078;  // ADDI R1,R0,120
    risc.Mem[1] = 32'h280300f0;  // ADDI R3,R0,240
    risc.Mem[2] = 32'h0ce77800;  // OR R7,R7,R7  DUMMY INSTR
    risc.Mem[3] = 32'h0ce77800;  // OR R7,R7,R7  DUMMY INSTR
    risc.Mem[4] = 32'h20220000;  // LW R2,0(R1)
    risc.Mem[5] = 32'h20640000;  // LW R4,0(R3)
    risc.Mem[6] = 32'h24620000;  // SW R2,0(R3)
    risc.Mem[7] = 32'h24240000;  // SW R4,0(R1)
    risc.Mem[8] = 32'hfc000000;  // HLT

    risc.Mem[120] = 40;
    risc.Mem[240] = 80;
    risc.PC = 0;
    risc.HALTED = 0;
    risc.BRANCH_TAKEN = 0;

    #280
    $display("Mem[120] = %2d",risc.Mem[120]);
    $display("Mem[240] = %2d",risc.Mem[240]);
end

initial
begin
    $dumpfile("test3.vcd");
    $dumpvars(0,test3);

    #300 $finish;
end

endmodule