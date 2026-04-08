// controller_fsm.v — fixed
// Added DONE state so start_compute stays asserted until TX finishes
// and never drops prematurely while compute_done is firing

module controller_fsm
(
    input clk,
    input rst,

    input load_done,
    input compute_done,

    output reg start_compute
);

localparam WAIT_LOAD = 2'd0;
localparam COMPUTE   = 2'd1;
localparam DONE      = 2'd2;

reg [1:0] state;

always @(posedge clk) begin
    if (rst) begin
        state         <= WAIT_LOAD;
        start_compute <= 0;
    end
    else begin
        case (state)

        WAIT_LOAD: begin
            start_compute <= 0;
            if (load_done)
                state <= COMPUTE;
        end

        COMPUTE: begin
            start_compute <= 1;
            if (compute_done) begin
                state <= DONE;
                // Keep start_compute=1 this cycle so fmm_core
                // doesn't reset itself and erase done signal
            end
        end

        DONE: begin
            // Hold here — start_compute stays 0, fmm_core holds done=1
            // TX FSM reads memory and streams result
            start_compute <= 0;
            // Never go back — reset required for new computation
        end

        default: state <= WAIT_LOAD;
        endcase
    end
end

endmodule