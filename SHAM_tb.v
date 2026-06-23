`timescale 1ns / 1ps

module SHAM_tb;
reg clk;
reg rst;
reg [3:0]A;
reg [3:0]B;

wire [7:0]P;

SHAM uut(
    .clk(clk),
    .rst(rst),
    .A(A),
    .B(B),
    .P(P)
    );
    
always #5 clk = ~clk;

initial begin 

clk=0;rst=1;
#100;
A=4'b1101;
B=4'b1001;
#10;
rst=0;
#50;

rst=1;
A=4'b1001;
B=4'b1001;
#10;
rst=0;

#50;
$finish;
end


endmodule
