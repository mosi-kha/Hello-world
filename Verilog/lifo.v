`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:58:04 05/20/2018 
// Design Name: 
// Module Name:    lifo 
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
module lifo(Clk, Reset, DataIn, W, FULL, DataOut, R, Empty, Count);

input 			Clk;
input 			Reset;
input [7:0] 	DataIn;
input 			W;

output 			FULL;
output reg	[7:0]	DataOut;
input				R;
output			Empty;
output [10:0]	Count;

reg 	[7:0]		mem [7:0];
reg 	[10:0]	Count;


always @ (posedge Clk)
	if(Reset)
		Count <= 0;
	else if(W && (!FULL) && R && (!Empty))
		Count <= 0;
	else if(W && (!FULL))
		begin
		mem[Count] <= DataIn;
		Count<=Count+1;
		end
	else if(R && (!Empty))
		begin
		DataOut <= mem[Count];
		Count<=Count-1;
		end
	else  
		Count <= Count;

assign FULL = (Count==8);
assign Empty = (Count ==0);
endmodule
