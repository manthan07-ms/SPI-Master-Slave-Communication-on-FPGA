module SPI_prot(clk,rst,start,data_in,data_out,sclk,cs,MISO,MOSI,done);
input clk,rst,start,MISO;
input [7:0]data_in;
output reg sclk,cs,MOSI,done;
output reg [7:0]data_out;

reg [7:0]shft_reg;
reg [7:0]clk_count=0;
reg [2:0]bit_count=0;
reg [1:0]State; 

parameter Idle = 2'b00, Running = 2'b01, Done = 2'b10;

always @(posedge clk or negedge rst) begin
if(!rst) begin
State <= Idle;
sclk <= 0;
cs <= 1;
MOSI <= 0;
shft_reg <= 0;
clk_count <= 0;
bit_count <= 0;
data_out <= 0;
done <= 0;
end
else begin
case(State) 

Idle: begin
cs <= 1;
sclk <= 0;
if(!start) begin
State <= Running;
shft_reg <= data_in;
cs <= 0;
bit_count <= 0;
clk_count <= 0;
MOSI <= data_in[7];
done <= 0;
end
end

Running: begin
clk_count <= clk_count + 1;
if(clk_count == 0) begin
sclk <= 0;
MOSI <= shft_reg[7];
end

else if(clk_count == 25) begin
sclk <= 1;
shft_reg <= {shft_reg[6:0],MISO};
end

else if(clk_count == 50) begin
clk_count <= 0;
bit_count <= bit_count + 1;
if(bit_count == 7) begin
State <= Done;
sclk <= 0;
end
end
end

Done: begin
data_out <= shft_reg;
done <= 1;
State <= Idle;
end


endcase
end
end
endmodule