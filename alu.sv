`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2023 01:37:27
// Design Name: 
// Module Name: alu
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


module not_urg(input logic A,B,C,
           output logic X,Y,Z);
assign A=1;
assign B=1;
assign X=1'bx;
assign Y=1'bx;
assign Z=(A&B)^C;
endmodule

module and_urg(input logic A,B,C,
           output logic X,Y,Z);
assign C=0;
assign X=1'bx;
assign Y=1'bx;
assign Z=(A&B)^C;
endmodule

module nand_urg(
    input logic A,B,C,
    output logic X,Y,Z);
assign C=1;
assign X=1'bx;
assign Y=1'bx;
assign Z=(A&B)^C;
endmodule

module or_urg(input logic A,B,C,
           output logic X,Y,Z);
logic [3:0]N;
nand_urg na1(A,A,1,N[0],N[1],N[2]);
nand_urg na2(B,B,1,N[0],N[1],N[3]);
nand_urg na3(N[2],N[3],1,X,Y,Z);
endmodule

module fulladder_urg(
    input logic A,B,Cin,
    output logic S,Cout);
logic [8:0]I;
logic C=1;
nand_urg n1(A,B,C,I[0],I[1],I[2]);
nand_urg n2(A,I[2],C,I[0],I[1],I[3]);
nand_urg n3(B,I[2],C,I[0],I[1],I[4]);
nand_urg n4(I[3],I[4],C,I[0],I[1],I[5]);
nand_urg n5(Cin,I[5],C,I[0],I[1],I[6]);
nand_urg n6(I[5],I[6],C,I[0],I[1],I[7]);
nand_urg n7(Cin,I[6],C,I[0],I[1],I[8]);
nand_urg n8(I[7],I[8],C,I[0],I[1],S);
nand_urg n9(I[2],I[6],C,I[0],I[1],Cout);
endmodule

module mux_21(input logic A,B,
           input logic cont,
           output logic Y);
logic [4:0]I;
not_urg no1(1,1,cont,I[0],I[1],I[2]);
and_urg a1(A,I[2],0,I[0],I[1],I[3]);
and_urg a2(B,cont,0,I[0],I[1],I[4]);
or_urg o1(I[3],I[4],1,I[0],I[1],Y);
endmodule

module mux_41(input logic A,B,C,D,
           input logic cont1,cont2,
           output logic Y);
logic [1:0]I;
mux_21 m1(A,B,cont1,I[0]);
mux_21 m2(C,D,cont1,I[1]);
mux_21 m3(I[0],I[1],cont2,Y);
endmodule

module alu(input logic A,B,
               input logic alucon0,alucon,
               output logic R,Carry,N);
logic [8:0]I;
not_urg nf1(1,1,B,I[0],I[1],I[2]);
mux_21 m4(B,I[2],alucon0,I[3]);
fulladder_urg f1(A,I[3],alucon0,I[4],I[5]);
and_urg a3(A,B,0,I[0],I[1],I[6]);
or_urg o2(A,B,1,I[0],I[1],I[7]);
mux_41 m5(I[4],I[4],I[6],I[7],alucon0,alucon,R);
not_urg nf2(1,1,alucon,I[0],I[1],I[8]);
and_urg a4(I[5],I[8],0,I[0],I[7],Carry);
assign N=R;
endmodule
