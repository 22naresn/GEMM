// fmm_core.v — No-DSP version
// GoWin's MULTADDALU18X18 DSP was being inferred for the MAC operation.
// With CREG=1, the DSP's C register accumulates garbage during the 10-second
// loading phase (CE=1 when start=0), corrupting results.
//
// Fix: split multiply and add into separate cycles so GoWin cannot infer a MAC DSP.
//   Cycle 0 (phase=0): issue BRAM read address
//   Cycle 1 (phase=1): BRAM output valid → register the product
//   Cycle 2 (phase=2): add registered product to accumulator
// The 3-cycle pipeline makes it impossible for GoWin to infer a single-cycle MAC.

module fmm_core
(
    input clk,
    input rst,
    input start,

    // Loader write ports
    input              loader_weA,
    input  [7:0]       loader_addrA,
    input  signed [15:0] loader_dinA,

    input              loader_weB,
    input  [7:0]       loader_addrB,
    input  signed [15:0] loader_dinB,

    // Result write port
    output reg [7:0]         addrC,
    output reg signed [31:0] dataC,
    output reg               weC,

    output reg done
);

// Loop indices
reg [3:0] i, j, k;
reg [1:0] phase;   // 0=issue addr, 1=read data, 2=accumulate

// Combinational read addresses
wire [7:0] rdAddrA = {i, k};
wire [7:0] rdAddrB = {k, j};

// Internal memories
wire signed [15:0] doutA;
wire signed [15:0] doutB;

matrix_mem #(.WIDTH(16), .ADDR_W(8)) memA_i (
    .clk(clk),
    .we(loader_weA),
    .addr(loader_weA ? loader_addrA : rdAddrA),
    .din(loader_dinA),
    .dout(doutA));

matrix_mem #(.WIDTH(16), .ADDR_W(8)) memB_i (
    .clk(clk),
    .we(loader_weB),
    .addr(loader_weB ? loader_addrB : rdAddrB),
    .din(loader_dinB),
    .dout(doutB));

// Registered product — separate from accumulator
// Splitting multiply and add into different cycles prevents DSP inference
reg signed [31:0] product_reg;

// Accumulator
reg signed [31:0] acc;

always @(posedge clk) begin
    if (rst) begin
        i <= 0; j <= 0; k <= 0;
        addrC <= 0; dataC <= 0;
        acc <= 0; weC <= 0; done <= 0;
        phase <= 0;
        product_reg <= 0;
    end
    else begin
        weC <= 0;

        if (done) begin
            // stay done
        end
        else if (!start) begin
            i <= 0; j <= 0; k <= 0;
            acc <= 0; phase <= 0;
            product_reg <= 0;
        end
        else begin
            case (phase)

            2'd0: begin
                // Issue BRAM read address (combinational rdAddrA/rdAddrB)
                // BRAM samples addr at this clock edge → dout valid next cycle
                phase <= 1;
            end

            2'd1: begin
                // BRAM output (doutA, doutB) valid this cycle
                // Register the product — separate cycle from accumulation
                // This prevents GoWin from inferring a MAC (multiply+accumulate in 1 cycle)
                product_reg <= $signed(doutA) * $signed(doutB);
                phase <= 2;
            end

            2'd2: begin
                // Add registered product to accumulator
                // This is a plain ADD — no multiply here — cannot be a DSP MAC
                acc <= acc + product_reg;

                if (k == 4'd15) begin
                    addrC <= {i, j};
                    dataC <= acc + product_reg;
                    weC   <= 1;
                    acc   <= 0;
                    k     <= 0;
                    phase <= 0;

                    if (j == 4'd15) begin
                        j <= 0;
                        if (i == 4'd15)
                            done <= 1;
                        else
                            i <= i + 1;
                    end
                    else
                        j <= j + 1;
                end
                else begin
                    k     <= k + 1;
                    phase <= 0;
                end
            end

            default: phase <= 0;
            endcase
        end
    end
end

endmodule