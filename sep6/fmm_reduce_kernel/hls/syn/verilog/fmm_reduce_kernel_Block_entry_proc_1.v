`timescale 1 ns / 1 ps 

module fmm_reduce_kernel_Block_entry_proc_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        cols,
        rows,
        debug_capacity,
        rows_c_din,
        rows_c_full_n,
        rows_c_write,
        rows_c_num_data_valid,
        rows_c_fifo_cap,
        cols_c_din,
        cols_c_full_n,
        cols_c_write,
        cols_c_num_data_valid,
        cols_c_fifo_cap,
        debug_capacity_c_din,
        debug_capacity_c_full_n,
        debug_capacity_c_write,
        debug_capacity_c_num_data_valid,
        debug_capacity_c_fifo_cap,
        ap_return_0,
        ap_return_1
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] cols;
input  [31:0] rows;
input  [31:0] debug_capacity;
output  [31:0] rows_c_din;
input   rows_c_full_n;
output   rows_c_write;
input  [2:0] rows_c_num_data_valid;
input  [2:0] rows_c_fifo_cap;
output  [31:0] cols_c_din;
input   cols_c_full_n;
output   cols_c_write;
input  [2:0] cols_c_num_data_valid;
input  [2:0] cols_c_fifo_cap;
output  [31:0] debug_capacity_c_din;
input   debug_capacity_c_full_n;
output   debug_capacity_c_write;
input  [2:0] debug_capacity_c_num_data_valid;
input  [2:0] debug_capacity_c_fifo_cap;
output  [0:0] ap_return_0;
output  [0:0] ap_return_1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rows_c_write;
reg cols_c_write;
reg debug_capacity_c_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    rows_c_blk_n;
reg    cols_c_blk_n;
reg    debug_capacity_c_blk_n;
wire   [63:0] mul_ln304_fu_88_p2;
reg   [63:0] mul_ln304_reg_155;
reg    ap_block_state1;
wire   [0:0] and_ln306_fu_122_p2;
reg   [0:0] and_ln306_reg_161;
wire  signed [31:0] sext_ln304_fu_92_p0;
wire  signed [31:0] sext_ln304_1_fu_97_p0;
wire   [0:0] tmp_fu_102_p3;
wire   [0:0] icmp_ln306_fu_116_p2;
wire   [0:0] xor_ln306_fu_110_p2;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln305_fu_128_p2;
wire   [0:0] icmp_ln305_1_fu_133_p2;
wire   [0:0] and_ln305_fu_138_p2;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 2'd1;
end

fmm_reduce_kernel_mul_32s_32s_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
mul_32s_32s_64_1_1_U11(
    .din0(sext_ln304_1_fu_97_p0),
    .din1(sext_ln304_fu_92_p0),
    .dout(mul_ln304_fu_88_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state1) & (1'b1 == ap_CS_fsm_state1))) begin
        and_ln306_reg_161 <= and_ln306_fu_122_p2;
        mul_ln304_reg_155 <= mul_ln304_fu_88_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_block_state1)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_c_blk_n = cols_c_full_n;
    end else begin
        cols_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state1) & (1'b1 == ap_CS_fsm_state1))) begin
        cols_c_write = 1'b1;
    end else begin
        cols_c_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        debug_capacity_c_blk_n = debug_capacity_c_full_n;
    end else begin
        debug_capacity_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state1) & (1'b1 == ap_CS_fsm_state1))) begin
        debug_capacity_c_write = 1'b1;
    end else begin
        debug_capacity_c_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        rows_c_blk_n = rows_c_full_n;
    end else begin
        rows_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state1) & (1'b1 == ap_CS_fsm_state1))) begin
        rows_c_write = 1'b1;
    end else begin
        rows_c_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b0 == ap_block_state1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign and_ln305_fu_138_p2 = (icmp_ln305_fu_128_p2 & icmp_ln305_1_fu_133_p2);

assign and_ln306_fu_122_p2 = (xor_ln306_fu_110_p2 & icmp_ln306_fu_116_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (debug_capacity_c_full_n == 1'b0) | (cols_c_full_n == 1'b0) | (rows_c_full_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_return_0 = and_ln305_fu_138_p2;

assign ap_return_1 = and_ln306_reg_161;

assign cols_c_din = cols;

assign debug_capacity_c_din = debug_capacity;

assign icmp_ln305_1_fu_133_p2 = (($signed(mul_ln304_reg_155) < $signed(64'd65537)) ? 1'b1 : 1'b0);

assign icmp_ln305_fu_128_p2 = (($signed(mul_ln304_reg_155) > $signed(64'd0)) ? 1'b1 : 1'b0);

assign icmp_ln306_fu_116_p2 = (($signed(debug_capacity) < $signed(32'd4097)) ? 1'b1 : 1'b0);

assign rows_c_din = rows;

assign sext_ln304_1_fu_97_p0 = rows;

assign sext_ln304_fu_92_p0 = cols;

assign tmp_fu_102_p3 = debug_capacity[32'd31];

assign xor_ln306_fu_110_p2 = (tmp_fu_102_p3 ^ 1'd1);

endmodule //fmm_reduce_kernel_Block_entry_proc_1
