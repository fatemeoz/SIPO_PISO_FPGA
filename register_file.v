`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:23:32 05/18/2017 
// Design Name: 
// Module Name:    RegFile 
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
module register_file(
    input [2:0] addr1,
    input [2:0] addr2,
    input [2:0] addrw,
    input write,
    input [7:0] data_in,
    output [7:0] out1,
    output [7:0] out2,
    input clk
    );

	reg [7:0] rFile[7:0];
	
	 
	 assign out1 = rFile[addr1];
	 assign out2 = rFile[addr2];
	 
	 always@(posedge clk)
	 begin
		if(write)
			rFile[addr1] = data_in;
		rFile[0] = 13;
	 end

endmodule
