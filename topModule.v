`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:26 04/08/2017 
// Design Name: 
// Module Name:    topModule 
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
module topModule(
	 input i_CLK,					//Main CLK of FPGA
    output o_PSCLK,				//CLK of parallel/serial
    output o_LEDData,			//Serial data in of LEDs
    output o_LEDLatch,			//EN of SIPO for LEDs
    output o_DIPLatch,			//EN of SIPO for DIP switches
    input i_DIPData,				//Serial data of DIP switches
    output o_SEGData,			//Serial data of 7-Segment
    output o_SEGLatch,			//EN of SIPO for 7-Segment
    output o_LCDData,
    output o_LCDLatch,
    output o_Eth_RST,
    input i_Eth_INT,
    output o_Eth_CS,
    output o_Eth_RD,
    output o_Eth_WR,
    output o_USB_SLOE,
    inout io_USB_IFCLK,
    output o_USB_SLRD,
    output o_USB_SLWR,
    inout [7:0] io_Data,
    inout [9:0] io_MuxEthUSB,
    output o_VGA_blue0,
    output o_VGA_blue1,
    output o_VGA_green0,
    output o_VGA_green1,
    output o_VGA_red0,
    output o_VGA_red1,
    output o_VGA_vsync,
    output o_VGA_hsync,
    input i_SW1,
    input i_SW2,
    input i_SW3,
    input i_SW4,
    output o_TXD1,
    input i_RXD1,
    output o_TXD2,
    input i_RXD2,
    output o_MMC_SCK,
    input i_MMC_DO,
    output o_MMC_DI,
    output o_MMC_CS,
    input i_SYS_RESET
    );
//assign o_PSCLK = 1'bz;
//assign o_LEDData = 1'bz;
//assign o_LEDLatch = 1'bz;


//assign o_DIPLatch = 1'bz;
//assign o_SEGData = 1'bz;
//assign o_SEGLatch = 1'bz;
assign o_LCDData = 1'bz;
assign o_LCDLatch = 1'bz;

assign o_MMC_SCK	= 1'bz;

assign o_MMC_DI = 1'bz;
assign o_MMC_CS = 1'bz;

assign o_VGA_blue0 = 1'bz;
assign o_VGA_blue1 = 1'bz;
assign o_VGA_green0 = 1'bz;
assign o_VGA_green1 = 1'bz;
assign o_VGA_red0 = 1'bz;
assign o_VGA_red1 = 1'bz;
assign o_VGA_vsync = 1'bz;
assign o_VGA_hsync = 1'bz;

assign o_Eth_RST = 1'bz;

assign o_Eth_CS = 1'bz;
assign o_Eth_RD = 1'bz;
assign o_Eth_WR = 1'bz;
assign o_USB_SLOE = 1'bz;
assign io_USB_IFCLK = 1'bz;
assign o_USB_SLRD = 1'bz;
assign o_USB_SLWR = 1'bz;
assign io_Data = 8'bz;
assign io_MuxEthUSB = 10'bz;

assign o_TXD1 = 1'bz;
assign o_TXD2 = 1'bz;



assign o_SEGData = 1'bz;
assign o_SEGLatch = 1'bz;

assign o_LCDData = 1'bz;
assign o_LCDLatch = 1'bz;
reg [7:0] pc;
wire CLK_OUT5, CLK_OUT20 , CLK_OUT50 , CLK_OUT100;
wire [15:0] LED_In;
wire [20:0] SIPOout;
//assign LED_In = 16'b0101_1110_1000_1010;
assign o_PSCLK = CLK_OUT5;
  clkGen myClkGen
   (// Clock in ports
    .CLK_IN(i_CLK),      // IN
    // Clock out ports
    .CLK_OUT5(CLK_OUT5),     // OUT
    .CLK_OUT20(CLK_OUT20),     // OUT
    .CLK_OUT50(CLK_OUT50),     // OUT
    .CLK_OUT100(CLK_OUT100));
	InstructionMemory instructionMemory (
  .clka(CLK_OUT5), // input clka
  .wea(0), // input [0 : 0] wea
  .addra(pc), // input [7 : 0] addra
  .dina(), // input [15 : 0] dina
  .douta(LED_In) // output [15 : 0] douta
);
	 //assign LED_In[15:11] = SIPOout[20:16];
	 //assign LED_In[10:0] = 0;
	 
	 wire [1:0] pushButt;
	 wire [1:0] debouncer_o;
	 wire [12:0] segIn;
    
	 assign pushButt [1:0] = SIPOout [18:17];
	 SIPO dip_driver(!CLK_OUT5, SIPOout , i_DIPData, o_DIPLatch);

	 PISO led_driver(!CLK_OUT5, LED_In, o_LEDData, o_LEDLatch);
	 Debouncer debouncer(CLK_OUT5, pushButt, debouncer_o);
	 
	 
	 assign segIn[12:8] = 0;
	 assign segIn[7:0] = pc;
	 always @(posedge CLK_OUT5) begin
	 if (debouncer_o[0] == 1) 
		pc = 0 ;
	 if (debouncer_o[1] == 1)
		pc = pc + 1;
	 end
	 SevenSeg_Driver (CLK_OUT5, segIn, o_SEGData, o_SEGLatch);
	 
endmodule

