# This script segment is generated automatically by AutoPilot

set name fmm_reduce_kernel_mul_32s_32s_32_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 100 \
    name M_e_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename M_e_0 \
    op interface \
    ports { M_e_0_address0 { O 15 vector } M_e_0_ce0 { O 1 bit } M_e_0_we0 { O 1 bit } M_e_0_d0 { O 32 vector } M_e_0_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'M_e_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 101 \
    name M_e_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename M_e_1 \
    op interface \
    ports { M_e_1_address0 { O 15 vector } M_e_1_ce0 { O 1 bit } M_e_1_we0 { O 1 bit } M_e_1_d0 { O 32 vector } M_e_1_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'M_e_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 102 \
    name M_e_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename M_e_2 \
    op interface \
    ports { M_e_2_address0 { O 15 vector } M_e_2_ce0 { O 1 bit } M_e_2_we0 { O 1 bit } M_e_2_d0 { O 32 vector } M_e_2_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'M_e_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 103 \
    name M_e_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename M_e_3 \
    op interface \
    ports { M_e_3_address0 { O 15 vector } M_e_3_ce0 { O 1 bit } M_e_3_we0 { O 1 bit } M_e_3_d0 { O 32 vector } M_e_3_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'M_e_3'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 94 \
    name r1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_r1 \
    op interface \
    ports { r1 { I 31 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 95 \
    name r2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_r2 \
    op interface \
    ports { r2 { I 9 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 96 \
    name sign \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sign \
    op interface \
    ports { sign { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 97 \
    name k1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_k1 \
    op interface \
    ports { k1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 98 \
    name k2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_k2 \
    op interface \
    ports { k2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 99 \
    name M_cols \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_M_cols \
    op interface \
    ports { M_cols { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 104 \
    name M_t \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_M_t \
    op interface \
    ports { M_t_i { I 32 vector } M_t_o { O 32 vector } M_t_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 105 \
    name M_t_capacity \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_M_t_capacity \
    op interface \
    ports { M_t_capacity { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 106 \
    name M_rows \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_M_rows \
    op interface \
    ports { M_rows { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 32 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -4 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


