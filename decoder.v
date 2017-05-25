`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:48:50 05/20/2017 
// Design Name: 
// Module Name:    Decode 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module decoder(
    input [15:0] instr,
    output [2:0] in1,
    output [2:0] in2,
    output show,
    output [7:0] dataAddr,
    output [3:0] aluop,
    output isjump,
    output write,
    output isjumpz
    );
	// wire in1;
wire [15:0] instr;
     reg[2:0] in1;
 reg    [2:0] in2;
   reg  show;
   reg  [7:0] dataAddr;
   reg   [3:0] aluop;
     reg isjump;
      reg write;
      
	 always @(instr)
	 begin
  if (instr[15] == 0) 
			begin
      aluop<= instr[14:6];
      in1 <= instr[5:3];
		in2 <= instr[2:0];
      isjump <= 0;
         if (aluop == 5) begin
              write <= 0;
              show <= 1;
         end else if (aluop == 6) begin
               Write <= 0;
               show <= 0;
         end else begin
                 show <= 0;
                 write <= 0;
         end
         end
 end
endmodule