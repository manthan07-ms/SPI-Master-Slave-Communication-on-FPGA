module SPI(clk,key,SW,LEDG,LEDR);
input clk;
input [1:0]key;
input [7:0]SW;
output [7:0]LEDG;
output LEDR;

wire MISO_SDO, MOSI_SDI, sclk,cs;
wire start,rst,done;
assign start = key[0];
assign rst = key[1];
wire [7:0]rec_data;
SPI_prot Master(
clk,rst,start,SW,rec_data,sclk,cs,MISO_SDO,MOSI_SDI,LEDR
);

SPI_slave Slave(
cs,sclk,MOSI_SDI,MISO_SDO,LEDG
);
endmodule
