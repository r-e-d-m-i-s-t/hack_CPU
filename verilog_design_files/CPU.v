`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.08.2020 23:45:33
// Design Name: 
// Module Name: CPU
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


module CPU(
input clk,
input [15:0]instruction,
input reset,

input [15:0]inMem,

output PCload,

output [15:0]PCOut,

output [15:0]DReg,
output [15:0]ALUOP,
output [15:0]AMReg,

output [14:0]AddrOut,
output writeEn,
output [15:0]outMem
    );
    reg PCjump; 
    reg [15:0]ARegin; wire [15:0]ARegout;
    reg [15:0]AMout;
    reg [15:0]ALUin; wire [15:0]ALUop;
    reg [15:0]outMemreg;
    wire [15:0]DRegout; 
    wire zr; wire ng;
    
    assign outMem = outMemreg;
    assign writeEn = instruction[15] & instruction[3];
    assign AddrOut = ARegout[14:0];
 
 
    assign PCload = PCjump & instruction[15];
    
     assign DReg = DRegout;
     assign ALUOP = ALUop;
     assign AMReg = AMout;



    PC hackPC(
    .clk(clk),
    .load(PCjump & instruction[15]),
    .reset(reset),
    //.incr(1'b1),
    .data_in(ARegout),
    .data_out(PCOut)
    );
   
   Register A(
   .clk(clk),
   .data_in(ARegin),
   .load(~(instruction[15])|instruction[5]),
   .d_out(ARegout)
   );
   
   Register D(
   .clk(clk),
   .data_in(ALUop),
   .load(instruction[4]&instruction[15]),
   .d_out(DRegout)
   );
   
    ALU hackalu(
    .x(DRegout),
    .y(AMout),
    .zx(instruction[11]),
    .nx(instruction[10]),
    .zy(instruction[9]),
    .ny(instruction[8]),
    .f(instruction[7]),
    .no(instruction[6]),
    .zr(zr),
    .ng(ng),
    .data_out(ALUop)
    );
    
    always @(*)
    begin
    case(instruction[15])
    1'b0: ARegin = {1'b0,instruction[14:0]};
    1'b1: ARegin = ALUop;
    endcase
    
    case(instruction[12])
    1'b0: AMout = ARegout; 
    1'b1: AMout = inMem;
    endcase
    
    case(instruction[2:0])
    3'd0: PCjump = 0;
    3'd1: PCjump = (~zr)&(~ng);
    3'd2: PCjump = (zr)&(~ng);
    3'd3: PCjump = (~ng);
    3'd4: PCjump = (~zr)&(ng);
    3'd5: PCjump = (~zr);
    3'd6: PCjump = (zr)^(ng);     
    3'd7: PCjump = 1;
    endcase
    
    case(instruction[3])
    1'b0: outMemreg = 16'h0000;
    1'b1: outMemreg = ALUop;
    endcase
    end
    
endmodule


