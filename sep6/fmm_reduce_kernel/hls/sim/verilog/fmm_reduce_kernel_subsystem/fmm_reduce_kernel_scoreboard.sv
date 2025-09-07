//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef FMM_REDUCE_KERNEL_SCOREBOARD__SV                                                       
    `define FMM_REDUCE_KERNEL_SCOREBOARD__SV                                                   
                                                                                               
                                                                                               
    class fmm_reduce_kernel_scoreboard extends uvm_component;                                        
                                                                                               
        fmm_reduce_kernel_reference_model refm;                                                      
                                                                                               
                                                                                               
        `uvm_component_utils_begin(fmm_reduce_kernel_scoreboard)                                     
        `uvm_field_object(refm  , UVM_DEFAULT)                                                 
        `uvm_component_utils_end                                                               
                                                                                               
        virtual function void build_phase(uvm_phase phase);                                    
            if (!uvm_config_db #(fmm_reduce_kernel_reference_model)::get(this, "", "refm", refm))
                `uvm_fatal(this.get_full_name(), "No refm from high level")                  
            `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_MEDIUM) 
                                                                                               
        endfunction                                                                            
                                                                                               
        function new (string name = "", uvm_component parent = null);                        
            super.new(name, parent);                                                           
        endfunction                                                                            
                                                                                               
        virtual task run_phase(uvm_phase phase);                                               

            fork                                                                               
                forever begin
                    @refm.allaxilite_write_data_finish;
                    `uvm_info(this.get_full_name(), "receive allaxilite_write_finish axilite write_mem_page_process", UVM_LOW)
                end
                forever begin
                    @refm.allaxilite_write_data_finish;
                    `uvm_info(this.get_full_name(), "receive allaxilite_write_finish axilite write_mem_page_process", UVM_LOW)
                    void'(refm.mem_blk_pages_control_rows.pages.pop_front());
                    void'(refm.mem_blk_pages_control_cols.pages.pop_front());
                    void'(refm.mem_blk_pages_control_t_capacity.pages.pop_front());
                    void'(refm.mem_blk_pages_control_k1.pages.pop_front());
                    void'(refm.mem_blk_pages_control_k2.pages.pop_front());
                    void'(refm.mem_blk_pages_control_debug_capacity.pages.pop_front());
                end
                                                                                               
                forever begin                                                                  
                    @refm.dut2tb_ap_done;                                                             
                    `uvm_info(this.get_full_name(), "receive ap_done_for_nexttrans and do axim dump", UVM_LOW)           
                    for(int j=0; j<refm.ap_done_cnt; j++) begin
                        if(j<refm.trans_num_total) begin
                            refm.mem_blk_pages_gmem.tvout_dump_frontpage(1);
                        end
                    end
                    for(int j=0; j<refm.ap_done_cnt; j++) begin
                        if(j<refm.trans_num_total) begin
                            refm.mem_blk_pages_gmem2.tvout_dump_frontpage(1);
                        end
                    end
                end                                                                            
                begin                                                                          
                    @refm.finish;                                                              
                    `uvm_info(this.get_full_name(), "receive FINISH", UVM_LOW)               
                end                                                                            
            join                                                                               
        endtask                                                                                
                                                                                               
        virtual function void write_axi_wtr_gmem(axi_pkg::axi_transfer tr);
        endfunction

        virtual function void write_axi_rtr_gmem(axi_pkg::axi_transfer tr);
        endfunction

        virtual function void write_axi_wtr_gmem2(axi_pkg::axi_transfer tr);
        endfunction

        virtual function void write_axi_rtr_gmem2(axi_pkg::axi_transfer tr);
        endfunction

        virtual function void write_axi_wtr_control_r(axi_pkg::axi_transfer tr);
        endfunction

        virtual function void write_axi_rtr_control_r(axi_pkg::axi_transfer tr);
        endfunction

        virtual function void write_axi_wtr_control(axi_pkg::axi_transfer tr);
        endfunction

        virtual function void write_axi_rtr_control(axi_pkg::axi_transfer tr);
        endfunction

    endclass                                                                                   
                                                                                               
`endif                                                                                         
