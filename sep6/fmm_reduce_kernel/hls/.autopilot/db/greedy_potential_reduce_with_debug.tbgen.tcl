set moduleName greedy_potential_reduce_with_debug
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
set C_modelName {greedy_potential_reduce_with_debug}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict M_e { MEM_WIDTH 32 MEM_SIZE 409600 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ k1 int 32 regular  }
	{ k2 int 32 regular  }
	{ gmem2 int 32 regular {axi_master 1}  }
	{ debug_dram int 64 regular  }
	{ debug_capacity int 32 regular  }
	{ M_e int 32 regular {array 102400 { 2 2 } 1 1 }  }
	{ M_cols int 32 regular {pointer 0} {global 0}  }
	{ M_rows int 32 regular {pointer 0} {global 0}  }
	{ M_t int 32 regular {pointer 2} {global 2}  }
	{ M_t_capacity int 32 regular {pointer 0} {global 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "k1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gmem2", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "debug_dram","offset": { "type": "dynamic","port_name": "debug_dram","bundle": "control_r"},"direction": "WRITEONLY"}]}]} , 
 	{ "Name" : "debug_dram", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "debug_capacity", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "M_e", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "M_cols", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "M_rows", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "M_t", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "M_t_capacity", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 72
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ k1 sc_in sc_lv 32 signal 0 } 
	{ k2 sc_in sc_lv 32 signal 1 } 
	{ m_axi_gmem2_0_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem2_0_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem2_0_AWADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_gmem2_0_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem2_0_AWLEN sc_out sc_lv 32 signal 2 } 
	{ m_axi_gmem2_0_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem2_0_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem2_0_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem2_0_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem2_0_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem2_0_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem2_0_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem2_0_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem2_0_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem2_0_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem2_0_WDATA sc_out sc_lv 32 signal 2 } 
	{ m_axi_gmem2_0_WSTRB sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem2_0_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem2_0_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem2_0_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem2_0_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem2_0_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem2_0_ARADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_gmem2_0_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem2_0_ARLEN sc_out sc_lv 32 signal 2 } 
	{ m_axi_gmem2_0_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem2_0_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem2_0_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem2_0_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem2_0_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem2_0_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem2_0_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem2_0_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem2_0_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem2_0_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem2_0_RDATA sc_in sc_lv 32 signal 2 } 
	{ m_axi_gmem2_0_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem2_0_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem2_0_RFIFONUM sc_in sc_lv 9 signal 2 } 
	{ m_axi_gmem2_0_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem2_0_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_gmem2_0_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem2_0_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem2_0_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_gmem2_0_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem2_0_BUSER sc_in sc_lv 1 signal 2 } 
	{ debug_dram sc_in sc_lv 64 signal 3 } 
	{ debug_capacity sc_in sc_lv 32 signal 4 } 
	{ M_e_address0 sc_out sc_lv 17 signal 5 } 
	{ M_e_ce0 sc_out sc_logic 1 signal 5 } 
	{ M_e_we0 sc_out sc_logic 1 signal 5 } 
	{ M_e_d0 sc_out sc_lv 32 signal 5 } 
	{ M_e_q0 sc_in sc_lv 32 signal 5 } 
	{ M_e_address1 sc_out sc_lv 17 signal 5 } 
	{ M_e_ce1 sc_out sc_logic 1 signal 5 } 
	{ M_e_we1 sc_out sc_logic 1 signal 5 } 
	{ M_e_d1 sc_out sc_lv 32 signal 5 } 
	{ M_e_q1 sc_in sc_lv 32 signal 5 } 
	{ M_cols sc_in sc_lv 32 signal 6 } 
	{ M_rows sc_in sc_lv 32 signal 7 } 
	{ M_t_i sc_in sc_lv 32 signal 8 } 
	{ M_t_o sc_out sc_lv 32 signal 8 } 
	{ M_t_o_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ M_t_capacity sc_in sc_lv 32 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "k1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k1", "role": "default" }} , 
 	{ "name": "k2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k2", "role": "default" }} , 
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
 	{ "name": "debug_dram", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "debug_dram", "role": "default" }} , 
 	{ "name": "debug_capacity", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "debug_capacity", "role": "default" }} , 
 	{ "name": "M_e_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "M_e", "role": "address0" }} , 
 	{ "name": "M_e_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e", "role": "ce0" }} , 
 	{ "name": "M_e_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e", "role": "we0" }} , 
 	{ "name": "M_e_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e", "role": "d0" }} , 
 	{ "name": "M_e_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e", "role": "q0" }} , 
 	{ "name": "M_e_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "M_e", "role": "address1" }} , 
 	{ "name": "M_e_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e", "role": "ce1" }} , 
 	{ "name": "M_e_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e", "role": "we1" }} , 
 	{ "name": "M_e_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e", "role": "d1" }} , 
 	{ "name": "M_e_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e", "role": "q1" }} , 
 	{ "name": "M_cols", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_cols", "role": "default" }} , 
 	{ "name": "M_rows", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_rows", "role": "default" }} , 
 	{ "name": "M_t_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_t", "role": "i" }} , 
 	{ "name": "M_t_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_t", "role": "o" }} , 
 	{ "name": "M_t_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "M_t", "role": "o_ap_vld" }} , 
 	{ "name": "M_t_capacity", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_t_capacity", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
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
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_104_1_VITIS_LOOP_93_1 {
		total_rows {Type I LastRead 0 FirstWrite -1}
		mul_ln251 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 2 FirstWrite -1}
		s_1_out {Type O LastRead -1 FirstWrite 3}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_116_1 {
		cols_non_t {Type I LastRead 0 FirstWrite -1}
		mul_ln118 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 1 FirstWrite -1}
		j_1 {Type I LastRead 0 FirstWrite -1}
		n_out {Type O LastRead -1 FirstWrite 1}
		p_out {Type O LastRead -1 FirstWrite 1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_116_13 {
		cols_non_t {Type I LastRead 0 FirstWrite -1}
		mul_ln118 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 1 FirstWrite -1}
		j_1 {Type I LastRead 0 FirstWrite -1}
		p_2_out {Type O LastRead -1 FirstWrite 0}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_136_1 {
		new_col {Type I LastRead 0 FirstWrite -1}
		mul_ln118 {Type I LastRead 0 FirstWrite -1}
		M_e {Type IO LastRead 1 FirstWrite 2}
		mul_ln120277 {Type I LastRead 0 FirstWrite -1}
		mul_ln145_1 {Type I LastRead 0 FirstWrite -1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_193_2_VITIS_LOOP_116_1 {
		zext_ln193 {Type I LastRead 0 FirstWrite -1}
		s_4 {Type I LastRead 0 FirstWrite -1}
		cols_non_t {Type I LastRead 0 FirstWrite -1}
		mul_ln192 {Type I LastRead 0 FirstWrite -1}
		mul_ln118_1 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 3 FirstWrite -1}
		s_9_out {Type O LastRead -1 FirstWrite 3}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_158_1 {
		rowt {Type I LastRead 0 FirstWrite -1}
		idxprom4_i12_i332_i_i {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 0 FirstWrite -1}
		row1_ce_out {Type O LastRead -1 FirstWrite 1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_164_2 {
		zext_ln164 {Type I LastRead 0 FirstWrite -1}
		idxprom4_i12_i332_i_i {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 0 FirstWrite -1}
		sext_ln164 {Type I LastRead 0 FirstWrite -1}
		move_type_1_out {Type O LastRead -1 FirstWrite 1}
		row2_1_out {Type O LastRead -1 FirstWrite 1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_175_3 {
		move_type_2 {Type I LastRead 0 FirstWrite -1}
		colt {Type I LastRead 0 FirstWrite -1}
		mul_ln177 {Type I LastRead 0 FirstWrite -1}
		M_e {Type IO LastRead 0 FirstWrite 1}
		mul_ln173 {Type I LastRead 0 FirstWrite -1}
		mul_ln174 {Type I LastRead 0 FirstWrite -1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_116_14 {
		cols_non_t {Type I LastRead 0 FirstWrite -1}
		mul_ln118 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 1 FirstWrite -1}
		j_1 {Type I LastRead 0 FirstWrite -1}
		n_6_out {Type O LastRead -1 FirstWrite 1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_136_15 {
		new_col_2 {Type I LastRead 0 FirstWrite -1}
		mul_ln118 {Type I LastRead 0 FirstWrite -1}
		M_e {Type IO LastRead 1 FirstWrite 3}
		mul_ln120274 {Type I LastRead 0 FirstWrite -1}
		mul_ln145_2 {Type I LastRead 0 FirstWrite -1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_193_2_VITIS_LOOP_116_16 {
		zext_ln193_3 {Type I LastRead 0 FirstWrite -1}
		s_11 {Type I LastRead 0 FirstWrite -1}
		cols_non_t {Type I LastRead 0 FirstWrite -1}
		mul_ln192_1 {Type I LastRead 0 FirstWrite -1}
		mul_ln118_2 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 3 FirstWrite -1}
		s_16_out {Type O LastRead -1 FirstWrite 3}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_158_17 {
		rowt_1 {Type I LastRead 0 FirstWrite -1}
		idxprom4_i12_i_i_i {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 0 FirstWrite -1}
		row1_3_ce_out {Type O LastRead -1 FirstWrite 1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_164_28 {
		zext_ln164_1 {Type I LastRead 0 FirstWrite -1}
		idxprom4_i12_i_i_i {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 0 FirstWrite -1}
		sext_ln164_1 {Type I LastRead 0 FirstWrite -1}
		move_type_4_out {Type O LastRead -1 FirstWrite 1}
		row2_4_out {Type O LastRead -1 FirstWrite 1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_175_39 {
		move_type_5 {Type I LastRead 0 FirstWrite -1}
		colt_1 {Type I LastRead 0 FirstWrite -1}
		mul_ln177_1 {Type I LastRead 0 FirstWrite -1}
		M_e {Type IO LastRead 0 FirstWrite 1}
		mul_ln173_1 {Type I LastRead 0 FirstWrite -1}
		mul_ln174_1 {Type I LastRead 0 FirstWrite -1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_136_110 {
		new_col_3 {Type I LastRead 0 FirstWrite -1}
		mul_ln133 {Type I LastRead 0 FirstWrite -1}
		M_e {Type IO LastRead 1 FirstWrite 3}
		mul_ln134 {Type I LastRead 0 FirstWrite -1}
		mul_ln145 {Type I LastRead 0 FirstWrite -1}
		icmp_ln134 {Type I LastRead 0 FirstWrite -1}
		cmp34_i_i {Type I LastRead 0 FirstWrite -1}}
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_104_1_VITIS_LOOP_93_111 {
		total_rows_1 {Type I LastRead 0 FirstWrite -1}
		mul_ln267 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 2 FirstWrite -1}
		s_3_out {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	k1 { ap_none {  { k1 in_data 0 32 } } }
	k2 { ap_none {  { k2 in_data 0 32 } } }
	 { m_axi {  { m_axi_gmem2_0_AWVALID VALID 1 1 }  { m_axi_gmem2_0_AWREADY READY 0 1 }  { m_axi_gmem2_0_AWADDR ADDR 1 64 }  { m_axi_gmem2_0_AWID ID 1 1 }  { m_axi_gmem2_0_AWLEN SIZE 1 32 }  { m_axi_gmem2_0_AWSIZE BURST 1 3 }  { m_axi_gmem2_0_AWBURST LOCK 1 2 }  { m_axi_gmem2_0_AWLOCK CACHE 1 2 }  { m_axi_gmem2_0_AWCACHE PROT 1 4 }  { m_axi_gmem2_0_AWPROT QOS 1 3 }  { m_axi_gmem2_0_AWQOS REGION 1 4 }  { m_axi_gmem2_0_AWREGION USER 1 4 }  { m_axi_gmem2_0_AWUSER DATA 1 1 }  { m_axi_gmem2_0_WVALID VALID 1 1 }  { m_axi_gmem2_0_WREADY READY 0 1 }  { m_axi_gmem2_0_WDATA FIFONUM 1 32 }  { m_axi_gmem2_0_WSTRB STRB 1 4 }  { m_axi_gmem2_0_WLAST LAST 1 1 }  { m_axi_gmem2_0_WID ID 1 1 }  { m_axi_gmem2_0_WUSER DATA 1 1 }  { m_axi_gmem2_0_ARVALID VALID 1 1 }  { m_axi_gmem2_0_ARREADY READY 0 1 }  { m_axi_gmem2_0_ARADDR ADDR 1 64 }  { m_axi_gmem2_0_ARID ID 1 1 }  { m_axi_gmem2_0_ARLEN SIZE 1 32 }  { m_axi_gmem2_0_ARSIZE BURST 1 3 }  { m_axi_gmem2_0_ARBURST LOCK 1 2 }  { m_axi_gmem2_0_ARLOCK CACHE 1 2 }  { m_axi_gmem2_0_ARCACHE PROT 1 4 }  { m_axi_gmem2_0_ARPROT QOS 1 3 }  { m_axi_gmem2_0_ARQOS REGION 1 4 }  { m_axi_gmem2_0_ARREGION USER 1 4 }  { m_axi_gmem2_0_ARUSER DATA 1 1 }  { m_axi_gmem2_0_RVALID VALID 0 1 }  { m_axi_gmem2_0_RREADY READY 1 1 }  { m_axi_gmem2_0_RDATA FIFONUM 0 32 }  { m_axi_gmem2_0_RLAST LAST 0 1 }  { m_axi_gmem2_0_RID ID 0 1 }  { m_axi_gmem2_0_RFIFONUM LEN 0 9 }  { m_axi_gmem2_0_RUSER DATA 0 1 }  { m_axi_gmem2_0_RRESP RESP 0 2 }  { m_axi_gmem2_0_BVALID VALID 0 1 }  { m_axi_gmem2_0_BREADY READY 1 1 }  { m_axi_gmem2_0_BRESP RESP 0 2 }  { m_axi_gmem2_0_BID ID 0 1 }  { m_axi_gmem2_0_BUSER DATA 0 1 } } }
	debug_dram { ap_none {  { debug_dram in_data 0 64 } } }
	debug_capacity { ap_none {  { debug_capacity in_data 0 32 } } }
	M_e { ap_memory {  { M_e_address0 mem_address 1 17 }  { M_e_ce0 mem_ce 1 1 }  { M_e_we0 mem_we 1 1 }  { M_e_d0 mem_din 1 32 }  { M_e_q0 mem_dout 0 32 }  { M_e_address1 MemPortADDR2 1 17 }  { M_e_ce1 MemPortCE2 1 1 }  { M_e_we1 MemPortWE2 1 1 }  { M_e_d1 MemPortDIN2 1 32 }  { M_e_q1 MemPortDOUT2 0 32 } } }
	M_cols { ap_none {  { M_cols in_data 0 32 } } }
	M_rows { ap_none {  { M_rows in_data 0 32 } } }
	M_t { ap_ovld {  { M_t_i in_data 0 32 }  { M_t_o out_data 1 32 }  { M_t_o_ap_vld out_vld 1 1 } } }
	M_t_capacity { ap_none {  { M_t_capacity in_data 0 32 } } }
}
