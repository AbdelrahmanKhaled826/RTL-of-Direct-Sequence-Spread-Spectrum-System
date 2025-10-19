`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2024 05:36:32 AM
// Design Name: 
// Module Name: seq_multiplier
//////////////////////////////////////////////////////////////////////////////////


module seq_multiplier(
input clk,
input rst_n,
input data,
output wire seq
    );
    
    wire pn;
    
    // two bit multiplier = xnor
    /*
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n )begin
            seq<=0;
        end
        else begin
        seq<= ~(pn ^ data);
        
        end
    
    end
    */
    
    assign seq =(!rst_n )? 0: (clk)? ~(pn ^ data):seq ;
    
    pn_seq PN (
    .clk(clk),
    .rst_n(rst_n),
    .pn(pn)
    );
    
    
    
endmodule
