`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.08.2020 02:52:28
// Design Name: 
// Module Name: datamemoryRAM_tb
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


module datamemoryRAM_tb;
reg clk;
reg [14:0]Address;
reg [15:0]d_in;
reg load;
wire [15:0]d_out;

DatamemoryRAM RAM(
.clk(clk),
.data_in(d_in),
.Address(Address),
.writeEn(load),
.data_out(d_out)
);

initial 
begin
clk = 0;load=1;
Address = 15'h1376 ;d_in = 16'h1111;clk = ~clk;#15;clk=~clk;#15;
Address = 15'h1478 ;d_in = 16'h2240;clk = ~clk;#15;clk=~clk;#15;
Address = 15'h0000;d_in = 16'h3451;clk = ~clk;#15;clk=~clk;#15;

load = 0;#15;

Address = 15'h1376 ;d_in = 16'h0000;#10;
Address = 15'h1478 ;d_in = 16'h00a1;#20;
Address = 15'h0000; d_in = 16'h7fff;#20;


load = 1;#10;
Address = 15'h0000;d_in = 16'hff09;#30;
end

//always
//begin
//clk = ~clk;#5;
//end
endmodule

