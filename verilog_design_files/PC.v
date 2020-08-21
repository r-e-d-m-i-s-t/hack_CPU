`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2020 07:36:59 PM
// Design Name: 
// Module Name: PC
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


module PC(
input clk,
input load,
input reset,
//input incr,
input [15:0]data_in,
output reg [15:0]data_out 
    );

//    initial
//    begin
//    data_out <= 16'h0000;
//    end  
      
    always @(posedge clk)
    begin
    if(reset)
    begin
    data_out <= 16'h0000;
    end
    
    else if(load)
    begin
    data_out <= data_in;
    end
    
    else 
    begin
    data_out <= data_out + 16'h0001;
    end
    end
endmodule
