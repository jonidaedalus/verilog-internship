
 `timescale 1ns / 1ps  
 `include "Qalu.v"
module testbench;

 reg[6:0] A,B;
 reg[3:0] ALU_Sel;

 wire[6:0] ALU_Out;
 wire CarryOut;

 integer i;
 Qalu test_unit(
            A,B,  // ALU 8-bit Inputs                 
            ALU_Sel,// ALU Selection
            ALU_Out, // ALU 8-bit Output
            CarryOut // Carry Out Flag
     );
    initial begin

      $dumpfile("subtraction.vcd");
      $dumpvars(0, testbench);
      A = 13;
      B = 13;
    

      ALU_Sel = 4'b0001;
      #10;
      A = 12;
      B = 3; 
      #10;
      A = 32;
      B = 13;
      #10;
      A = 21;
      B = 12;
      $display(A%10 - B%10);
      #10;
      A = 32;
      B = 23;
      #10;
      
    end
endmodule