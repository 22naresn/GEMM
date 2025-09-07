//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef FMM_REDUCE_KERNEL_SUBSYSTEM_MONITOR_SV
`define FMM_REDUCE_KERNEL_SUBSYSTEM_MONITOR_SV

`uvm_analysis_imp_decl(_axi_wtr_gmem)
`uvm_analysis_imp_decl(_axi_rtr_gmem)
`uvm_analysis_imp_decl(_axi_wtr_gmem2)
`uvm_analysis_imp_decl(_axi_rtr_gmem2)
`uvm_analysis_imp_decl(_axi_wtr_control_r)
`uvm_analysis_imp_decl(_axi_rtr_control_r)
`uvm_analysis_imp_decl(_axi_wtr_control)
`uvm_analysis_imp_decl(_axi_rtr_control)

class fmm_reduce_kernel_subsystem_monitor extends uvm_component;

    fmm_reduce_kernel_reference_model refm;
    fmm_reduce_kernel_scoreboard scbd;

    `uvm_component_utils_begin(fmm_reduce_kernel_subsystem_monitor)
    `uvm_component_utils_end

    uvm_analysis_imp_axi_wtr_gmem#(axi_pkg::axi_transfer, fmm_reduce_kernel_subsystem_monitor) gmem_wtr_imp;
    uvm_analysis_imp_axi_rtr_gmem#(axi_pkg::axi_transfer, fmm_reduce_kernel_subsystem_monitor) gmem_rtr_imp;
    uvm_analysis_imp_axi_wtr_gmem2#(axi_pkg::axi_transfer, fmm_reduce_kernel_subsystem_monitor) gmem2_wtr_imp;
    uvm_analysis_imp_axi_rtr_gmem2#(axi_pkg::axi_transfer, fmm_reduce_kernel_subsystem_monitor) gmem2_rtr_imp;
    uvm_analysis_imp_axi_wtr_control_r#(axi_pkg::axi_transfer, fmm_reduce_kernel_subsystem_monitor) control_r_wtr_imp;
    uvm_analysis_imp_axi_rtr_control_r#(axi_pkg::axi_transfer, fmm_reduce_kernel_subsystem_monitor) control_r_rtr_imp;
    uvm_analysis_imp_axi_wtr_control#(axi_pkg::axi_transfer, fmm_reduce_kernel_subsystem_monitor) control_wtr_imp;
    uvm_analysis_imp_axi_rtr_control#(axi_pkg::axi_transfer, fmm_reduce_kernel_subsystem_monitor) control_rtr_imp;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(fmm_reduce_kernel_reference_model)::get(this, "", "refm", refm))
            `uvm_fatal(this.get_full_name(), "No refm from high level")
        `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_MEDIUM)
        scbd = fmm_reduce_kernel_scoreboard::type_id::create("scbd", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    function new (string name = "", uvm_component parent = null);
        super.new(name, parent);
        gmem_wtr_imp = new("gmem_wtr_imp", this);
        gmem_rtr_imp = new("gmem_rtr_imp", this);
        gmem2_wtr_imp = new("gmem2_wtr_imp", this);
        gmem2_rtr_imp = new("gmem2_rtr_imp", this);
        control_r_wtr_imp = new("control_r_wtr_imp", this);
        control_r_rtr_imp = new("control_r_rtr_imp", this);
        control_wtr_imp = new("control_wtr_imp", this);
        control_rtr_imp = new("control_rtr_imp", this);
    endfunction

    virtual function void write_axi_wtr_gmem(axi_transfer tr);
        refm.write_axi_wtr_gmem(tr);
        scbd.write_axi_wtr_gmem(tr);
    endfunction

    virtual function void write_axi_rtr_gmem(axi_transfer tr);
        refm.write_axi_rtr_gmem(tr);
        scbd.write_axi_rtr_gmem(tr);
    endfunction

    virtual function void write_axi_wtr_gmem2(axi_transfer tr);
        refm.write_axi_wtr_gmem2(tr);
        scbd.write_axi_wtr_gmem2(tr);
    endfunction

    virtual function void write_axi_rtr_gmem2(axi_transfer tr);
        refm.write_axi_rtr_gmem2(tr);
        scbd.write_axi_rtr_gmem2(tr);
    endfunction

    virtual function void write_axi_wtr_control_r(axi_transfer tr);
        refm.write_axi_wtr_control_r(tr);
        scbd.write_axi_wtr_control_r(tr);
    endfunction

    virtual function void write_axi_rtr_control_r(axi_transfer tr);
        refm.write_axi_rtr_control_r(tr);
        scbd.write_axi_rtr_control_r(tr);
    endfunction

    virtual function void write_axi_wtr_control(axi_transfer tr);
        refm.write_axi_wtr_control(tr);
        scbd.write_axi_wtr_control(tr);
    endfunction

    virtual function void write_axi_rtr_control(axi_transfer tr);
        refm.write_axi_rtr_control(tr);
        scbd.write_axi_rtr_control(tr);
    endfunction
endclass
`endif
