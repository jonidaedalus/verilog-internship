module NOT(
    input [1:0] A,
    output reg [1:0] Y
);

always @*
begin
   
    Y[1] = ~A[1];
end


endmodule