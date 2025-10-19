`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2024 11:58:52 PM
// Design Name: 
// Module Name: sine_gen_test

//////////////////////////////////////////////////////////////////////////////////


module sine_gen_test;




reg clk,rst_n;
wire signed [7:0] sine;

sine_generator SINE(
.clk(clk),
.rst_n(rst_n),
.sine(sine)
    );


initial begin
clk=0;
rst_n=1;
#0.1
rst_n=0;
#0.2
rst_n=1;
#100000
$stop;
end

always #20 clk=~clk;


endmodule
