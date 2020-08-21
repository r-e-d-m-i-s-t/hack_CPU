`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2020 00:27:04
// Design Name: 
// Module Name: ProgrammemoryROM_tb
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


module ProgrammemoryROM_tb;

reg clk;
reg [15:0]Address = 0;
wire [15:0]d_out;

ProgramMemoryROM ROM(
.clk(clk),
.address(Address),
.data_out(d_out)
);


    

initial 
begin
clk = 0;
Address = 16'h0000 ;#15
Address = 16'h0001 ;#15
Address = 16'h0002;#15

#15;

Address = 15'h0003 ;#10;
Address = 15'h0004 ;#20;
Address = 15'h0005;#20;


#10;
Address = 15'h0006;#30;
end

always
begin
clk = ~clk;#5;
end
endmodule
