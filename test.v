`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2023 15:44:34
// Design Name: 
// Module Name: test
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


module test(

    );
    
reg clk;
reg reset;
reg start;
reg [128:1]din;
reg [7:0]key;

wire key_found;
wire signal_out;
wire error;
wire [128:1]data;

top_module dut(.clk(clk),.reset(reset),.start(start),.din(din),
                .key(key),.key_found(key_found),.signal_out(signal_out),
                .error_sig(error),.data(data));

initial begin
clk =1'b0;
reset = 1'b1;
start = 1'b0;
#100;

reset = 1'b0;
start = 1'b1;
din = 128'hffffffffffffffffffffffffffffffff;
//din = 128'h1111123654654621333333233aa11111;
#10;
key = 8'h55;
#10;
start = 1'b0;
end


always #10 clk = ~ clk;


endmodule
