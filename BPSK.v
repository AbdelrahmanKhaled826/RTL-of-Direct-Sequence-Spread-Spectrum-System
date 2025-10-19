`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2024 05:32:49 AM
// Design Name: 
// Module Name: BPSK
//////////////////////////////////////////////////////////////////////////////////


module BPSK(
input clk1,clk2,
input rst_n,
input data_in,
output reg signed [7:0] modulation
    );
    wire data_out;
    wire signed [7:0] sine_wave;
   seq_multiplier spread_signal( //chip rate =100khz= 10 us , bit rate 150us 
   .clk(clk1),
   .rst_n(rst_n),
   .data(data_in),
   .seq(data_out)
       );
    
     sine_generator SINE( //sample frequancy 250Mhz=40ns
      .clk(clk2),
      .rst_n(rst_n),
      .sine(sine_wave)
          );
    
    
    always @(posedge clk2 or negedge rst_n)begin
        if(!rst_n) modulation<=0;
        else if(data_out==1) modulation<=sine_wave;
        else if(data_out==0) modulation<= ~sine_wave +1 ;
        else modulation<=0;
        
    end
    
    
endmodule
