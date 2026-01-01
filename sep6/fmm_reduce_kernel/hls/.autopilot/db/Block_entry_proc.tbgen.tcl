set moduleName Block_entry_proc
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 28
set C_modelName {Block_entry_proc}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ p_read int 1 regular  }
	{ p_read1 int 1 regular  }
	{ gmem int 32 regular {axi_master 2}  }
	{ A_dram int 64 regular {fifo 0}  }
	{ rows int 32 regular {fifo 0}  }
	{ cols int 32 regular {fifo 0}  }
	{ t_capacity int 32 regular {fifo 0}  }
	{ k1 int 32 regular {fifo 0}  }
	{ k2 int 32 regular {fifo 0}  }
	{ gmem2 int 32 regular {axi_master 1}  }
	{ debug_dram int 64 regular {fifo 0}  }
	{ debug_capacity int 32 regular {fifo 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "p_read1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "gmem", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READWRITE", "bitSlice":[ {"cElement": [{"cName": "A_dram","offset": { "type": "dynamic","port_name": "A_dram","bundle": "control_r"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "A_dram", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "rows", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "cols", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "t_capacity", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k2", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gmem2", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "debug_dram","offset": { "type": "dynamic","port_name": "debug_dram","bundle": "control_r"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "debug_dram", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "debug_capacity", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 141
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ p_read sc_in sc_lv 1 signal 0 } 
	{ p_read1 sc_in sc_lv 1 signal 1 } 
	{ m_axi_gmem_0_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_0_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_0_AWADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_gmem_0_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_0_AWLEN sc_out sc_lv 32 signal 2 } 
	{ m_axi_gmem_0_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_0_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_0_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_0_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_0_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_0_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_0_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_0_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_0_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_0_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_0_WDATA sc_out sc_lv 32 signal 2 } 
	{ m_axi_gmem_0_WSTRB sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_0_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_0_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_0_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_0_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_0_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_0_ARADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_gmem_0_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_0_ARLEN sc_out sc_lv 32 signal 2 } 
	{ m_axi_gmem_0_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_0_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_0_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem_0_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_0_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem_0_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_0_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem_0_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem_0_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_0_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_0_RDATA sc_in sc_lv 32 signal 2 } 
	{ m_axi_gmem_0_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_0_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem_0_RFIFONUM sc_in sc_lv 9 signal 2 } 
	{ m_axi_gmem_0_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem_0_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_gmem_0_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem_0_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem_0_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_gmem_0_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem_0_BUSER sc_in sc_lv 1 signal 2 } 
	{ A_dram_dout sc_in sc_lv 64 signal 3 } 
	{ A_dram_empty_n sc_in sc_logic 1 signal 3 } 
	{ A_dram_read sc_out sc_logic 1 signal 3 } 
	{ A_dram_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ A_dram_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ rows_dout sc_in sc_lv 32 signal 4 } 
	{ rows_empty_n sc_in sc_logic 1 signal 4 } 
	{ rows_read sc_out sc_logic 1 signal 4 } 
	{ rows_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ rows_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ cols_dout sc_in sc_lv 32 signal 5 } 
	{ cols_empty_n sc_in sc_logic 1 signal 5 } 
	{ cols_read sc_out sc_logic 1 signal 5 } 
	{ cols_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ cols_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ t_capacity_dout sc_in sc_lv 32 signal 6 } 
	{ t_capacity_empty_n sc_in sc_logic 1 signal 6 } 
	{ t_capacity_read sc_out sc_logic 1 signal 6 } 
	{ t_capacity_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ t_capacity_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ k1_dout sc_in sc_lv 32 signal 7 } 
	{ k1_empty_n sc_in sc_logic 1 signal 7 } 
	{ k1_read sc_out sc_logic 1 signal 7 } 
	{ k1_num_data_valid sc_in sc_lv 3 signal 7 } 
	{ k1_fifo_cap sc_in sc_lv 3 signal 7 } 
	{ k2_dout sc_in sc_lv 32 signal 8 } 
	{ k2_empty_n sc_in sc_logic 1 signal 8 } 
	{ k2_read sc_out sc_logic 1 signal 8 } 
	{ k2_num_data_valid sc_in sc_lv 3 signal 8 } 
	{ k2_fifo_cap sc_in sc_lv 3 signal 8 } 
	{ m_axi_gmem2_0_AWVALID sc_out sc_logic 1 signal 9 } 
	{ m_axi_gmem2_0_AWREADY sc_in sc_logic 1 signal 9 } 
	{ m_axi_gmem2_0_AWADDR sc_out sc_lv 64 signal 9 } 
	{ m_axi_gmem2_0_AWID sc_out sc_lv 1 signal 9 } 
	{ m_axi_gmem2_0_AWLEN sc_out sc_lv 32 signal 9 } 
	{ m_axi_gmem2_0_AWSIZE sc_out sc_lv 3 signal 9 } 
	{ m_axi_gmem2_0_AWBURST sc_out sc_lv 2 signal 9 } 
	{ m_axi_gmem2_0_AWLOCK sc_out sc_lv 2 signal 9 } 
	{ m_axi_gmem2_0_AWCACHE sc_out sc_lv 4 signal 9 } 
	{ m_axi_gmem2_0_AWPROT sc_out sc_lv 3 signal 9 } 
	{ m_axi_gmem2_0_AWQOS sc_out sc_lv 4 signal 9 } 
	{ m_axi_gmem2_0_AWREGION sc_out sc_lv 4 signal 9 } 
	{ m_axi_gmem2_0_AWUSER sc_out sc_lv 1 signal 9 } 
	{ m_axi_gmem2_0_WVALID sc_out sc_logic 1 signal 9 } 
	{ m_axi_gmem2_0_WREADY sc_in sc_logic 1 signal 9 } 
	{ m_axi_gmem2_0_WDATA sc_out sc_lv 32 signal 9 } 
	{ m_axi_gmem2_0_WSTRB sc_out sc_lv 4 signal 9 } 
	{ m_axi_gmem2_0_WLAST sc_out sc_logic 1 signal 9 } 
	{ m_axi_gmem2_0_WID sc_out sc_lv 1 signal 9 } 
	{ m_axi_gmem2_0_WUSER sc_out sc_lv 1 signal 9 } 
	{ m_axi_gmem2_0_ARVALID sc_out sc_logic 1 signal 9 } 
	{ m_axi_gmem2_0_ARREADY sc_in sc_logic 1 signal 9 } 
	{ m_axi_gmem2_0_ARADDR sc_out sc_lv 64 signal 9 } 
	{ m_axi_gmem2_0_ARID sc_out sc_lv 1 signal 9 } 
	{ m_axi_gmem2_0_ARLEN sc_out sc_lv 32 signal 9 } 
	{ m_axi_gmem2_0_ARSIZE sc_out sc_lv 3 signal 9 } 
	{ m_axi_gmem2_0_ARBURST sc_out sc_lv 2 signal 9 } 
	{ m_axi_gmem2_0_ARLOCK sc_out sc_lv 2 signal 9 } 
	{ m_axi_gmem2_0_ARCACHE sc_out sc_lv 4 signal 9 } 
	{ m_axi_gmem2_0_ARPROT sc_out sc_lv 3 signal 9 } 
	{ m_axi_gmem2_0_ARQOS sc_out sc_lv 4 signal 9 } 
	{ m_axi_gmem2_0_ARREGION sc_out sc_lv 4 signal 9 } 
	{ m_axi_gmem2_0_ARUSER sc_out sc_lv 1 signal 9 } 
	{ m_axi_gmem2_0_RVALID sc_in sc_logic 1 signal 9 } 
	{ m_axi_gmem2_0_RREADY sc_out sc_logic 1 signal 9 } 
	{ m_axi_gmem2_0_RDATA sc_in sc_lv 32 signal 9 } 
	{ m_axi_gmem2_0_RLAST sc_in sc_logic 1 signal 9 } 
	{ m_axi_gmem2_0_RID sc_in sc_lv 1 signal 9 } 
	{ m_axi_gmem2_0_RFIFONUM sc_in sc_lv 9 signal 9 } 
	{ m_axi_gmem2_0_RUSER sc_in sc_lv 1 signal 9 } 
	{ m_axi_gmem2_0_RRESP sc_in sc_lv 2 signal 9 } 
	{ m_axi_gmem2_0_BVALID sc_in sc_logic 1 signal 9 } 
	{ m_axi_gmem2_0_BREADY sc_out sc_logic 1 signal 9 } 
	{ m_axi_gmem2_0_BRESP sc_in sc_lv 2 signal 9 } 
	{ m_axi_gmem2_0_BID sc_in sc_lv 1 signal 9 } 
	{ m_axi_gmem2_0_BUSER sc_in sc_lv 1 signal 9 } 
	{ debug_dram_dout sc_in sc_lv 64 signal 10 } 
	{ debug_dram_empty_n sc_in sc_logic 1 signal 10 } 
	{ debug_dram_read sc_out sc_logic 1 signal 10 } 
	{ debug_dram_num_data_valid sc_in sc_lv 3 signal 10 } 
	{ debug_dram_fifo_cap sc_in sc_lv 3 signal 10 } 
	{ debug_capacity_dout sc_in sc_lv 32 signal 11 } 
	{ debug_capacity_empty_n sc_in sc_logic 1 signal 11 } 
	{ debug_capacity_read sc_out sc_logic 1 signal 11 } 
	{ debug_capacity_num_data_valid sc_in sc_lv 3 signal 11 } 
	{ debug_capacity_fifo_cap sc_in sc_lv 3 signal 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "p_read1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_read1", "role": "default" }} , 
 	{ "name": "m_axi_gmem_0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_AWVALID" }} , 
 	{ "name": "m_axi_gmem_0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_AWREADY" }} , 
 	{ "name": "m_axi_gmem_0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "0_AWADDR" }} , 
 	{ "name": "m_axi_gmem_0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_AWID" }} , 
 	{ "name": "m_axi_gmem_0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "0_AWLEN" }} , 
 	{ "name": "m_axi_gmem_0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "0_AWSIZE" }} , 
 	{ "name": "m_axi_gmem_0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "0_AWBURST" }} , 
 	{ "name": "m_axi_gmem_0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "0_AWLOCK" }} , 
 	{ "name": "m_axi_gmem_0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "0_AWCACHE" }} , 
 	{ "name": "m_axi_gmem_0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "0_AWPROT" }} , 
 	{ "name": "m_axi_gmem_0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "0_AWQOS" }} , 
 	{ "name": "m_axi_gmem_0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "0_AWREGION" }} , 
 	{ "name": "m_axi_gmem_0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_AWUSER" }} , 
 	{ "name": "m_axi_gmem_0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_WVALID" }} , 
 	{ "name": "m_axi_gmem_0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_WREADY" }} , 
 	{ "name": "m_axi_gmem_0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "0_WDATA" }} , 
 	{ "name": "m_axi_gmem_0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "0_WSTRB" }} , 
 	{ "name": "m_axi_gmem_0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_WLAST" }} , 
 	{ "name": "m_axi_gmem_0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_WID" }} , 
 	{ "name": "m_axi_gmem_0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_WUSER" }} , 
 	{ "name": "m_axi_gmem_0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_ARVALID" }} , 
 	{ "name": "m_axi_gmem_0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_ARREADY" }} , 
 	{ "name": "m_axi_gmem_0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "0_ARADDR" }} , 
 	{ "name": "m_axi_gmem_0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_ARID" }} , 
 	{ "name": "m_axi_gmem_0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "0_ARLEN" }} , 
 	{ "name": "m_axi_gmem_0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "0_ARSIZE" }} , 
 	{ "name": "m_axi_gmem_0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "0_ARBURST" }} , 
 	{ "name": "m_axi_gmem_0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "0_ARLOCK" }} , 
 	{ "name": "m_axi_gmem_0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "0_ARCACHE" }} , 
 	{ "name": "m_axi_gmem_0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "0_ARPROT" }} , 
 	{ "name": "m_axi_gmem_0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "0_ARQOS" }} , 
 	{ "name": "m_axi_gmem_0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "0_ARREGION" }} , 
 	{ "name": "m_axi_gmem_0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_ARUSER" }} , 
 	{ "name": "m_axi_gmem_0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_RVALID" }} , 
 	{ "name": "m_axi_gmem_0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_RREADY" }} , 
 	{ "name": "m_axi_gmem_0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "0_RDATA" }} , 
 	{ "name": "m_axi_gmem_0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_RLAST" }} , 
 	{ "name": "m_axi_gmem_0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_RID" }} , 
 	{ "name": "m_axi_gmem_0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem", "role": "0_RFIFONUM" }} , 
 	{ "name": "m_axi_gmem_0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_RUSER" }} , 
 	{ "name": "m_axi_gmem_0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "0_RRESP" }} , 
 	{ "name": "m_axi_gmem_0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_BVALID" }} , 
 	{ "name": "m_axi_gmem_0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_BREADY" }} , 
 	{ "name": "m_axi_gmem_0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "0_BRESP" }} , 
 	{ "name": "m_axi_gmem_0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_BID" }} , 
 	{ "name": "m_axi_gmem_0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "0_BUSER" }} , 
 	{ "name": "A_dram_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "A_dram", "role": "dout" }} , 
 	{ "name": "A_dram_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_dram", "role": "empty_n" }} , 
 	{ "name": "A_dram_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_dram", "role": "read" }} , 
 	{ "name": "A_dram_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "A_dram", "role": "num_data_valid" }} , 
 	{ "name": "A_dram_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "A_dram", "role": "fifo_cap" }} , 
 	{ "name": "rows_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rows", "role": "dout" }} , 
 	{ "name": "rows_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rows", "role": "empty_n" }} , 
 	{ "name": "rows_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rows", "role": "read" }} , 
 	{ "name": "rows_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rows", "role": "num_data_valid" }} , 
 	{ "name": "rows_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rows", "role": "fifo_cap" }} , 
 	{ "name": "cols_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cols", "role": "dout" }} , 
 	{ "name": "cols_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cols", "role": "empty_n" }} , 
 	{ "name": "cols_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cols", "role": "read" }} , 
 	{ "name": "cols_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cols", "role": "num_data_valid" }} , 
 	{ "name": "cols_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cols", "role": "fifo_cap" }} , 
 	{ "name": "t_capacity_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "t_capacity", "role": "dout" }} , 
 	{ "name": "t_capacity_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "t_capacity", "role": "empty_n" }} , 
 	{ "name": "t_capacity_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "t_capacity", "role": "read" }} , 
 	{ "name": "t_capacity_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "t_capacity", "role": "num_data_valid" }} , 
 	{ "name": "t_capacity_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "t_capacity", "role": "fifo_cap" }} , 
 	{ "name": "k1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k1", "role": "dout" }} , 
 	{ "name": "k1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k1", "role": "empty_n" }} , 
 	{ "name": "k1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k1", "role": "read" }} , 
 	{ "name": "k1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "k1", "role": "num_data_valid" }} , 
 	{ "name": "k1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "k1", "role": "fifo_cap" }} , 
 	{ "name": "k2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k2", "role": "dout" }} , 
 	{ "name": "k2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k2", "role": "empty_n" }} , 
 	{ "name": "k2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k2", "role": "read" }} , 
 	{ "name": "k2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "k2", "role": "num_data_valid" }} , 
 	{ "name": "k2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "k2", "role": "fifo_cap" }} , 
 	{ "name": "m_axi_gmem2_0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_AWVALID" }} , 
 	{ "name": "m_axi_gmem2_0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_AWREADY" }} , 
 	{ "name": "m_axi_gmem2_0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem2", "role": "0_AWADDR" }} , 
 	{ "name": "m_axi_gmem2_0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_AWID" }} , 
 	{ "name": "m_axi_gmem2_0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem2", "role": "0_AWLEN" }} , 
 	{ "name": "m_axi_gmem2_0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "0_AWSIZE" }} , 
 	{ "name": "m_axi_gmem2_0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "0_AWBURST" }} , 
 	{ "name": "m_axi_gmem2_0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "0_AWLOCK" }} , 
 	{ "name": "m_axi_gmem2_0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "0_AWCACHE" }} , 
 	{ "name": "m_axi_gmem2_0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "0_AWPROT" }} , 
 	{ "name": "m_axi_gmem2_0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "0_AWQOS" }} , 
 	{ "name": "m_axi_gmem2_0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "0_AWREGION" }} , 
 	{ "name": "m_axi_gmem2_0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_AWUSER" }} , 
 	{ "name": "m_axi_gmem2_0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_WVALID" }} , 
 	{ "name": "m_axi_gmem2_0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_WREADY" }} , 
 	{ "name": "m_axi_gmem2_0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem2", "role": "0_WDATA" }} , 
 	{ "name": "m_axi_gmem2_0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "0_WSTRB" }} , 
 	{ "name": "m_axi_gmem2_0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_WLAST" }} , 
 	{ "name": "m_axi_gmem2_0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_WID" }} , 
 	{ "name": "m_axi_gmem2_0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_WUSER" }} , 
 	{ "name": "m_axi_gmem2_0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_ARVALID" }} , 
 	{ "name": "m_axi_gmem2_0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_ARREADY" }} , 
 	{ "name": "m_axi_gmem2_0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem2", "role": "0_ARADDR" }} , 
 	{ "name": "m_axi_gmem2_0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_ARID" }} , 
 	{ "name": "m_axi_gmem2_0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem2", "role": "0_ARLEN" }} , 
 	{ "name": "m_axi_gmem2_0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "0_ARSIZE" }} , 
 	{ "name": "m_axi_gmem2_0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "0_ARBURST" }} , 
 	{ "name": "m_axi_gmem2_0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "0_ARLOCK" }} , 
 	{ "name": "m_axi_gmem2_0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "0_ARCACHE" }} , 
 	{ "name": "m_axi_gmem2_0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "0_ARPROT" }} , 
 	{ "name": "m_axi_gmem2_0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "0_ARQOS" }} , 
 	{ "name": "m_axi_gmem2_0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "0_ARREGION" }} , 
 	{ "name": "m_axi_gmem2_0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_ARUSER" }} , 
 	{ "name": "m_axi_gmem2_0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_RVALID" }} , 
 	{ "name": "m_axi_gmem2_0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_RREADY" }} , 
 	{ "name": "m_axi_gmem2_0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem2", "role": "0_RDATA" }} , 
 	{ "name": "m_axi_gmem2_0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_RLAST" }} , 
 	{ "name": "m_axi_gmem2_0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_RID" }} , 
 	{ "name": "m_axi_gmem2_0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "gmem2", "role": "0_RFIFONUM" }} , 
 	{ "name": "m_axi_gmem2_0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_RUSER" }} , 
 	{ "name": "m_axi_gmem2_0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "0_RRESP" }} , 
 	{ "name": "m_axi_gmem2_0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_BVALID" }} , 
 	{ "name": "m_axi_gmem2_0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_BREADY" }} , 
 	{ "name": "m_axi_gmem2_0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "0_BRESP" }} , 
 	{ "name": "m_axi_gmem2_0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_BID" }} , 
 	{ "name": "m_axi_gmem2_0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "0_BUSER" }} , 
 	{ "name": "debug_dram_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "debug_dram", "role": "dout" }} , 
 	{ "name": "debug_dram_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "debug_dram", "role": "empty_n" }} , 
 	{ "name": "debug_dram_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "debug_dram", "role": "read" }} , 
 	{ "name": "debug_dram_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "debug_dram", "role": "num_data_valid" }} , 
 	{ "name": "debug_dram_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "debug_dram", "role": "fifo_cap" }} , 
 	{ "name": "debug_capacity_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "debug_capacity", "role": "dout" }} , 
 	{ "name": "debug_capacity_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "debug_capacity", "role": "empty_n" }} , 
 	{ "name": "debug_capacity_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "debug_capacity", "role": "read" }} , 
 	{ "name": "debug_capacity_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "debug_capacity", "role": "num_data_valid" }} , 
 	{ "name": "debug_capacity_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "debug_capacity", "role": "fifo_cap" }}  ]}

set ArgLastReadFirstWriteLatency {
	Block_entry_proc {
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		gmem {Type IO LastRead 12 FirstWrite -1}
		A_dram {Type I LastRead 0 FirstWrite -1}
		rows {Type I LastRead 0 FirstWrite -1}
		cols {Type I LastRead 0 FirstWrite -1}
		t_capacity {Type I LastRead 0 FirstWrite -1}
		k1 {Type I LastRead 0 FirstWrite -1}
		k2 {Type I LastRead 0 FirstWrite -1}
		gmem2 {Type O LastRead 26 FirstWrite 2}
		debug_dram {Type I LastRead 0 FirstWrite -1}
		debug_capacity {Type I LastRead 0 FirstWrite -1}
		M_rows {Type IO LastRead -1 FirstWrite -1}
		M_cols {Type IO LastRead -1 FirstWrite -1}
		M_t {Type IO LastRead -1 FirstWrite -1}
		M_t_capacity {Type IO LastRead -1 FirstWrite -1}
		M_e {Type IO LastRead -1 FirstWrite -1}}
	load_matrix_from_dram_safe {
		gmem {Type I LastRead 12 FirstWrite -1}
		A_dram {Type I LastRead 2 FirstWrite -1}
		rows {Type I LastRead 0 FirstWrite -1}
		cols {Type I LastRead 0 FirstWrite -1}
		t_capacity {Type I LastRead 3 FirstWrite -1}
		M_e {Type O LastRead -1 FirstWrite 2}
		M_rows {Type O LastRead -1 FirstWrite 0}
		M_cols {Type O LastRead -1 FirstWrite 0}
		M_t {Type O LastRead -1 FirstWrite 3}
		M_t_capacity {Type O LastRead -1 FirstWrite 3}}
	load_matrix_from_dram_safe_Pipeline_VITIS_LOOP_49_1_VITIS_LOOP_51_2 {
		M_e {Type O LastRead -1 FirstWrite 2}}
	load_matrix_from_dram_safe_Pipeline_VITIS_LOOP_58_3_VITIS_LOOP_59_4 {
		cols {Type I LastRead 0 FirstWrite -1}
		mul_ln58 {Type I LastRead 0 FirstWrite -1}
		A_dram {Type I LastRead 0 FirstWrite -1}
		gmem {Type I LastRead 12 FirstWrite -1}
		sext_ln58 {Type I LastRead 0 FirstWrite -1}
		M_e {Type O LastRead -1 FirstWrite 13}}
	greedy_potential_reduce_with_debug {
		k1 {Type I LastRead 3 FirstWrite -1}
		k2 {Type I LastRead 3 FirstWrite -1}
		gmem2 {Type O LastRead 26 FirstWrite 4}
		debug_dram {Type I LastRead 3 FirstWrite -1}
		debug_capacity {Type I LastRead 0 FirstWrite -1}
		M_e {Type IO LastRead 3 FirstWrite -1}
		M_cols {Type I LastRead 3 FirstWrite -1}
		M_rows {Type I LastRead 3 FirstWrite -1}
		M_t {Type IO LastRead 14 FirstWrite 18}
		M_t_capacity {Type I LastRead 13 FirstWrite -1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_103_1_VITIS_LOOP_92_1 {
		total_rows {Type I LastRead 0 FirstWrite -1}
		mul_ln250 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 2 FirstWrite -1}
		s_1_out {Type O LastRead -1 FirstWrite 3}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_115_1 {
		cols_non_t {Type I LastRead 0 FirstWrite -1}
		mul_ln117 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 1 FirstWrite -1}
		j_1 {Type I LastRead 0 FirstWrite -1}
		n_out {Type O LastRead -1 FirstWrite 1}
		p_out {Type O LastRead -1 FirstWrite 1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_115_13 {
		cols_non_t {Type I LastRead 0 FirstWrite -1}
		mul_ln117 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 1 FirstWrite -1}
		j_1 {Type I LastRead 0 FirstWrite -1}
		p_2_out {Type O LastRead -1 FirstWrite 0}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_135_1 {
		new_col {Type I LastRead 0 FirstWrite -1}
		mul_ln117 {Type I LastRead 0 FirstWrite -1}
		M_e {Type IO LastRead 1 FirstWrite 2}
		mul_ln119277 {Type I LastRead 0 FirstWrite -1}
		mul_ln144_1 {Type I LastRead 0 FirstWrite -1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_192_2_VITIS_LOOP_115_1 {
		zext_ln192 {Type I LastRead 0 FirstWrite -1}
		s_4 {Type I LastRead 0 FirstWrite -1}
		cols_non_t {Type I LastRead 0 FirstWrite -1}
		mul_ln191 {Type I LastRead 0 FirstWrite -1}
		mul_ln117_1 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 3 FirstWrite -1}
		s_9_out {Type O LastRead -1 FirstWrite 3}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_157_1 {
		rowt {Type I LastRead 0 FirstWrite -1}
		idxprom4_i12_i332_i_i {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 0 FirstWrite -1}
		row1_ce_out {Type O LastRead -1 FirstWrite 1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_163_2 {
		zext_ln163 {Type I LastRead 0 FirstWrite -1}
		idxprom4_i12_i332_i_i {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 0 FirstWrite -1}
		sext_ln163 {Type I LastRead 0 FirstWrite -1}
		move_type_1_out {Type O LastRead -1 FirstWrite 1}
		row2_1_out {Type O LastRead -1 FirstWrite 1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_174_3 {
		move_type_2 {Type I LastRead 0 FirstWrite -1}
		colt {Type I LastRead 0 FirstWrite -1}
		mul_ln176 {Type I LastRead 0 FirstWrite -1}
		M_e {Type IO LastRead 0 FirstWrite 1}
		mul_ln172 {Type I LastRead 0 FirstWrite -1}
		mul_ln173 {Type I LastRead 0 FirstWrite -1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_115_14 {
		cols_non_t {Type I LastRead 0 FirstWrite -1}
		mul_ln117 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 1 FirstWrite -1}
		j_1 {Type I LastRead 0 FirstWrite -1}
		n_6_out {Type O LastRead -1 FirstWrite 1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_135_15 {
		new_col_2 {Type I LastRead 0 FirstWrite -1}
		mul_ln117 {Type I LastRead 0 FirstWrite -1}
		M_e {Type IO LastRead 1 FirstWrite 3}
		mul_ln119274 {Type I LastRead 0 FirstWrite -1}
		mul_ln144_2 {Type I LastRead 0 FirstWrite -1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_192_2_VITIS_LOOP_115_16 {
		zext_ln192_3 {Type I LastRead 0 FirstWrite -1}
		s_11 {Type I LastRead 0 FirstWrite -1}
		cols_non_t {Type I LastRead 0 FirstWrite -1}
		mul_ln191_1 {Type I LastRead 0 FirstWrite -1}
		mul_ln117_2 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 3 FirstWrite -1}
		s_16_out {Type O LastRead -1 FirstWrite 3}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_157_17 {
		rowt_1 {Type I LastRead 0 FirstWrite -1}
		idxprom4_i12_i_i_i {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 0 FirstWrite -1}
		row1_3_ce_out {Type O LastRead -1 FirstWrite 1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_163_28 {
		zext_ln163_1 {Type I LastRead 0 FirstWrite -1}
		idxprom4_i12_i_i_i {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 0 FirstWrite -1}
		sext_ln163_1 {Type I LastRead 0 FirstWrite -1}
		move_type_4_out {Type O LastRead -1 FirstWrite 1}
		row2_4_out {Type O LastRead -1 FirstWrite 1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_174_39 {
		move_type_5 {Type I LastRead 0 FirstWrite -1}
		colt_1 {Type I LastRead 0 FirstWrite -1}
		mul_ln176_1 {Type I LastRead 0 FirstWrite -1}
		M_e {Type IO LastRead 0 FirstWrite 1}
		mul_ln172_1 {Type I LastRead 0 FirstWrite -1}
		mul_ln173_1 {Type I LastRead 0 FirstWrite -1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_135_110 {
		new_col_3 {Type I LastRead 0 FirstWrite -1}
		mul_ln132 {Type I LastRead 0 FirstWrite -1}
		M_e {Type IO LastRead 1 FirstWrite 3}
		mul_ln133 {Type I LastRead 0 FirstWrite -1}
		mul_ln144 {Type I LastRead 0 FirstWrite -1}
		icmp_ln133 {Type I LastRead 0 FirstWrite -1}
		cmp34_i_i {Type I LastRead 0 FirstWrite -1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_103_1_VITIS_LOOP_92_111 {
		total_rows_1 {Type I LastRead 0 FirstWrite -1}
		mul_ln266 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 2 FirstWrite -1}
		s_3_out {Type O LastRead -1 FirstWrite 3}}
	store_matrix_to_dram_safe {
		gmem {Type O LastRead 6 FirstWrite 5}
		A_dram {Type I LastRead 2 FirstWrite -1}
		M_rows {Type I LastRead 0 FirstWrite -1}
		M_cols {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 3 FirstWrite -1}}
	store_matrix_to_dram_safe_Pipeline_VITIS_LOOP_76_1_VITIS_LOOP_77_2 {
		cols {Type I LastRead 0 FirstWrite -1}
		bound {Type I LastRead 0 FirstWrite -1}
		A_dram {Type I LastRead 0 FirstWrite -1}
		gmem {Type O LastRead 6 FirstWrite 5}
		sext_ln76 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 3 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	p_read { ap_none {  { p_read in_data 0 1 } } }
	p_read1 { ap_none {  { p_read1 in_data 0 1 } } }
	 { m_axi {  { m_axi_gmem_0_AWVALID VALID 1 1 }  { m_axi_gmem_0_AWREADY READY 0 1 }  { m_axi_gmem_0_AWADDR ADDR 1 64 }  { m_axi_gmem_0_AWID ID 1 1 }  { m_axi_gmem_0_AWLEN SIZE 1 32 }  { m_axi_gmem_0_AWSIZE BURST 1 3 }  { m_axi_gmem_0_AWBURST LOCK 1 2 }  { m_axi_gmem_0_AWLOCK CACHE 1 2 }  { m_axi_gmem_0_AWCACHE PROT 1 4 }  { m_axi_gmem_0_AWPROT QOS 1 3 }  { m_axi_gmem_0_AWQOS REGION 1 4 }  { m_axi_gmem_0_AWREGION USER 1 4 }  { m_axi_gmem_0_AWUSER DATA 1 1 }  { m_axi_gmem_0_WVALID VALID 1 1 }  { m_axi_gmem_0_WREADY READY 0 1 }  { m_axi_gmem_0_WDATA FIFONUM 1 32 }  { m_axi_gmem_0_WSTRB STRB 1 4 }  { m_axi_gmem_0_WLAST LAST 1 1 }  { m_axi_gmem_0_WID ID 1 1 }  { m_axi_gmem_0_WUSER DATA 1 1 }  { m_axi_gmem_0_ARVALID VALID 1 1 }  { m_axi_gmem_0_ARREADY READY 0 1 }  { m_axi_gmem_0_ARADDR ADDR 1 64 }  { m_axi_gmem_0_ARID ID 1 1 }  { m_axi_gmem_0_ARLEN SIZE 1 32 }  { m_axi_gmem_0_ARSIZE BURST 1 3 }  { m_axi_gmem_0_ARBURST LOCK 1 2 }  { m_axi_gmem_0_ARLOCK CACHE 1 2 }  { m_axi_gmem_0_ARCACHE PROT 1 4 }  { m_axi_gmem_0_ARPROT QOS 1 3 }  { m_axi_gmem_0_ARQOS REGION 1 4 }  { m_axi_gmem_0_ARREGION USER 1 4 }  { m_axi_gmem_0_ARUSER DATA 1 1 }  { m_axi_gmem_0_RVALID VALID 0 1 }  { m_axi_gmem_0_RREADY READY 1 1 }  { m_axi_gmem_0_RDATA FIFONUM 0 32 }  { m_axi_gmem_0_RLAST LAST 0 1 }  { m_axi_gmem_0_RID ID 0 1 }  { m_axi_gmem_0_RFIFONUM LEN 0 9 }  { m_axi_gmem_0_RUSER DATA 0 1 }  { m_axi_gmem_0_RRESP RESP 0 2 }  { m_axi_gmem_0_BVALID VALID 0 1 }  { m_axi_gmem_0_BREADY READY 1 1 }  { m_axi_gmem_0_BRESP RESP 0 2 }  { m_axi_gmem_0_BID ID 0 1 }  { m_axi_gmem_0_BUSER DATA 0 1 } } }
	A_dram { ap_fifo {  { A_dram_dout fifo_data_in 0 64 }  { A_dram_empty_n fifo_status 0 1 }  { A_dram_read fifo_port_we 1 1 }  { A_dram_num_data_valid fifo_status_num_data_valid 0 3 }  { A_dram_fifo_cap fifo_update 0 3 } } }
	rows { ap_fifo {  { rows_dout fifo_data_in 0 32 }  { rows_empty_n fifo_status 0 1 }  { rows_read fifo_port_we 1 1 }  { rows_num_data_valid fifo_status_num_data_valid 0 3 }  { rows_fifo_cap fifo_update 0 3 } } }
	cols { ap_fifo {  { cols_dout fifo_data_in 0 32 }  { cols_empty_n fifo_status 0 1 }  { cols_read fifo_port_we 1 1 }  { cols_num_data_valid fifo_status_num_data_valid 0 3 }  { cols_fifo_cap fifo_update 0 3 } } }
	t_capacity { ap_fifo {  { t_capacity_dout fifo_data_in 0 32 }  { t_capacity_empty_n fifo_status 0 1 }  { t_capacity_read fifo_port_we 1 1 }  { t_capacity_num_data_valid fifo_status_num_data_valid 0 3 }  { t_capacity_fifo_cap fifo_update 0 3 } } }
	k1 { ap_fifo {  { k1_dout fifo_data_in 0 32 }  { k1_empty_n fifo_status 0 1 }  { k1_read fifo_port_we 1 1 }  { k1_num_data_valid fifo_status_num_data_valid 0 3 }  { k1_fifo_cap fifo_update 0 3 } } }
	k2 { ap_fifo {  { k2_dout fifo_data_in 0 32 }  { k2_empty_n fifo_status 0 1 }  { k2_read fifo_port_we 1 1 }  { k2_num_data_valid fifo_status_num_data_valid 0 3 }  { k2_fifo_cap fifo_update 0 3 } } }
	 { m_axi {  { m_axi_gmem2_0_AWVALID VALID 1 1 }  { m_axi_gmem2_0_AWREADY READY 0 1 }  { m_axi_gmem2_0_AWADDR ADDR 1 64 }  { m_axi_gmem2_0_AWID ID 1 1 }  { m_axi_gmem2_0_AWLEN SIZE 1 32 }  { m_axi_gmem2_0_AWSIZE BURST 1 3 }  { m_axi_gmem2_0_AWBURST LOCK 1 2 }  { m_axi_gmem2_0_AWLOCK CACHE 1 2 }  { m_axi_gmem2_0_AWCACHE PROT 1 4 }  { m_axi_gmem2_0_AWPROT QOS 1 3 }  { m_axi_gmem2_0_AWQOS REGION 1 4 }  { m_axi_gmem2_0_AWREGION USER 1 4 }  { m_axi_gmem2_0_AWUSER DATA 1 1 }  { m_axi_gmem2_0_WVALID VALID 1 1 }  { m_axi_gmem2_0_WREADY READY 0 1 }  { m_axi_gmem2_0_WDATA FIFONUM 1 32 }  { m_axi_gmem2_0_WSTRB STRB 1 4 }  { m_axi_gmem2_0_WLAST LAST 1 1 }  { m_axi_gmem2_0_WID ID 1 1 }  { m_axi_gmem2_0_WUSER DATA 1 1 }  { m_axi_gmem2_0_ARVALID VALID 1 1 }  { m_axi_gmem2_0_ARREADY READY 0 1 }  { m_axi_gmem2_0_ARADDR ADDR 1 64 }  { m_axi_gmem2_0_ARID ID 1 1 }  { m_axi_gmem2_0_ARLEN SIZE 1 32 }  { m_axi_gmem2_0_ARSIZE BURST 1 3 }  { m_axi_gmem2_0_ARBURST LOCK 1 2 }  { m_axi_gmem2_0_ARLOCK CACHE 1 2 }  { m_axi_gmem2_0_ARCACHE PROT 1 4 }  { m_axi_gmem2_0_ARPROT QOS 1 3 }  { m_axi_gmem2_0_ARQOS REGION 1 4 }  { m_axi_gmem2_0_ARREGION USER 1 4 }  { m_axi_gmem2_0_ARUSER DATA 1 1 }  { m_axi_gmem2_0_RVALID VALID 0 1 }  { m_axi_gmem2_0_RREADY READY 1 1 }  { m_axi_gmem2_0_RDATA FIFONUM 0 32 }  { m_axi_gmem2_0_RLAST LAST 0 1 }  { m_axi_gmem2_0_RID ID 0 1 }  { m_axi_gmem2_0_RFIFONUM LEN 0 9 }  { m_axi_gmem2_0_RUSER DATA 0 1 }  { m_axi_gmem2_0_RRESP RESP 0 2 }  { m_axi_gmem2_0_BVALID VALID 0 1 }  { m_axi_gmem2_0_BREADY READY 1 1 }  { m_axi_gmem2_0_BRESP RESP 0 2 }  { m_axi_gmem2_0_BID ID 0 1 }  { m_axi_gmem2_0_BUSER DATA 0 1 } } }
	debug_dram { ap_fifo {  { debug_dram_dout fifo_data_in 0 64 }  { debug_dram_empty_n fifo_status 0 1 }  { debug_dram_read fifo_port_we 1 1 }  { debug_dram_num_data_valid fifo_status_num_data_valid 0 3 }  { debug_dram_fifo_cap fifo_update 0 3 } } }
	debug_capacity { ap_fifo {  { debug_capacity_dout fifo_data_in 0 32 }  { debug_capacity_empty_n fifo_status 0 1 }  { debug_capacity_read fifo_port_we 1 1 }  { debug_capacity_num_data_valid fifo_status_num_data_valid 0 3 }  { debug_capacity_fifo_cap fifo_update 0 3 } } }
}
