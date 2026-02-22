`timescale 1 ns / 1 ps 

module fmm_reduce_kernel_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_157_17 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        rowt_1,
        idxprom4_i12_i_i_i,
        M_e_address0,
        M_e_ce0,
        M_e_q0,
        row1_3_ce_out,
        row1_3_ce_out_ap_vld
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] rowt_1;
input  [16:0] idxprom4_i12_i_i_i;
output  [16:0] M_e_address0;
output   M_e_ce0;
input  [31:0] M_e_q0;
output  [31:0] row1_3_ce_out;
output   row1_3_ce_out_ap_vld;

reg ap_idle;
reg row1_3_ce_out_ap_vld;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln160_fu_159_p2;
reg   [0:0] icmp_ln157_reg_181;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [31:0] row1_3_ce_reg_78;
wire   [31:0] zext_ln157_fu_98_p1;
reg   [31:0] zext_ln157_reg_176;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] icmp_ln157_fu_102_p2;
wire   [30:0] add_ln157_fu_108_p2;
reg   [30:0] add_ln157_reg_185;
wire   [63:0] zext_ln159_fu_154_p1;
reg   [30:0] row1_fu_42;
wire    ap_loop_init;
reg   [30:0] ap_sig_allocacmp_row1_2;
reg    M_e_ce0_local;
wire   [26:0] trunc_ln159_fu_114_p1;
wire   [28:0] trunc_ln159_1_fu_126_p1;
wire   [34:0] p_shl_fu_118_p3;
wire   [34:0] p_shl8_fu_130_p3;
wire   [34:0] add_ln159_fu_138_p2;
wire   [16:0] trunc_ln159_2_fu_144_p1;
wire   [16:0] add_ln159_1_fu_148_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 row1_fu_42 = 31'd0;
#0 ap_done_reg = 1'b0;
end

fmm_reduce_kernel_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready_sig),
    .ap_done(ap_done_sig),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
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
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln157_fu_102_p2 == 1'd0) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        row1_3_ce_reg_78 <= 32'd4294967295;
    end else if (((icmp_ln157_reg_181 == 1'd1) & (icmp_ln160_fu_159_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        row1_3_ce_reg_78 <= zext_ln157_reg_176;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        row1_fu_42 <= 31'd0;
    end else if (((icmp_ln157_reg_181 == 1'd1) & (icmp_ln160_fu_159_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        row1_fu_42 <= add_ln157_reg_185;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        add_ln157_reg_185 <= add_ln157_fu_108_p2;
        icmp_ln157_reg_181 <= icmp_ln157_fu_102_p2;
        zext_ln157_reg_176[30 : 0] <= zext_ln157_fu_98_p1[30 : 0];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
        M_e_ce0_local = 1'b1;
    end else begin
        M_e_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_block_state1_pp0_stage0_iter0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & ((icmp_ln157_reg_181 == 1'd0) | (icmp_ln160_fu_159_p2 == 1'd1)))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_row1_2 = 31'd0;
    end else begin
        ap_sig_allocacmp_row1_2 = row1_fu_42;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state2) & ((icmp_ln157_reg_181 == 1'd0) | (icmp_ln160_fu_159_p2 == 1'd1)))) begin
        row1_3_ce_out_ap_vld = 1'b1;
    end else begin
        row1_3_ce_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b0 == ap_block_state1_pp0_stage0_iter0) & (1'b1 == ap_CS_fsm_state1))) begin
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

assign M_e_address0 = zext_ln159_fu_154_p1;

assign M_e_ce0 = M_e_ce0_local;

assign add_ln157_fu_108_p2 = (ap_sig_allocacmp_row1_2 + 31'd1);

assign add_ln159_1_fu_148_p2 = (trunc_ln159_2_fu_144_p1 + idxprom4_i12_i_i_i);

assign add_ln159_fu_138_p2 = (p_shl_fu_118_p3 + p_shl8_fu_130_p3);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_done = ap_done_sig;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign ap_ready = ap_ready_sig;

assign icmp_ln157_fu_102_p2 = (($signed(zext_ln157_fu_98_p1) < $signed(rowt_1)) ? 1'b1 : 1'b0);

assign icmp_ln160_fu_159_p2 = ((M_e_q0 == 32'd1) ? 1'b1 : 1'b0);

assign p_shl8_fu_130_p3 = {{trunc_ln159_1_fu_126_p1}, {6'd0}};

assign p_shl_fu_118_p3 = {{trunc_ln159_fu_114_p1}, {8'd0}};

assign row1_3_ce_out = row1_3_ce_reg_78;

assign trunc_ln159_1_fu_126_p1 = ap_sig_allocacmp_row1_2[28:0];

assign trunc_ln159_2_fu_144_p1 = add_ln159_fu_138_p2[16:0];

assign trunc_ln159_fu_114_p1 = ap_sig_allocacmp_row1_2[26:0];

assign zext_ln157_fu_98_p1 = ap_sig_allocacmp_row1_2;

assign zext_ln159_fu_154_p1 = add_ln159_1_fu_148_p2;

always @ (posedge ap_clk) begin
    zext_ln157_reg_176[31] <= 1'b0;
end

endmodule //fmm_reduce_kernel_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_157_17
