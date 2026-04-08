module uart_tx
#(
    parameter CLK_FREQ = 27000000,
    parameter BAUD = 115200
)
(
    input clk,
    input rst,
    input [7:0] data,
    input start,
    output reg tx,
    output reg busy
);

localparam CLKS_PER_BIT = CLK_FREQ / BAUD;

reg [15:0] clk_cnt = 0;
reg [3:0] bit_idx = 0;
reg [9:0] shift;

always @(posedge clk) begin
    if (rst) begin
        tx <= 1;
        busy <= 0;
    end
    else begin
        if (start && !busy) begin
            busy <= 1;
            shift <= {1'b1, data, 1'b0};
            bit_idx <= 0;
            clk_cnt <= 0;
        end

        if (busy) begin
            if (clk_cnt == CLKS_PER_BIT-1) begin
                clk_cnt <= 0;
                tx <= shift[bit_idx];
                bit_idx <= bit_idx + 1;

                if (bit_idx == 9)
                    busy <= 0;
            end
            else
                clk_cnt <= clk_cnt + 1;
        end
    end
end

endmodule