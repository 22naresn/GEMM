set moduleName entry_proc
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 28
set C_modelName {entry_proc}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ A_dram int 64 regular  }
	{ A_dram_c int 64 regular {fifo 1}  }
	{ t_capacity int 32 regular  }
	{ t_capacity_c int 32 regular {fifo 1}  }
	{ k1 int 32 regular  }
	{ k1_c int 32 regular {fifo 1}  }
	{ k2 int 32 regular  }
	{ k2_c int 32 regular {fifo 1}  }
	{ debug_dram int 64 regular  }
	{ debug_dram_c int 64 regular {fifo 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "A_dram", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "A_dram_c", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "t_capacity", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "t_capacity_c", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "k1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k1_c", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "k2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k2_c", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "debug_dram", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "debug_dram_c", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 37
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A_dram sc_in sc_lv 64 signal 0 } 
	{ A_dram_c_din sc_out sc_lv 64 signal 1 } 
	{ A_dram_c_full_n sc_in sc_logic 1 signal 1 } 
	{ A_dram_c_write sc_out sc_logic 1 signal 1 } 
	{ A_dram_c_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ A_dram_c_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ t_capacity sc_in sc_lv 32 signal 2 } 
	{ t_capacity_c_din sc_out sc_lv 32 signal 3 } 
	{ t_capacity_c_full_n sc_in sc_logic 1 signal 3 } 
	{ t_capacity_c_write sc_out sc_logic 1 signal 3 } 
	{ t_capacity_c_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ t_capacity_c_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ k1 sc_in sc_lv 32 signal 4 } 
	{ k1_c_din sc_out sc_lv 32 signal 5 } 
	{ k1_c_full_n sc_in sc_logic 1 signal 5 } 
	{ k1_c_write sc_out sc_logic 1 signal 5 } 
	{ k1_c_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ k1_c_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ k2 sc_in sc_lv 32 signal 6 } 
	{ k2_c_din sc_out sc_lv 32 signal 7 } 
	{ k2_c_full_n sc_in sc_logic 1 signal 7 } 
	{ k2_c_write sc_out sc_logic 1 signal 7 } 
	{ k2_c_num_data_valid sc_in sc_lv 3 signal 7 } 
	{ k2_c_fifo_cap sc_in sc_lv 3 signal 7 } 
	{ debug_dram sc_in sc_lv 64 signal 8 } 
	{ debug_dram_c_din sc_out sc_lv 64 signal 9 } 
	{ debug_dram_c_full_n sc_in sc_logic 1 signal 9 } 
	{ debug_dram_c_write sc_out sc_logic 1 signal 9 } 
	{ debug_dram_c_num_data_valid sc_in sc_lv 3 signal 9 } 
	{ debug_dram_c_fifo_cap sc_in sc_lv 3 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A_dram", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "A_dram", "role": "default" }} , 
 	{ "name": "A_dram_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "A_dram_c", "role": "din" }} , 
 	{ "name": "A_dram_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_dram_c", "role": "full_n" }} , 
 	{ "name": "A_dram_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A_dram_c", "role": "write" }} , 
 	{ "name": "A_dram_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "A_dram_c", "role": "num_data_valid" }} , 
 	{ "name": "A_dram_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "A_dram_c", "role": "fifo_cap" }} , 
 	{ "name": "t_capacity", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "t_capacity", "role": "default" }} , 
 	{ "name": "t_capacity_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "t_capacity_c", "role": "din" }} , 
 	{ "name": "t_capacity_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "t_capacity_c", "role": "full_n" }} , 
 	{ "name": "t_capacity_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "t_capacity_c", "role": "write" }} , 
 	{ "name": "t_capacity_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "t_capacity_c", "role": "num_data_valid" }} , 
 	{ "name": "t_capacity_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "t_capacity_c", "role": "fifo_cap" }} , 
 	{ "name": "k1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k1", "role": "default" }} , 
 	{ "name": "k1_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k1_c", "role": "din" }} , 
 	{ "name": "k1_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k1_c", "role": "full_n" }} , 
 	{ "name": "k1_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k1_c", "role": "write" }} , 
 	{ "name": "k1_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "k1_c", "role": "num_data_valid" }} , 
 	{ "name": "k1_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "k1_c", "role": "fifo_cap" }} , 
 	{ "name": "k2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k2", "role": "default" }} , 
 	{ "name": "k2_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k2_c", "role": "din" }} , 
 	{ "name": "k2_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k2_c", "role": "full_n" }} , 
 	{ "name": "k2_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k2_c", "role": "write" }} , 
 	{ "name": "k2_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "k2_c", "role": "num_data_valid" }} , 
 	{ "name": "k2_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "k2_c", "role": "fifo_cap" }} , 
 	{ "name": "debug_dram", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "debug_dram", "role": "default" }} , 
 	{ "name": "debug_dram_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "debug_dram_c", "role": "din" }} , 
 	{ "name": "debug_dram_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "debug_dram_c", "role": "full_n" }} , 
 	{ "name": "debug_dram_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "debug_dram_c", "role": "write" }} , 
 	{ "name": "debug_dram_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "debug_dram_c", "role": "num_data_valid" }} , 
 	{ "name": "debug_dram_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "debug_dram_c", "role": "fifo_cap" }}  ]}

set ArgLastReadFirstWriteLatency {
	entry_proc {
		A_dram {Type I LastRead 0 FirstWrite -1}
		A_dram_c {Type O LastRead -1 FirstWrite 0}
		t_capacity {Type I LastRead 0 FirstWrite -1}
		t_capacity_c {Type O LastRead -1 FirstWrite 0}
		k1 {Type I LastRead 0 FirstWrite -1}
		k1_c {Type O LastRead -1 FirstWrite 0}
		k2 {Type I LastRead 0 FirstWrite -1}
		k2_c {Type O LastRead -1 FirstWrite 0}
		debug_dram {Type I LastRead 0 FirstWrite -1}
		debug_dram_c {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	A_dram { ap_none {  { A_dram in_data 0 64 } } }
	A_dram_c { ap_fifo {  { A_dram_c_din fifo_data_in 1 64 }  { A_dram_c_full_n fifo_status 0 1 }  { A_dram_c_write fifo_port_we 1 1 }  { A_dram_c_num_data_valid fifo_status_num_data_valid 0 3 }  { A_dram_c_fifo_cap fifo_update 0 3 } } }
	t_capacity { ap_none {  { t_capacity in_data 0 32 } } }
	t_capacity_c { ap_fifo {  { t_capacity_c_din fifo_data_in 1 32 }  { t_capacity_c_full_n fifo_status 0 1 }  { t_capacity_c_write fifo_port_we 1 1 }  { t_capacity_c_num_data_valid fifo_status_num_data_valid 0 3 }  { t_capacity_c_fifo_cap fifo_update 0 3 } } }
	k1 { ap_none {  { k1 in_data 0 32 } } }
	k1_c { ap_fifo {  { k1_c_din fifo_data_in 1 32 }  { k1_c_full_n fifo_status 0 1 }  { k1_c_write fifo_port_we 1 1 }  { k1_c_num_data_valid fifo_status_num_data_valid 0 3 }  { k1_c_fifo_cap fifo_update 0 3 } } }
	k2 { ap_none {  { k2 in_data 0 32 } } }
	k2_c { ap_fifo {  { k2_c_din fifo_data_in 1 32 }  { k2_c_full_n fifo_status 0 1 }  { k2_c_write fifo_port_we 1 1 }  { k2_c_num_data_valid fifo_status_num_data_valid 0 3 }  { k2_c_fifo_cap fifo_update 0 3 } } }
	debug_dram { ap_none {  { debug_dram in_data 0 64 } } }
	debug_dram_c { ap_fifo {  { debug_dram_c_din fifo_data_in 1 64 }  { debug_dram_c_full_n fifo_status 0 1 }  { debug_dram_c_write fifo_port_we 1 1 }  { debug_dram_c_num_data_valid fifo_status_num_data_valid 0 3 }  { debug_dram_c_fifo_cap fifo_update 0 3 } } }
}
