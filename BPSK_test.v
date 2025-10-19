`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2024 05:55:29 AM
// Design Name: 
// Module Name: BPSK_test

//////////////////////////////////////////////////////////////////////////////////


module BPSK_test;
reg clk_10u,clk_40n,rst_n,data_in;
wire signed [7:0] signal_modulation;

BPSK MODULATION(
.clk1(clk_10u),
.clk2(clk_40n),
.rst_n(rst_n),
.data_in(data_in),
.modulation(signal_modulation)
    );
    
    
    initial begin
    rst_n=1;
    clk_10u=0;
    clk_40n=0;
    
    #0.1
    rst_n=0;
    #0.1
    rst_n=1;
    end
    
    
    initial begin 
    
    data_in=0;
    repeat(15) @ (posedge clk_10u); // data with rate 15us period 
    data_in=0;
    repeat(15) @ (posedge clk_10u);
    repeat(15) @ (posedge clk_10u);
    data_in=1;
    repeat(15) @ (posedge clk_10u);
    repeat(15) @ (posedge clk_10u);
    repeat(15) @ (posedge clk_10u);
    data_in=0;
    repeat(15) @ (posedge clk_10u);
    data_in=1;
    repeat(15) @ (posedge clk_10u);
    data_in=0;
    repeat(15) @ (posedge clk_10u); 
    data_in=0;
    repeat(15) @ (posedge clk_10u);
    repeat(15) @ (posedge clk_10u);
    data_in=1;
    repeat(15) @ (posedge clk_10u);
    repeat(15) @ (posedge clk_10u);
    repeat(15) @ (posedge clk_10u);
    data_in=0;
    repeat(15) @ (posedge clk_10u);
    data_in=1;
    repeat(15) @ (posedge clk_10u);
    #100000
    $stop;
    
    end 
    
    
  always #20 clk_40n=~clk_40n;  
   always #5000 clk_10u=~clk_10u; 
endmodule
