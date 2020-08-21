`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.08.2020 02:18:36
// Design Name: 
// Module Name: DatamemoryRAM
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


module DatamemoryRAM(
input clk,
input [14:0]Address,
input writeEn,
input [15:0]data_in,
output [15:0]data_out
    );
    //reg [16384:0]load;
    
//    Register RAM[16384:0](
//    .clk(clk),
//    .data_in(data_in),
//    .load(load),
//    .data_out(data_out)
//    );
    
//    always@(*)
//    begin
//    case(Address)
    reg [15:0]data_mem [16383:0];
    
    assign data_out = data_mem[Address];
    
    always @(posedge clk)
    begin
    
    if(writeEn)
    begin
    data_mem[Address]  <= data_in;
    end
    
    end
    
endmodule
