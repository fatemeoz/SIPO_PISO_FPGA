`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:22 04/15/2017 
// Design Name: 
// Module Name:    LED_Driver 
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
module LED_Driver(
	input [15:0] data,
	input clk,
	output out,
	output latch
	);
	PISO piso(!clk,data,out,latch);
    


endmodule
