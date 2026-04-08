// top.v — fmm16_v3 — Tang Nano 9K
// memA and memB moved inside fmm_core to fix GoWin address pruning bug.
// top.v now only contains memC (result memory) and the TX streamer.

module top
(
    input  clk,
    input  rst,
    input  uart_rx,
    output uart_tx,
    output led_0,
    output led_1,
    output led_2
);

wire rst_i = ~rst;

// Blink
reg [24:0] blink_cnt;
always @(posedge clk) begin
    if (rst_i) blink_cnt <= 0;
    else       blink_cnt <= blink_cnt + 1;
end
wire blink = blink_cnt[23];

// UART RX
wire [7:0] rx_data;
wire       rx_valid;
uart_rx rx_unit(
    .clk(clk), .rst(rst_i),
    .rx(uart_rx), .data(rx_data), .valid(rx_valid));

// Loader
localparam ADDR_W = 8;
wire [ADDR_W-1:0]  loader_addr;
wire signed [15:0] loader_data;
wire               loader_weA, loader_weB, load_done;

matrix_loader loader(
    .clk(clk), .rst(rst_i),
    .rx_data(rx_data), .rx_valid(rx_valid),
    .addr(loader_addr), .data(loader_data),
    .weA(loader_weA), .weB(loader_weB),
    .done(load_done));

// Controller FSM
wire start_compute, compute_done;
controller_fsm ctrl(
    .clk(clk), .rst(rst_i),
    .load_done(load_done), .compute_done(compute_done),
    .start_compute(start_compute));

// fmm_core — contains memA and memB internally
// memC result is written out via addrC/dataC/weC
wire [ADDR_W-1:0]   addrC;
wire signed [31:0]  dataC;
wire                weC;
wire signed [31:0]  memC_out;
reg  [ADDR_W-1:0]   tx_rd_addr;

fmm_core core(
    .clk(clk), .rst(rst_i), .start(start_compute),
    // Loader write ports
    .loader_weA(loader_weA), .loader_addrA(loader_addr), .loader_dinA(loader_data),
    .loader_weB(loader_weB), .loader_addrB(loader_addr), .loader_dinB(loader_data),
    // Result output
    .addrC(addrC), .dataC(dataC), .weC(weC),
    .done(compute_done));

// memC — result matrix (stays in top.v)
matrix_mem #(.WIDTH(32), .ADDR_W(ADDR_W)) memC(
    .clk(clk), .we(weC),
    .addr(weC ? addrC : tx_rd_addr),
    .din(dataC), .dout(memC_out));

// Latch compute_done
reg compute_done_latch;
always @(posedge clk) begin
    if (rst_i)             compute_done_latch <= 0;
    else if (compute_done) compute_done_latch <= 1;
end

// TX Streaming FSM
localparam TX_IDLE=3'd0, TX_ADDR=3'd1, TX_WAIT1=3'd2,
           TX_WAIT2=3'd3, TX_BYTE=3'd4, TX_WAIT_TX=3'd5, TX_DONE=3'd6;
reg [2:0] tx_state;
reg [7:0] tx_elem;
reg [1:0] tx_byte_idx;
reg [31:0] tx_word;
reg tx_start;
reg [7:0] tx_data;
wire tx_busy;

always @(posedge clk) begin
    if (rst_i) begin
        tx_state<=TX_IDLE; tx_elem<=0; tx_byte_idx<=0;
        tx_word<=0; tx_start<=0; tx_data<=0; tx_rd_addr<=0;
    end
    else begin
        tx_start <= 0;
        case (tx_state)
        TX_IDLE: begin
            tx_elem<=0; tx_byte_idx<=0;
            if (compute_done_latch) tx_state<=TX_ADDR;
        end
        TX_ADDR: begin tx_rd_addr<=tx_elem; tx_state<=TX_WAIT1; end
        TX_WAIT1: tx_state<=TX_WAIT2;
        TX_WAIT2: begin tx_word<=memC_out; tx_state<=TX_BYTE; end
        TX_BYTE: if (!tx_busy) begin
            case (tx_byte_idx)
                2'd0: tx_data<=tx_word[7:0];
                2'd1: tx_data<=tx_word[15:8];
                2'd2: tx_data<=tx_word[23:16];
                2'd3: tx_data<=tx_word[31:24];
            endcase
            tx_start<=1; tx_state<=TX_WAIT_TX;
        end
        TX_WAIT_TX: if (!tx_start && !tx_busy) begin
            if (tx_byte_idx==2'd3) begin
                tx_byte_idx<=0;
                if (tx_elem==8'd255) tx_state<=TX_DONE;
                else begin tx_elem<=tx_elem+1; tx_state<=TX_ADDR; end
            end
            else begin tx_byte_idx<=tx_byte_idx+1; tx_state<=TX_BYTE; end
        end
        TX_DONE: tx_state<=TX_DONE;
        default: tx_state<=TX_IDLE;
        endcase
    end
end

// UART TX
uart_tx tx_unit(
    .clk(clk), .rst(rst_i),
    .data(tx_data), .start(tx_start),
    .tx(uart_tx), .busy(tx_busy));

// LEDs (active LOW)
assign led_0 = ~blink;
assign led_1 = ~load_done;
assign led_2 = ~compute_done_latch;

endmodule