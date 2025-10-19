`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2024 11:23:34 PM
// Design Name: 
// Module Name: sine_generator

//////////////////////////////////////////////////////////////////////////////////


module sine_generator(
input clk,
input rst_n,
output reg signed [7:0] sine
    );
    
    
    
    //Generate LUT
    /*
         
    **  number of samples 36
    **  each sample represent in 8 bits

    **  samples from matlab:
                            sin(i*2*pi/N)   N number of samples = 36
                            sin(i*10)       i=0:N-1
                                    
    **  then convert it to fixed point by fi and make word length 8 and fraction 6
                                    
    0    0.1719    0.3438    0.5000    0.6406    0.7656    0.8594    0.9375    0.9844    1.0000                       
    0.9844    0.9375    0.8594    0.7656    0.6406    0.5000    0.3438    0.1719         0   -0.1719        
    -0.3438   -0.5000   -0.6406   -0.7656   -0.8594   -0.9375   -0.9844   -1.0000   -0.9844   -0.9375                               
    0.8594   -0.7656   -0.6406   -0.5000   -0.3438   -0.1719

    */
    
    
          
          
          
     reg [6:0] sine_lut [0:18];
     reg [5:0] counter ; //act as address      
               initial 
               begin
                          sine_lut[0]  = 7'b000_0000; // sin(0)   = 0.0
                          sine_lut[1]  = 7'b000_1011; // sin(10)  = 0.1736
                          sine_lut[2]  = 7'b001_0110; // sin(20)  = 0.3420
                          sine_lut[3]  = 7'b010_0000; // sin(30)  = 0.5
                          sine_lut[4]  = 7'b010_1000; // sin(40)  = 0.6428
                          sine_lut[5]  = 7'b011_0000; // sin(50)  = 0.7660
                          sine_lut[6]  = 7'b011_0111; // sin(60)  = 0.8660
                          sine_lut[7]  = 7'b011_1100; // sin(70)  = 0.9397
                          sine_lut[8]  = 7'b011_1111; // sin(80)  = 0.9848
                          sine_lut[9]  = 7'b100_0000; // sin(90)  = 1.0
                          sine_lut[10]  = 7'b011_1111; // sin(80)  = 0.9848
                          sine_lut[11]  = 7'b011_1100; // sin(70)  = 0.9397
                          sine_lut[12]  = 7'b011_0111; // sin(60)  = 0.8660
                          sine_lut[13]  = 7'b011_0000; // sin(50)  = 0.7660
                          sine_lut[14]  = 7'b010_1000; // sin(40)  = 0.6428
                          sine_lut[15]  = 7'b010_0000; // sin(30)  = 0.5
                          sine_lut[16]  = 7'b001_0110; // sin(20)  = 0.3420
                          sine_lut[17]  = 7'b000_1011; // sin(10)  = 0.1736
                          sine_lut[18]  = 7'b000_0000; // sin(0)   = 0.0
                 end 
             
    
    
    
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n) begin
            sine<=8'b0;
        end
        else if(counter <= 6'b10010 ) begin  //becous 18 half sine +ve and 18 half sine -ve
              sine <= {1'b0, sine_lut[counter]};
        end
        else begin
               sine <= ~sine_lut[counter-18]+1;  //2's complement instead of store these value in lut
        end
    end
    
    
    
     always @(posedge clk or negedge rst_n)begin
           if(!rst_n) begin
               counter<=8'b0;
           end
           else if(counter == 6'd35) begin
                counter<=6'b0;
            end
            else begin
                 counter<= counter +1'b1;
            end
   
       end
    
    
    
    
      
      
     
    
endmodule
