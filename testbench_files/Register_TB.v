`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2020 07:07:52 PM
// Design Name: 
// Module Name: Register_TB
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

module Register_TB();
reg clk;
reg [15:0]d_in;
reg load;
wire [15:0]d_out;

Register DFF(
.clk(clk),
.data_in(d_in),
.load(load),
.data_out(d_out)
);
initial 
begin
clk = 0;load=1;
d_in = 1;#15;
d_in = 0;#15;
d_in = 1;#15;

load = 0;#15;

d_in = 0;#10;
d_in = 16'h00a1;#20

load = 1;#10;
d_in = 16'hff09;#30;
end

always
begin
clk = ~clk;#5;
end
endmodule
