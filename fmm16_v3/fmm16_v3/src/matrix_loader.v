// matrix_loader.v — Binary protocol version
// Receives exactly 1024 bytes over UART:
//   Bytes 0-511:   Matrix A — 256 x 16-bit little-endian signed integers
//   Bytes 512-1023: Matrix B — 256 x 16-bit little-endian signed integers
//
// Each 16-bit value arrives low byte first (little-endian):
//   byte N*2+0 = value[7:0]
//   byte N*2+1 = value[15:8]
//
// done asserts when all 1024 bytes received.

module matrix_loader
(
    input  clk,
    input  rst,

    input  [7:0] rx_data,
    input        rx_valid,

    output reg [7:0]       addr,
    output reg signed [15:0] data,
    output reg weA,
    output reg weB,
    output reg done
);

reg [9:0]  byte_count;   // 0..1023
reg [7:0]  lo_byte;      // holds low byte while waiting for high byte

always @(posedge clk) begin
    if (rst) begin
        byte_count <= 0;
        lo_byte    <= 0;
        addr       <= 0;
        data       <= 0;
        weA        <= 0;
        weB        <= 0;
        done       <= 0;
    end
    else begin
        weA <= 0;
        weB <= 0;

        if (rx_valid && !done) begin
            if (byte_count[0] == 0) begin
                // Even byte: low byte of value — just store it
                lo_byte    <= rx_data;
                byte_count <= byte_count + 1;
            end
            else begin
                // Odd byte: high byte of value — commit the word
                data <= {rx_data, lo_byte};   // little-endian: hi=rx_data, lo=lo_byte
                addr <= byte_count[8:1];      // byte_count/2 = element index (0..511 → 0..255 per matrix)

                if (byte_count < 512)
                    weA <= 1;   // first 512 bytes (256 values) → matrix A
                else
                    weB <= 1;   // next  512 bytes (256 values) → matrix B

                byte_count <= byte_count + 1;

                if (byte_count == 1023)
                    done <= 1;
            end
        end
    end
end

endmodule