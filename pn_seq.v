
`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////
// Engineer: Abdelrahman Khaled elsayed
// Create Date: 08/14/2024 09:10:36 AM
// Module Name: pn_seq
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////



module pn_seq(

input clk,
input wire rst_n,
output reg pn

    );
    /*
    L=2^N -1 
    N=4 register 
    L=15
    */
    reg [3:0] counter; //becouse seq repeate after 15 clock cycle
    reg [3:0] lfsr;
    
    always @(posedge clk , negedge rst_n)
    begin
   // pn<=lfsr[0];
        if(!rst_n) begin
            lfsr<=4'b0000;
           pn<=1'b0;
        end
        else if(counter == 4'b1110)begin
            lfsr<=4'b0000;
        end
        else begin
          
            pn<=lfsr[0];
            lfsr<={~( lfsr[0]^lfsr[3]),lfsr[3:1]}; //xnor and shift right
           
        
        end
    end
    
    //for counter 
     always @(posedge clk or negedge rst_n )
       begin
           if(!rst_n ) begin
               counter<=4'b0;
           end
           else if(counter == 4'b1110) //count from 0:14
           begin
            counter<=4'b0000;
            
           end
           else begin
               counter<=counter+1'b1;
           
           end
       end
       
    
   
    
   
    
    
    
    
    
endmodule
