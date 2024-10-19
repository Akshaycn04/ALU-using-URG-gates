`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2023 01:38:11
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
logic A,B;
logic alucon0,alucon;
logic R,Carry,N;
alu uut(A,B,alucon0,alucon,R,Carry,N);
initial 
begin
        A=0;B=0;
      
        alucon0=0;
        alucon=0;
    #10 alucon0=1;
        alucon=0;
    #10 alucon0=0;
        alucon=1;
    #10 alucon0=1;
        alucon=1;
     #10;
     A=0;B=1;
        alucon0=0;
        alucon=0;
    #10 
        alucon0=1;
        alucon=0;
    #10 
        alucon0=0;
        alucon=1;
    #10 alucon0=1;
        alucon=1;
    #10;
    A=1;B=0;
        alucon0=0;
        alucon=0;
    #10 alucon0=1;
        alucon=0;
    #10 alucon0=0;
        alucon=1;
    #10 alucon0=1;
        alucon=1;
    #10;
    A=1;B=1;
       
        alucon0=0;
        alucon=0;
    #10 
        alucon0=1;
        alucon=0;
    #10 alucon0=0;
        alucon=1;
    #10 alucon0=1;
        alucon=1;
     #10;    
$finish;
end
endmodule
