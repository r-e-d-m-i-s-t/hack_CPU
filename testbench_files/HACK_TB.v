`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2020 20:37:06
// Design Name: 
// Module Name: HACK_TB
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


module HACK_TB();
reg clk;
reg reset;
wire [15:0]PC_out;
wire [15:0]instr;
wire PCload;
wire [15:0] DReg;
wire [15:0] ALUOP;
wire [15:0] AMReg;
wire [15:0]in_mem;
wire [15:0]out_mem;
wire [14:0]addr;
wire wr_en;

//HACK hack(
//.clk(clk),
//.reset(reset),
//.PC_out(PC_out),
//.instr(instr),
//.in_mem(in_mem),
//.out_mem(out_mem),
//.addr(addr),
//.wr_en(wr_en)
//);

HACK hack(
.clk(clk),
.reset(reset),
.PCOut(PC_out),
.instruction(instr),
.PCload(PCload),
.DReg(DReg),
.ALUOP(ALUOP), 
.AMReg(AMReg),
.IN_MEM(in_mem),
.OUT_MEM(out_mem),
.address(addr),
.writeEn(wr_en)
);

initial
begin
clk = 0;
reset = 1;#2;
reset = 0;
end

always
begin
clk = ~clk;#1;
end



endmodule
