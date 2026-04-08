module uart_rx
#(
    parameter CLK_FREQ = 27000000,
    parameter BAUD = 115200
)
(
    input clk,
    input rst,
    input rx,
    output reg [7:0] data,
    output reg valid
);

localparam integer CLKS_PER_BIT = CLK_FREQ / BAUD;

reg [15:0] clk_cnt = 0;   // enough for CLK_FREQ/BAUD < 2^16
reg [4:0]  bit_idx = 0;   // needs to index up to 9 -> 4 bits could suffice, 5 is safe
reg [9:0]  shift = 0;
reg        busy = 0;

always @(posedge clk) begin
    if (rst) begin
        busy <= 0;
        valid <= 0;
    end
    else begin
        valid <= 0;

        if (!busy && !rx) begin
            busy <= 1;
            clk_cnt <= CLKS_PER_BIT/2;
            bit_idx <= 0;
        end
        else if (busy) begin
            if (clk_cnt == CLKS_PER_BIT-1) begin
                clk_cnt <= 0;
                shift[bit_idx] <= rx;
                bit_idx <= bit_idx + 1;

                if (bit_idx == 9) begin
                    busy <= 0;
                    data <= shift[8:1];
                    valid <= 1;
                end
            end
            else
                clk_cnt <= clk_cnt + 1;
        end
    end
end

endmodule