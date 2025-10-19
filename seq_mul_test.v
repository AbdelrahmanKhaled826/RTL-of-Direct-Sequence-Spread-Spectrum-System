`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2024 05:52:41 AM
// Design Name: 
// Module Name: seq_mul_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seq_mul_test;

wire seq;
reg clk,rst_n,data_in;


initial begin
clk=0;
data_in=0;
rst_n=0;
#1
rst_n=1;
#4
data_in=1;
repeat(15) @ (posedge clk); // data with rate 15us period 
data_in=0;
repeat(15) @ (posedge clk);
repeat(15) @ (posedge clk);
data_in=1;
repeat(15) @ (posedge clk);
repeat(15) @ (posedge clk);
repeat(15) @ (posedge clk);
data_in=0;
repeat(15) @ (posedge clk);
data_in=1;
repeat(15) @ (posedge clk);
$finish;
end



seq_multiplier SEQ(
.clk(clk),
.rst_n(rst_n),
.data(data_in),
.seq(seq)
    );
always #5 clk=~clk;


endmodule
