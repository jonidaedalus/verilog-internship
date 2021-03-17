module OR(
	input [1:0] A, B,
	output reg [1:0] Y
);

always @*
begin
    Y[0] = A[0] || B[0];
    Y[1] = A[1] || B[1];
end

endmodule