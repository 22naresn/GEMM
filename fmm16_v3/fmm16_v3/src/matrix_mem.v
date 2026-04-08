// matrix_mem.v
module matrix_mem
#(
    parameter WIDTH  = 16,
    parameter ADDR_W = 8    // 2^8 = 256 depth
)
(
    input                      clk,
    input                      we,
    input  [ADDR_W-1:0]        addr,
    input  signed [WIDTH-1:0]  din,
    output reg signed [WIDTH-1:0] dout
);

localparam DEPTH = (1 << ADDR_W);
reg signed [WIDTH-1:0] mem [0:DEPTH-1];

always @(posedge clk) begin
    if (we)
        mem[addr] <= din;

    dout <= mem[addr];
end

endmodule