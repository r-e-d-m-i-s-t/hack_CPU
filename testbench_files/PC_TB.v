`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2020 07:43:26 PM
// Design Name: 
// Module Name: PC_TB
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


module PC_TB();
reg clk;
reg load;
reg reset;
reg incr;
reg [15:0]data_in;
wire [15:0]data_out;

PC pctest(
.clk(clk),
.load(load),
.reset(reset),
.incr(incr),
.data_in(data_in),
.data_out(data_out)
);

initial 
begin
clk = 0;load=1;reset=0;incr=1;
data_in = 16'h1;#15;
data_in = 16'hffa0;#15;
data_in = 16'h0122;#15;

load = 0;#15;
data_in = 16'h1;#15;
data_in = 16'hffa0;#15;
data_in = 16'h0122;#15;


reset = 1;load=1;incr=1;
data_in = 0;#10;
data_in = 16'h00a1;#20

load = 1;#10;
data_in = 16'hff09;#30;
end

always
begin
clk = ~clk;#5;
end

endmodule
