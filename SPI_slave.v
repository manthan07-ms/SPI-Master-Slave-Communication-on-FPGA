module SPI_slave (
    input  cs,
    input  sclk,
    input  sdi,
    output reg sdo,
    output reg [7:0] rec_data
);

reg [7:0] shft_reg;
reg [2:0] bit_count;

always @(posedge sclk or posedge cs) begin
    if (cs) begin
        bit_count <= 0;
        shft_reg  <= 8'hA5;
    end else begin
        shft_reg  <= {shft_reg[6:0], sdi};

        if (bit_count == 7)
            rec_data <= {shft_reg[6:0], sdi};

        bit_count <= bit_count + 1;
    end
end

always @(negedge sclk or posedge cs) begin
    if (cs)
        sdo <= 0;
    else
        sdo <= shft_reg[7];
end

endmodule
