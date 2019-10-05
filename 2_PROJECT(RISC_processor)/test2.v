// Test program to run on the
// 32-bit RISC processor
// Program :
// Load a word stored in memory location Mem[120]
// to a register
// Subtracting 10 from the stored value
// Store the result in memory location Mem[121]

`timescale 1ns/10ps
`include "pipe_MIPS32.v"

module test2;
reg clk1, clk2;
integer k;

//instantiate the processor

pipe_MIPS risc(clk1,clk2);

//Generation of Clock signals
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

// Initializing the registers and storing
// program in the memory Mem[]
initial
  begin
      for(k=0;k<32;k++)
          risc.Reg[k] = k;

      //Loading the program in memory
      risc.Mem[1] = 32'h28010078;  // ADDI R1,R0,120
      risc.Mem[2] = 32'h0ce77800;  // OR R7,R7,R7  DUMMY INSTR
      risc.Mem[3] = 32'h20220000;  // LW R2,0(R1)
      risc.Mem[4] = 32'h0ce77800;  // OR R7,R7,R7  DUMMY INSTR
      risc.Mem[5] = 32'h2c42000a;  // SUBI R2,R2,10
      risc.Mem[6] = 32'h0ce77800;  // OR R7,R7,R7  DUMMY INSTR
      risc.Mem[7] = 32'h24220001;  // SW R2,1(R1)
      risc.Mem[8] = 32'hfc000000;  // HLT

      risc.Mem[120] = 40;
      risc.PC = 1;
      risc.HALTED = 0;
      risc.BRANCH_TAKEN = 0;

      #500
      for(k=0;k<3;k++)
          $display("R%1d - %2d", k,risc.Reg[k]);
      $display("\nMemory[120] = %4d",risc.Mem[120]);
      $display("\nMemory[121] = %4d",risc.Mem[121]);
  end

initial
  begin
      $dumpfile("test2.vcd");
      $dumpvars(0,test2);
      #600 $finish;
  end

endmodule