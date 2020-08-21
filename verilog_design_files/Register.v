`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2020 07:04:07 PM
// Design Name: 
// Module Name: Register
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


module Register(
input clk,
input [15:0]data_in,
input load,
output [15:0]d_out
    );

 reg[15:0]data_out;

assign d_out = data_out;

 always @(posedge clk)
 begin
 
 if(load)
 begin
 data_out <= data_in;
 end

 end   
endmodule
