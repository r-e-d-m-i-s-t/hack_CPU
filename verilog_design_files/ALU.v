`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2020 07:50:44 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
input [15:0]x,
input [15:0]y,
input zx,
input nx,
input zy,
input ny,
input f,
input no,

//output reg x_out,
//output reg y_out,
output reg[15:0]data_out,
output reg zr,
output reg ng
    );
    reg [15:0]xo;
    reg[15:0]yo;
    
    
    always @(*)
    begin
    case({nx,zx})
    2'b00: xo = x;
    2'b01: xo = 16'h0000;
    2'b10: xo = ~x;
    2'b11: xo = 16'hffff;
    endcase
    
    case({ny,zy})
    2'b00: yo = y;
    2'b01: yo = 16'h0000;
    2'b10: yo = ~y;
    2'b11: yo = 16'hffff;
    endcase
    
    case({no,f})
    2'b00: data_out = xo & yo;
    2'b01: data_out = xo + yo;
    2'b10: data_out = ~(xo & yo);
    2'b11: data_out = ~(xo + yo);
    endcase
    //x_out = xo;
    //y_out = yo;
    zr = ~(|(data_out));
    ng = data_out[15];
    end
endmodule
