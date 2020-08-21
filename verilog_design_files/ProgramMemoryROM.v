`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2020 00:01:57
// Design Name: 
// Module Name: ProgramMemoryROM
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


module ProgramMemoryROM(
input clk,
input [15:0]address,
output reg [15:0]data_out
    );
    

    
    reg [15:0] rom [8191:0];

    initial $readmemb("Mult.mem",rom );
    
//assign data_out = rom[address];
    always @(posedge clk)
    begin
    
    data_out <= rom[address];
    
    end
endmodule
