// Test program to run on the
// 32-bit RISC processor
// Program :
// Add three numbers 15, 20 and 25 stored in registers
// R1 = 15, R2 = 20, R3 = 30
// Sum R4 = R1+R2 and final sum R5 = R4+R3

`timescale 1ns/10ps
`include "pipe_MIPS32.v"

module test1_sum;
reg clk1, clk2;
integer k;

//Instantiation of the processor
pipe_MIPS sum(clk1, clk2);

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
          sum.Reg[k] = k;

      //Loading the program machine code
      sum.Mem[0] = 32'h0ce77800;  // OR R7,R7,R7  DUMMY INSTR
      sum.Mem[1] = 32'h2801000f;  // ADDI R1,R0,15
      sum.Mem[2] = 32'h28020014;  // ADDI R2,R0,20
      sum.Mem[3] = 32'h28030019;  // ADDI R3,R0,25
      sum.Mem[4] = 32'h0ce77800;  // OR R7,R7,R7  DUMMY INSTR
      sum.Mem[5] = 32'h0ce77800;  // OR R7,R7,R7  DUMMY INSTR
      sum.Mem[6] = 32'h00222000;  // ADD R4,R1,R2
      sum.Mem[7] = 32'h0ce77800;  // OR R7,R7,R7  DUMMY INSTR
      sum.Mem[8] = 32'h00832800;  // ADD R5,R4,R3
      sum.Mem[9] = 32'hfc000000;  // HLT

      sum.HALTED = 0;
      sum.PC = 0;
      sum.BRANCH_TAKEN = 0;

      #280
      for(k=0;k<6;k++)
        $display("R%1d - %2d", k,sum.Reg[k]);
  end

initial
  begin
      $dumpfile("test1.vcd");
      $dumpvars(0,test1_sum);
      #300 $finish;
  end

endmodule