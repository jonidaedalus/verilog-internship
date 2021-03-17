module Qalu(
           input [6:0] A,B,  // ALU 8-bit Inputs                 
           input [3:0] ALU_Sel,// ALU Selection
           output [6:0] ALU_Out, // ALU 8-bit Output
           output CarryOut // Carry Out Flag
    );

    

    reg [6:0] ALU_Result;
    reg [6:0] temp;
    reg [6:0] ten;
    reg [6:0] hun;
    assign ALU_Out = ALU_Result; // ALU out
    assign CarryOut = hun; // Carryout flag

    initial
    begin
        ALU_Result = 0;
        ten = 0;
        temp = 0;
    end


    always @(*)
    begin
      case(ALU_Sel)
      4'b0000:
      begin
          if (A%10 + B%10 > 3)
            ten = 1;
          temp = ten + (A - A%10)/10 + (B-B%10)/10;
          ten = (temp)%4;
          if (temp > 3)
            hun = 1;
          else
            hun = 0;
          ALU_Result = ten * 10 + (A%10 + B%10)%4;
      end
      4'b0001:
      begin
        if(A%10 < B%10)
          ten = 1;
        else
          ten = 0;
        ten = (A - A%10)/10 - (B-B%10)/10 - ten;
        if(A%10 < B%10)
          ALU_Result = ten*10 + ((A%10 - B%10) + 4);
        else
          ALU_Result = ten*10 + (A%10 - B%10);
      end

      4'b0010:
        ALU_Result = A%10*10; // shift left
      4'b0011:
        ALU_Result = (A - A%10)/10; // shift right
      4'b0100:
        ALU_Result = (A>B)? 1 : 0;


      endcase
      

    end

endmodule
