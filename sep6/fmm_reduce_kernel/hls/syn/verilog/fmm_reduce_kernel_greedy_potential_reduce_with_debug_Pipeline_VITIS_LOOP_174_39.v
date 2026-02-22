`timescale 1 ns / 1 ps 

module fmm_reduce_kernel_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_174_39 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        move_type_5,
        colt_1,
        mul_ln176_1,
        M_e_address0,
        M_e_ce0,
        M_e_we0,
        M_e_d0,
        M_e_address1,
        M_e_ce1,
        M_e_we1,
        M_e_d1,
        M_e_q1,
        mul_ln172_1,
        mul_ln173_1
);

parameter    ap_ST_fsm_pp0_stage0 = 2'd1;
parameter    ap_ST_fsm_pp0_stage1 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [1:0] move_type_5;
input  [31:0] colt_1;
input  [16:0] mul_ln176_1;
output  [16:0] M_e_address0;
output   M_e_ce0;
output   M_e_we0;
output  [31:0] M_e_d0;
output  [16:0] M_e_address1;
output   M_e_ce1;
output   M_e_we1;
output  [31:0] M_e_d1;
input  [31:0] M_e_q1;
input  [16:0] mul_ln172_1;
input  [16:0] mul_ln173_1;

reg ap_idle;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
wire    ap_block_pp0_stage1_subdone;
reg    ap_enable_reg_pp0_iter0_reg;
reg   [0:0] icmp_ln174_reg_212;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] cmp80_i_i_i_i_fu_105_p2;
reg   [0:0] cmp80_i_i_i_i_reg_207;
wire   [0:0] icmp_ln174_fu_123_p2;
wire   [16:0] trunc_ln176_fu_135_p1;
reg   [16:0] trunc_ln176_reg_216;
reg   [16:0] M_e_addr_reg_222;
reg   [31:0] v_reg_227;
wire    ap_block_pp0_stage1_11001;
wire   [0:0] icmp_ln177_fu_155_p2;
reg   [0:0] icmp_ln177_reg_234;
reg   [16:0] M_e_addr_4_reg_238;
wire   [31:0] v2_1_fu_184_p3;
reg   [31:0] v2_1_reg_243;
wire   [63:0] zext_ln176_fu_145_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln179_fu_165_p1;
wire   [63:0] zext_ln181_fu_174_p1;
reg   [30:0] c_fu_38;
wire   [30:0] add_ln174_fu_129_p2;
wire    ap_loop_init;
reg   [30:0] ap_sig_allocacmp_c_4;
reg    M_e_ce1_local;
reg   [16:0] M_e_address1_local;
reg    M_e_we1_local;
wire    ap_block_pp0_stage1;
reg    M_e_we0_local;
reg   [31:0] M_e_d0_local;
reg    M_e_ce0_local;
reg   [16:0] M_e_address0_local;
wire   [31:0] zext_ln174_fu_119_p1;
wire   [16:0] add_ln176_fu_139_p2;
wire   [16:0] add_ln179_fu_161_p2;
wire   [16:0] add_ln181_fu_170_p2;
wire   [31:0] v2_fu_179_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [1:0] ap_NS_fsm;
wire    ap_block_pp0_stage0_subdone;
reg    ap_idle_pp0_1to1;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 c_fu_38 = 31'd0;
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
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage1)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln174_fu_123_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            c_fu_38 <= add_ln174_fu_129_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            c_fu_38 <= 31'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        M_e_addr_4_reg_238 <= zext_ln181_fu_174_p1;
        M_e_addr_reg_222 <= zext_ln176_fu_145_p1;
        cmp80_i_i_i_i_reg_207 <= cmp80_i_i_i_i_fu_105_p2;
        icmp_ln174_reg_212 <= icmp_ln174_fu_123_p2;
        trunc_ln176_reg_216 <= trunc_ln176_fu_135_p1;
        v2_1_reg_243 <= v2_1_fu_184_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        icmp_ln177_reg_234 <= icmp_ln177_fu_155_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        v_reg_227 <= M_e_q1;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            M_e_address0_local = M_e_addr_4_reg_238;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            M_e_address0_local = zext_ln179_fu_165_p1;
        end else begin
            M_e_address0_local = 'bx;
        end
    end else begin
        M_e_address0_local = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        M_e_address1_local = M_e_addr_reg_222;
    end else if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        M_e_address1_local = zext_ln176_fu_145_p1;
    end else begin
        M_e_address1_local = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        M_e_ce0_local = 1'b1;
    end else begin
        M_e_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        M_e_ce1_local = 1'b1;
    end else begin
        M_e_ce1_local = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
        if (((1'b0 == ap_block_pp0_stage1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            M_e_d0_local = v2_1_reg_243;
        end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            M_e_d0_local = v_reg_227;
        end else begin
            M_e_d0_local = 'bx;
        end
    end else begin
        M_e_d0_local = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln177_reg_234 == 1'd0) & (1'b0 == ap_block_pp0_stage1_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1)) | ((icmp_ln177_reg_234 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        M_e_we0_local = 1'b1;
    end else begin
        M_e_we0_local = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln177_fu_155_p2 == 1'd0) & (icmp_ln174_reg_212 == 1'd1) & (ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_11001) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        M_e_we1_local = 1'b1;
    end else begin
        M_e_we1_local = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln174_reg_212 == 1'd0) & (ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b0)) begin
        ap_idle_pp0_1to1 = 1'b1;
    end else begin
        ap_idle_pp0_1to1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0_reg == 1'b1) & (1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_c_4 = 31'd0;
    end else begin
        ap_sig_allocacmp_c_4 = c_fu_38;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign M_e_address0 = M_e_address0_local;

assign M_e_address1 = M_e_address1_local;

assign M_e_ce0 = M_e_ce0_local;

assign M_e_ce1 = M_e_ce1_local;

assign M_e_d0 = M_e_d0_local;

assign M_e_d1 = 32'd0;

assign M_e_we0 = M_e_we0_local;

assign M_e_we1 = M_e_we1_local;

assign add_ln174_fu_129_p2 = (ap_sig_allocacmp_c_4 + 31'd1);

assign add_ln176_fu_139_p2 = (mul_ln176_1 + trunc_ln176_fu_135_p1);

assign add_ln179_fu_161_p2 = (mul_ln172_1 + trunc_ln176_reg_216);

assign add_ln181_fu_170_p2 = (mul_ln173_1 + trunc_ln176_reg_216);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1_subdone = ~(1'b1 == 1'b1);

assign ap_done = ap_done_sig;

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign ap_ready = ap_ready_sig;

assign cmp80_i_i_i_i_fu_105_p2 = ((move_type_5 == 2'd1) ? 1'b1 : 1'b0);

assign icmp_ln174_fu_123_p2 = (($signed(zext_ln174_fu_119_p1) < $signed(colt_1)) ? 1'b1 : 1'b0);

assign icmp_ln177_fu_155_p2 = ((M_e_q1 == 32'd0) ? 1'b1 : 1'b0);

assign trunc_ln176_fu_135_p1 = ap_sig_allocacmp_c_4[16:0];

assign v2_1_fu_184_p3 = ((cmp80_i_i_i_i_reg_207[0:0] == 1'b1) ? v_reg_227 : v2_fu_179_p2);

assign v2_fu_179_p2 = (32'd0 - v_reg_227);

assign zext_ln174_fu_119_p1 = ap_sig_allocacmp_c_4;

assign zext_ln176_fu_145_p1 = add_ln176_fu_139_p2;

assign zext_ln179_fu_165_p1 = add_ln179_fu_161_p2;

assign zext_ln181_fu_174_p1 = add_ln181_fu_170_p2;

endmodule //fmm_reduce_kernel_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_174_39
