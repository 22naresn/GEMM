//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef FMM_REDUCE_KERNEL_SUBSYS_TEST_SEQUENCE_LIB__SV                                              
    `define FMM_REDUCE_KERNEL_SUBSYS_TEST_SEQUENCE_LIB__SV                                          
                                                                                                    
                                                                                                    
    `include "uvm_macros.svh"                                                                     
                                                                                                    
    class fmm_reduce_kernel_subsys_test_sequence_lib extends uvm_sequence;                                
                                                                                                    
        function new (string name = "fmm_reduce_kernel_subsys_test_sequence_lib");                      
            super.new(name);                                                                        
            `uvm_info(this.get_full_name(), "new is called", UVM_LOW)                             
        endfunction                                                                                 
                                                                                                    
        `uvm_object_utils(fmm_reduce_kernel_subsys_test_sequence_lib)                                     
        `uvm_declare_p_sequencer(fmm_reduce_kernel_virtual_sequencer)                                     
                                                                                                    
        virtual task body();                                                                        
            uvm_phase starting_phase;                                                               
            virtual interface misc_interface misc_if;                                               
            fmm_reduce_kernel_reference_model refm;                                                       
                                                                                                    
            axi_pkg::axi_slave_sequence#(64,4,8,3,1) axi_slave_gmem_seq;
            axi_pkg::axi_slave_sequence#(64,4,8,3,1) axi_slave_gmem2_seq;
            axi_pkg::axi_busdatas_master_sequence#(6, 32) axi_master_wr_control_r_seq;
            axi_pkg::axi_busdatas_master_sequence#(7, 32) axi_master_wr_control_seq;
            axi_pkg::axi_busdatas_master_sequence#(7, 32) axi_master_poll_control_seq;

            if (!uvm_config_db#(fmm_reduce_kernel_reference_model)::get(p_sequencer,"", "refm", refm))
                `uvm_fatal(this.get_full_name(), "No reference model")
            `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_LOW)

            `uvm_info(this.get_full_name(), "body is called", UVM_LOW)
            starting_phase = this.get_starting_phase();
            if (starting_phase != null) begin
                `uvm_info(this.get_full_name(), "starting_phase not null", UVM_LOW)
                starting_phase.raise_objection(this);
            end
            else
                `uvm_info(this.get_full_name(), "starting_phase null" , UVM_LOW)

            misc_if = refm.misc_if;


            //phase_done.set_drain_time(this, 0ns);
            wait(refm.misc_if.reset === 1);
            ->refm.misc_if.initialed_evt;

            fork
                begin
                    fork
                        begin //axi slave sequence. loop delays
                            `uvm_create_on(axi_slave_gmem_seq, p_sequencer.gmem_sqr);
                            axi_slave_gmem_seq.misc_if = refm.misc_if;
                            axi_slave_gmem_seq.ap_done    = refm.ap_done_for_nexttrans   ;
                            axi_slave_gmem_seq.ap_ready   = refm.ap_ready_for_nexttrans  ;
                            axi_slave_gmem_seq.finish     = refm.finish ;
                            axi_slave_gmem_seq.isusr_delay = axi_pkg::NO_DELAY;
                            `uvm_send(axi_slave_gmem_seq);
                        end
                        begin //axi slave sequence. loop delays
                            `uvm_create_on(axi_slave_gmem2_seq, p_sequencer.gmem2_sqr);
                            axi_slave_gmem2_seq.misc_if = refm.misc_if;
                            axi_slave_gmem2_seq.ap_done    = refm.ap_done_for_nexttrans   ;
                            axi_slave_gmem2_seq.ap_ready   = refm.ap_ready_for_nexttrans  ;
                            axi_slave_gmem2_seq.finish     = refm.finish ;
                            axi_slave_gmem2_seq.isusr_delay = axi_pkg::NO_DELAY;
                            `uvm_send(axi_slave_gmem2_seq);
                        end
                        begin
                            int control_r_page_idx_bak;
                            `uvm_create_on(axi_master_wr_control_r_seq, p_sequencer.control_r_sqr);
                            axi_master_wr_control_r_seq.misc_if = refm.misc_if;
                            axi_master_wr_control_r_seq.ap_done    = refm.ap_done_for_nexttrans   ;
                            axi_master_wr_control_r_seq.ap_ready   = refm.ap_ready_for_nexttrans  ;
                            axi_master_wr_control_r_seq.finish     = refm.finish ;
                            axi_master_wr_control_r_seq.isusr_delay = axi_pkg::NO_DELAY;
                            for(int i=0; i<2; i++) begin
                                logic[63:0] data64bit_A_dram[$];
                                logic[32-1:0] databusbit_A_dram[$];
                                logic[63:0] data64bit_debug_dram[$];
                                logic[32-1:0] databusbit_debug_dram[$];
                                data64bit_A_dram.delete(); databusbit_A_dram.delete();
                                axi_master_wr_control_r_seq.StableAxiliteNoUpdate=0;
                                for(int j=0; j < (64+32-1)/32; j++) begin
                                    data64bit_A_dram.push_back( ((refm.mem_blk_pages_gmem.maxi_bundlevar_offset["A_dram"]+refm.mem_blk_pages_gmem.page_ofst[refm.mem_blk_pages_gmem.rd_page_idx])>>(j*32)) & (2**32-1) );
                                end
                                foreach(data64bit_A_dram[s]) databusbit_A_dram[s]=data64bit_A_dram[s][32-1:0];
                                axi_master_wr_control_r_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_r_seq.datamerge_inavg(databusbit_A_dram, 0, 16, 1);
                                data64bit_debug_dram.delete(); databusbit_debug_dram.delete();
                                axi_master_wr_control_r_seq.StableAxiliteNoUpdate=0;
                                for(int j=0; j < (64+32-1)/32; j++) begin
                                    data64bit_debug_dram.push_back( ((refm.mem_blk_pages_gmem2.maxi_bundlevar_offset["debug_dram"]+refm.mem_blk_pages_gmem2.page_ofst[refm.mem_blk_pages_gmem2.rd_page_idx])>>(j*32)) & (2**32-1) );
                                end
                                foreach(data64bit_debug_dram[s]) databusbit_debug_dram[s]=data64bit_debug_dram[s][32-1:0];
                                axi_master_wr_control_r_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_r_seq.datamerge_inavg(databusbit_debug_dram, 0, 28, 1);
                                `uvm_send(axi_master_wr_control_r_seq);
                                @(posedge refm.misc_if.clock); //wait address 2 rsp done
                                @(posedge refm.misc_if.clock);
                                refm.write_data_finish_control_r = 1;
                                `uvm_info("control_r data writting thread", $sformatf("%0dth(total 2): waiting for all write data finish event",i), UVM_LOW)
                                wait(refm.allaxilite_write_data_finish.triggered);
                                refm.write_data_finish_control_r = 0;
                        `uvm_info("control_r wait for ap_ready for next trans", $sformatf("%0dth(total 2): begin to wait",i), UVM_LOW)
                        wait(refm.dut2tb_ap_ready.triggered);
                        wait(refm.ap_done_for_nexttrans.triggered);
                        #0.01; //make sure mem incr_rd_page_idx is called first
                            end
                        end
                        begin
                            int control_page_idx_bak;
                            `uvm_create_on(axi_master_wr_control_seq, p_sequencer.control_sqr);
                            axi_master_wr_control_seq.misc_if = refm.misc_if;
                            axi_master_wr_control_seq.ap_done    = refm.ap_done_for_nexttrans   ;
                            axi_master_wr_control_seq.ap_ready   = refm.ap_ready_for_nexttrans  ;
                            axi_master_wr_control_seq.finish     = refm.finish ;
                            axi_master_wr_control_seq.isusr_delay = axi_pkg::NO_DELAY;
                            for(int i=0; i<2; i++) begin
                                logic[63:0] data64bit_rows[$];
                                logic[32-1:0] databusbit_rows[$];
                                logic[63:0] data64bit_cols[$];
                                logic[32-1:0] databusbit_cols[$];
                                logic[63:0] data64bit_t_capacity[$];
                                logic[32-1:0] databusbit_t_capacity[$];
                                logic[63:0] data64bit_k1[$];
                                logic[32-1:0] databusbit_k1[$];
                                logic[63:0] data64bit_k2[$];
                                logic[32-1:0] databusbit_k2[$];
                                logic[63:0] data64bit_debug_capacity[$];
                                logic[32-1:0] databusbit_debug_capacity[$];
                                data64bit_rows.delete(); databusbit_rows.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_rows.tobusdata(data64bit_rows, refm.mem_blk_pages_control_rows.rd_page_idx, 32);
                                foreach(data64bit_rows[s]) databusbit_rows[s]=data64bit_rows[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_rows, 0, 16, 1);
                                data64bit_cols.delete(); databusbit_cols.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_cols.tobusdata(data64bit_cols, refm.mem_blk_pages_control_cols.rd_page_idx, 32);
                                foreach(data64bit_cols[s]) databusbit_cols[s]=data64bit_cols[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_cols, 0, 24, 1);
                                data64bit_t_capacity.delete(); databusbit_t_capacity.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_t_capacity.tobusdata(data64bit_t_capacity, refm.mem_blk_pages_control_t_capacity.rd_page_idx, 32);
                                foreach(data64bit_t_capacity[s]) databusbit_t_capacity[s]=data64bit_t_capacity[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_t_capacity, 0, 32, 1);
                                data64bit_k1.delete(); databusbit_k1.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_k1.tobusdata(data64bit_k1, refm.mem_blk_pages_control_k1.rd_page_idx, 32);
                                foreach(data64bit_k1[s]) databusbit_k1[s]=data64bit_k1[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_k1, 0, 40, 1);
                                data64bit_k2.delete(); databusbit_k2.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_k2.tobusdata(data64bit_k2, refm.mem_blk_pages_control_k2.rd_page_idx, 32);
                                foreach(data64bit_k2[s]) databusbit_k2[s]=data64bit_k2[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_k2, 0, 48, 1);
                                data64bit_debug_capacity.delete(); databusbit_debug_capacity.delete();
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=0;
                                refm.mem_blk_pages_control_debug_capacity.tobusdata(data64bit_debug_capacity, refm.mem_blk_pages_control_debug_capacity.rd_page_idx, 32);
                                foreach(data64bit_debug_capacity[s]) databusbit_debug_capacity[s]=data64bit_debug_capacity[s][32-1:0];
                                axi_master_wr_control_seq.StableAxiliteNoUpdate=1;
                                axi_master_wr_control_seq.datamerge_inavg(databusbit_debug_capacity, 0, 64, 1);
                                `uvm_send(axi_master_wr_control_seq);
                                @(posedge refm.misc_if.clock); //wait address 2 rsp done
                                @(posedge refm.misc_if.clock);
                                refm.write_data_finish_control = 1;
                                `uvm_info("control data writting thread", $sformatf("%0dth(total 2): waiting for all write data finish event",i), UVM_LOW)
                                wait(refm.allaxilite_write_data_finish.triggered);
                                refm.write_data_finish_control = 0;
                                fork
                                    begin
                                        axi_master_wr_control_seq.wr_addr_data.push_back( (1<<0)+(0<<32) );
                                        `uvm_info("control start dut by axilite", $sformatf("%0dth(total 2): begin to set start bit",i), UVM_LOW)
                                        `uvm_send(axi_master_wr_control_seq);
                                    end
                                    begin
                                        `uvm_info("control wait for ap_ready for next trans", $sformatf("%0dth(total 2): begin to wait",i), UVM_LOW)
                                        wait(refm.dut2tb_ap_ready.triggered);
                                        wait(refm.ap_done_for_nexttrans.triggered);
                                        #0.01; //make sure mem incr_rd_page_idx is called first
                                    end
                                join
                            end
                        end
                        begin
                            for(int j=0; j<2; j=j+refm.ap_done_cnt) begin
                                wait(misc_if.dut2tb_ap_done_kernel == 1);
                                `uvm_info("test finish control", $sformatf("ap_done of kernel is triggered"), UVM_LOW)
                                @(posedge misc_if.clock);
                                fork
                                    forever begin
                                        `uvm_create_on(axi_master_poll_control_seq, p_sequencer.control_sqr);
                                        axi_master_poll_control_seq.isusr_delay = axi_pkg::NO_DELAY;
                                        axi_master_poll_control_seq.misc_if = refm.misc_if;
                                        axi_master_poll_control_seq.rd_addr.push_back(0);
                                        `uvm_send(axi_master_poll_control_seq)
                                        repeat(2) @(posedge misc_if.clock);
                                    end
                                    begin
                                        `uvm_info("test finish control", $sformatf("%0dth(total 2) ap_done_for_nexttrans begin to wait",j), UVM_LOW)
                                        @refm.dut2tb_ap_done;
                                    end
                                join_any
                                disable fork;
                                wait(refm.ap_ready_for_nexttrans.triggered);
                            end
                        end
                    join
                end

                begin
                    for(int j=0; j<2; j=j+refm.ap_done_cnt) @refm.ap_done_for_nexttrans;
                    `uvm_info(this.get_full_name(), "autotb finished", UVM_LOW)
                    -> refm.finish;
                    refm.misc_if.finished = 1;
                    @(posedge refm.misc_if.clock);
                    refm.misc_if.finished = 0;
                    @(posedge refm.misc_if.clock);
                    -> refm.misc_if.finished_evt;
                end
            join_any
            repeat(5) @(posedge refm.misc_if.clock); //5 cycles delay for finish stuff. 5 is haphazard value

            p_sequencer.gmem_sqr.stop_sequences();
            p_sequencer.gmem2_sqr.stop_sequences();
            p_sequencer.control_r_sqr.stop_sequences();
            p_sequencer.control_sqr.stop_sequences();
            disable fork;
                                                                                                    
            starting_phase.drop_objection(this);                                                    
                                                                                                    
        endtask                                                                                     
    endclass                                                                                        
                                                                                                    
`endif                                                                                              
