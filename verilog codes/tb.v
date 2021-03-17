`timescale 1ns / 1ns
`include "not.v"

module tb();
reg [1:0] A;
reg [1:0] B;

wire [1:0] Y;

NOT test(A, Y);

initial
begin
    $dumpfile("not.vcd");
    $dumpvars(0, tb);
    A = 0;

    #3;
    A = 0;

    #3;
    A = 0;

    #3;
    A = 0;

    #3;
    A = 1;

    #3;
    A = 1;

    #3;
    A = 1;

    #3;
    A = 2;

    #3;
    A = 2;

    #3;
    A = 3;

    #3;

    $display("test is done");
end

endmodule