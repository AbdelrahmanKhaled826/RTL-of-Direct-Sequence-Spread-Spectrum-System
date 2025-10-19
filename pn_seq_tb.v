
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 08/14/2024 09:25:53 AM
// Module Name: pn_seq_tb
//////////////////////////////////////////////////////////////////////////////////


module pn_seq_tb;


reg clk,rst_n;
wire pn;


initial 
begin
    clk=0;
    rst_n=1;
    #100
    rst_n=0;
    #100
    rst_n=1;
  
  
  #500
  $finish;
end
//10us
always #5000 clk=~clk;

pn_seq PN_GEN(

.clk(clk),
.rst_n(rst_n),
.pn(pn)
    );

  



endmodule
