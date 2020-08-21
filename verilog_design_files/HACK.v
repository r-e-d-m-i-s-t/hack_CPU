`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2020 02:53:05
// Design Name: 
// Module Name: HACK
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


module HACK
(
    input clk,
    input reset,
//    output  [15:0]PC_out,
//    output  [15:0]instr, 
//    output  [15:0]in_mem,
//    output  [15:0]out_mem,
//    output  [14:0]addr,
//    output  wr_en
output PCload,
output [15:0]DReg,
output [15:0]ALUOP,
output [15:0]AMReg,

output [15:0]PCOut,
output [15:0]instruction, 
output [15:0]IN_MEM,
output [15:0]OUT_MEM,
output [14:0]address,
output writeEn
 
);

//wire [15:0]PCOut;
//wire [15:0]instruction; 
//wire [15:0]IN_MEM;
//wire [15:0]OUT_MEM;
//wire [14:0]address;
//wire writeEn;

//assign PCOut = PC_out;
//assign instruction = instr;
//assign IN_MEM = in_mem;
//assign OUT_MEM = out_mem;
//assign address = addr;
//assign writeEn = wr_en;


ProgramMemoryROM ROM(
.clk(clk),
.address(PCOut),
.data_out(instruction)
);
    

CPU hackCPU(
.clk(clk),
.instruction(instruction),
.reset(reset),
.inMem(IN_MEM),
.PCOut(PCOut),
.PCload(PCload),
.DReg(DReg),
.ALUOP(ALUOP),
.AMReg(AMReg),
.AddrOut(address),
.writeEn(writeEn),
.outMem(OUT_MEM)
    );

DatamemoryRAM RAM(
.clk(clk),
.Address(address),
.writeEn(writeEn),
.data_in(OUT_MEM),
.data_out(IN_MEM)
    );


endmodule