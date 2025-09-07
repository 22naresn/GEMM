//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef FMM_REDUCE_KERNEL_REFERENCE_MODEL_SV
`define FMM_REDUCE_KERNEL_REFERENCE_MODEL_SV
typedef class fmm_reduce_kernel_reference_model;
class memaccess_axi_state_cbs extends axi_pkg::axi_state_cbs;
    fmm_reduce_kernel_reference_model refm;
    string memid;
    //function new(string name="memaccess_axi_state_cbs");
    //    super.new(name);
    //endfunction
    virtual function void memmodel_read_fromar(ref logic[7:0] data[$], input longint addr, input longint len);
        if(memid=="gmem") refm.mem_blk_pages_gmem.read_elems_pipepage(data, addr, len);
        if(memid=="gmem2") refm.mem_blk_pages_gmem2.read_elems_pipepage(data, addr, len);
    endfunction
endclass

class fmm_reduce_kernel_reference_model extends uvm_component;
`define TV_IN_gmem "../tv/cdatafile/c.fmm_reduce_kernel.autotvin_gmem.dat"
`define TV_OUT_gmem "../tv/rtldatafile/rtl.fmm_reduce_kernel.autotvout_gmem.dat"
`define TV_IN_OFFSET_A_dram "../tv/cdatafile/c.fmm_reduce_kernel.autotvin_A_dram.dat"
`define TV_IN_gmem2 "../tv/cdatafile/c.fmm_reduce_kernel.autotvin_gmem2.dat"
`define TV_OUT_gmem2 "../tv/rtldatafile/rtl.fmm_reduce_kernel.autotvout_gmem2.dat"
`define TV_IN_OFFSET_debug_dram "../tv/cdatafile/c.fmm_reduce_kernel.autotvin_debug_dram.dat"
`define TV_IN_A_dram "../tv/cdatafile/c.fmm_reduce_kernel.autotvin_A_dram.dat"
`define TV_OUT_A_dram ""
`define TV_IN_debug_dram "../tv/cdatafile/c.fmm_reduce_kernel.autotvin_debug_dram.dat"
`define TV_OUT_debug_dram ""
`define TV_IN_rows "../tv/cdatafile/c.fmm_reduce_kernel.autotvin_rows.dat"
`define TV_OUT_rows ""
`define TV_IN_cols "../tv/cdatafile/c.fmm_reduce_kernel.autotvin_cols.dat"
`define TV_OUT_cols ""
`define TV_IN_t_capacity "../tv/cdatafile/c.fmm_reduce_kernel.autotvin_t_capacity.dat"
`define TV_OUT_t_capacity ""
`define TV_IN_k1 "../tv/cdatafile/c.fmm_reduce_kernel.autotvin_k1.dat"
`define TV_OUT_k1 ""
`define TV_IN_k2 "../tv/cdatafile/c.fmm_reduce_kernel.autotvin_k2.dat"
`define TV_OUT_k2 ""
`define TV_IN_debug_capacity "../tv/cdatafile/c.fmm_reduce_kernel.autotvin_debug_capacity.dat"
`define TV_OUT_debug_capacity ""
    bit  write_data_finish_control_r;
    bit  write_data_finish_control;
    event allaxilite_write_data_finish;
    event allaxilite_write_one_transaction_finish;
    event write_start_finish;
    int trans_num_total = 2;
    int trans_num_idx;
    int ap_done_cnt=1;
    event dut2tb_ap_ready;
    event dut2tb_ap_done;
    event ap_ready_for_nexttrans;
    event ap_done_for_nexttrans;
    event finish;
    fmm_reduce_kernel_config fmm_reduce_kernel_cfg;
    virtual interface misc_interface misc_if;

    mem_model_pages_with_diffofst#(32,8) mem_blk_pages_gmem;
    int blk_id_gmem = 0;
    memaccess_axi_state_cbs axi_memaccess_cb_gmem;

    mem_model_pages_with_diffofst#(32,8) mem_blk_pages_gmem2;
    int blk_id_gmem2 = 0;
    memaccess_axi_state_cbs axi_memaccess_cb_gmem2;

    mem_model_pages#(32,8) mem_blk_pages_control_rows;
    mem_model_pages#(32,8) mem_blk_pages_control_cols;
    mem_model_pages#(32,8) mem_blk_pages_control_t_capacity;
    mem_model_pages#(32,8) mem_blk_pages_control_k1;
    mem_model_pages#(32,8) mem_blk_pages_control_k2;
    mem_model_pages#(32,8) mem_blk_pages_control_debug_capacity;
    
    `uvm_component_utils_begin(fmm_reduce_kernel_reference_model)
        `uvm_field_int (trans_num_idx, UVM_DEFAULT)
    `uvm_component_utils_end

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual misc_interface)::get(this, "", "misc_if", misc_if))
            `uvm_fatal(this.get_full_name(), "No misc_if from high level")
        axi_memaccess_cb_gmem = new;
        axi_memaccess_cb_gmem.refm = this;
        axi_memaccess_cb_gmem.memid = "gmem";
        axi_memaccess_cb_gmem2 = new;
        axi_memaccess_cb_gmem2.refm = this;
        axi_memaccess_cb_gmem2.memid = "gmem2";
    endfunction

    function new (string name = "", uvm_component parent = null);
        super.new (name, parent);
        trans_num_idx= 0;
    endfunction

    virtual task run_phase(uvm_phase phase);
        string fpath[$];
misc_if.dut2tb_ap_done = 0;

        fpath.push_back(`TV_IN_rows);
        mem_blk_pages_control_rows = mem_model_pages#(32,8)::type_id::create("mem_blk_pages_control_rows");
        mem_blk_pages_control_rows.tvinload_pagechk_atinit(fpath, 1*((32+7)/8), 0, 16, "");
        fpath.delete;


        fpath.push_back(`TV_IN_cols);
        mem_blk_pages_control_cols = mem_model_pages#(32,8)::type_id::create("mem_blk_pages_control_cols");
        mem_blk_pages_control_cols.tvinload_pagechk_atinit(fpath, 1*((32+7)/8), 0, 24, "");
        fpath.delete;


        fpath.push_back(`TV_IN_t_capacity);
        mem_blk_pages_control_t_capacity = mem_model_pages#(32,8)::type_id::create("mem_blk_pages_control_t_capacity");
        mem_blk_pages_control_t_capacity.tvinload_pagechk_atinit(fpath, 1*((32+7)/8), 0, 32, "");
        fpath.delete;


        fpath.push_back(`TV_IN_k1);
        mem_blk_pages_control_k1 = mem_model_pages#(32,8)::type_id::create("mem_blk_pages_control_k1");
        mem_blk_pages_control_k1.tvinload_pagechk_atinit(fpath, 1*((32+7)/8), 0, 40, "");
        fpath.delete;


        fpath.push_back(`TV_IN_k2);
        mem_blk_pages_control_k2 = mem_model_pages#(32,8)::type_id::create("mem_blk_pages_control_k2");
        mem_blk_pages_control_k2.tvinload_pagechk_atinit(fpath, 1*((32+7)/8), 0, 48, "");
        fpath.delete;


        fpath.push_back(`TV_IN_debug_capacity);
        mem_blk_pages_control_debug_capacity = mem_model_pages#(32,8)::type_id::create("mem_blk_pages_control_debug_capacity");
        mem_blk_pages_control_debug_capacity.tvinload_pagechk_atinit(fpath, 1*((32+7)/8), 0, 64, "");
        fpath.delete;

        fpath.push_back(`TV_IN_gmem);
        mem_blk_pages_gmem = mem_model_pages_with_diffofst#(32,8)::type_id::create("mem_blk_pages_gmem");
        mem_blk_pages_gmem.whole_page_size=262208;
        mem_blk_pages_gmem.maxi_bundlevar_fpath["A_dram"]=`TV_IN_OFFSET_A_dram;
        mem_blk_pages_gmem.set_binary(1);
        mem_blk_pages_gmem.tvinload_pagechk_atinit(fpath, 65536*((32+7)/8), 0, 0, "");
        mem_blk_pages_gmem.tvoutdump_atinit(`TV_OUT_gmem);
        fpath.delete();

        fpath.push_back(`TV_IN_gmem2);
        mem_blk_pages_gmem2 = mem_model_pages_with_diffofst#(32,8)::type_id::create("mem_blk_pages_gmem2");
        mem_blk_pages_gmem2.whole_page_size=16448;
        mem_blk_pages_gmem2.maxi_bundlevar_fpath["debug_dram"]=`TV_IN_OFFSET_debug_dram;
        mem_blk_pages_gmem2.set_binary(1);
        mem_blk_pages_gmem2.tvinload_pagechk_atinit(fpath, 4096*((32+7)/8), 0, 0, "");
        mem_blk_pages_gmem2.tvoutdump_atinit(`TV_OUT_gmem2);
        fpath.delete();

        fork
            forever begin
                wait(write_data_finish_control_r&&write_data_finish_control);
                `uvm_info("", "trigger_allaxilite_data_write_finish", UVM_LOW)
                @(posedge misc_if.clock);
                write_data_finish_control_r = 0;
                write_data_finish_control = 0;
                -> allaxilite_write_data_finish;
            end
            forever begin
                //this is non-pipeline case
                forever begin
                    @(negedge misc_if.clock);
                    if(misc_if.dut2tb_ap_done===1) break;
                end
                @(posedge misc_if.clock);
                @allaxilite_write_data_finish;
                @(posedge misc_if.clock);
                -> ap_ready_for_nexttrans;
                `uvm_info(this.get_full_name(), "trigger event ap_ready_for_nexttrans", UVM_LOW)
                fork
                    begin
                        misc_if.ap_ready_for_nexttrans = 1;
                        @(posedge misc_if.clock);
                        misc_if.ap_ready_for_nexttrans = 0;
                    end
                join_none
            end
            forever begin
                forever begin
                    @(negedge misc_if.clock);
                    if(misc_if.dut2tb_ap_done===1) break;
                end
                @(posedge misc_if.clock);
                fork
                    begin
                        @(negedge misc_if.clock);
                        -> misc_if.dut2tb_ap_done_evt;
                        #0;
                        -> misc_if.dut2tb_ap_ready_evt;
                    end
                join_none
                -> ap_done_for_nexttrans;
                `uvm_info(this.get_full_name(), "trigger event ap_done_for_nexttrans", UVM_LOW)
                fork
                    begin
                        misc_if.ap_done_for_nexttrans = 1;
                        @(posedge misc_if.clock);
                        misc_if.ap_done_for_nexttrans = 0;
                    end
                join_none
            end

            for(int i=1; i<2; i++) begin
                @dut2tb_ap_ready;
                mem_blk_pages_gmem.incr_rd_page_idx() ;
                mem_blk_pages_gmem2.incr_rd_page_idx() ;
            end
            forever begin
                forever begin
                    @(negedge misc_if.clock);
                    if (misc_if.dut2tb_ap_ready === 1)   break;
                end
                @(posedge misc_if.clock);
                `uvm_info(this.get_full_name(), "trigger event DUT2TB_AP_READY", UVM_LOW)
                -> dut2tb_ap_ready;
                 misc_if.tb2dut_ap_start = 0;
            end
        join
    endtask

    virtual function void write_axi_wtr_gmem(axi_pkg::axi_transfer tr);
        mem_blk_pages_gmem.write_elems_pipepage(tr.data,tr.byte_addr);
    endfunction

    virtual function void write_axi_rtr_gmem(axi_pkg::axi_transfer tr);
    endfunction

    virtual function void write_axi_wtr_gmem2(axi_pkg::axi_transfer tr);
        mem_blk_pages_gmem2.write_elems_pipepage(tr.data,tr.byte_addr);
    endfunction

    virtual function void write_axi_rtr_gmem2(axi_pkg::axi_transfer tr);
    endfunction

    virtual function void write_axi_wtr_control_r(axi_pkg::axi_transfer tr);
    endfunction
    virtual function void write_axi_rtr_control_r(axi_pkg::axi_transfer tr);
            `uvm_info("receive axi read data", tr.sprint(), UVM_HIGH)
        if(0) begin //no block ctrl register processing
        end else begin
        end
    endfunction

    virtual function void write_axi_wtr_control(axi_pkg::axi_transfer tr);
        if(tr.addr == 0 && tr.len == 0 && tr.data[0][0]==1) begin //addr 0 and bit 0 are parameter
            -> write_start_finish;
            misc_if.tb2dut_ap_start = 1;
        end
    endfunction
    virtual function void write_axi_rtr_control(axi_pkg::axi_transfer tr);
            `uvm_info("receive axi read data", tr.sprint(), UVM_HIGH)
        if(tr.addr == 0 && tr.len == 0) begin
            if(tr.data[0][1]==1) begin  //bit 1 is parameter
                `uvm_info("status polling", "ap_done is polled", UVM_LOW);
                fork
                    begin
                        misc_if.dut2tb_ap_done = 1;
                        @(posedge misc_if.clock);
                        #0;
                        misc_if.dut2tb_ap_done = 0;
                        misc_if.tb2dut_ap_continue = 0;
                        -> dut2tb_ap_done;
                    end
                join_none
            end
            begin
                misc_if.dut2tb_ap_idle = tr.data[0][2];
            end
        end else begin
        end
    endfunction
endclass
`endif
