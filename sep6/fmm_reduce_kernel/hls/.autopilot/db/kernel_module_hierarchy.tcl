set ModuleHierarchy {[{
"Name" : "fmm_reduce_kernel", "RefName" : "fmm_reduce_kernel","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "entry_proc_U0", "RefName" : "entry_proc","ID" : "1","Type" : "sequential"},
	{"Name" : "Block_entry_proc_1_U0", "RefName" : "Block_entry_proc_1","ID" : "2","Type" : "sequential"},
	{"Name" : "Block_entry_proc_U0", "RefName" : "Block_entry_proc","ID" : "3","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_load_matrix_from_dram_safe_fu_174", "RefName" : "load_matrix_from_dram_safe","ID" : "4","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_load_matrix_from_dram_safe_Pipeline_VITIS_LOOP_50_1_VITIS_LOOP_52_2_fu_72", "RefName" : "load_matrix_from_dram_safe_Pipeline_VITIS_LOOP_50_1_VITIS_LOOP_52_2","ID" : "5","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_50_1_VITIS_LOOP_52_2","RefName" : "VITIS_LOOP_50_1_VITIS_LOOP_52_2","ID" : "6","Type" : "pipeline"},]},
			{"Name" : "grp_load_matrix_from_dram_safe_Pipeline_VITIS_LOOP_59_3_VITIS_LOOP_60_4_fu_78", "RefName" : "load_matrix_from_dram_safe_Pipeline_VITIS_LOOP_59_3_VITIS_LOOP_60_4","ID" : "7","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_59_3_VITIS_LOOP_60_4","RefName" : "VITIS_LOOP_59_3_VITIS_LOOP_60_4","ID" : "8","Type" : "pipeline"},]},]},
		{"Name" : "grp_greedy_potential_reduce_with_debug_fu_198", "RefName" : "greedy_potential_reduce_with_debug","ID" : "9","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_104_1_VITIS_LOOP_93_1_fu_895", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_104_1_VITIS_LOOP_93_1","ID" : "10","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_104_1_VITIS_LOOP_93_1","RefName" : "VITIS_LOOP_104_1_VITIS_LOOP_93_1","ID" : "11","Type" : "pipeline"},]},],
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_260_1","RefName" : "VITIS_LOOP_260_1","ID" : "12","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_136_110_fu_1043", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_136_110","ID" : "13","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_136_1","RefName" : "VITIS_LOOP_136_1","ID" : "14","Type" : "pipeline"},]},
			{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_104_1_VITIS_LOOP_93_111_fu_1055", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_104_1_VITIS_LOOP_93_111","ID" : "15","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_104_1_VITIS_LOOP_93_1","RefName" : "VITIS_LOOP_104_1_VITIS_LOOP_93_1","ID" : "16","Type" : "pipeline"},]},],
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_224_1","RefName" : "VITIS_LOOP_224_1","ID" : "17","Type" : "no",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_225_2","RefName" : "VITIS_LOOP_225_2","ID" : "18","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_116_1_fu_904", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_116_1","ID" : "19","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_116_1","RefName" : "VITIS_LOOP_116_1","ID" : "20","Type" : "pipeline"},]},
					{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_116_13_fu_915", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_116_13","ID" : "21","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_116_1","RefName" : "VITIS_LOOP_116_1","ID" : "22","Type" : "pipeline"},]},
					{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_136_1_fu_925", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_136_1","ID" : "23","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_136_1","RefName" : "VITIS_LOOP_136_1","ID" : "24","Type" : "pipeline"},]},
					{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_158_1_fu_948", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_158_1","ID" : "25","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_158_1","RefName" : "VITIS_LOOP_158_1","ID" : "26","Type" : "pipeline"},]},
					{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_164_2_fu_957", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_164_2","ID" : "27","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_164_2","RefName" : "VITIS_LOOP_164_2","ID" : "28","Type" : "pipeline"},]},
					{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_175_3_fu_968", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_175_3","ID" : "29","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_175_3","RefName" : "VITIS_LOOP_175_3","ID" : "30","Type" : "pipeline"},]},
					{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_116_14_fu_979", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_116_14","ID" : "31","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_116_1","RefName" : "VITIS_LOOP_116_1","ID" : "32","Type" : "pipeline"},]},
					{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_136_15_fu_989", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_136_15","ID" : "33","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_136_1","RefName" : "VITIS_LOOP_136_1","ID" : "34","Type" : "pipeline"},]},
					{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_158_17_fu_1012", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_158_17","ID" : "35","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_158_1","RefName" : "VITIS_LOOP_158_1","ID" : "36","Type" : "pipeline"},]},
					{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_164_28_fu_1021", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_164_28","ID" : "37","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_164_2","RefName" : "VITIS_LOOP_164_2","ID" : "38","Type" : "pipeline"},]},
					{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_175_39_fu_1032", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_175_39","ID" : "39","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_175_3","RefName" : "VITIS_LOOP_175_3","ID" : "40","Type" : "pipeline"},]},],
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_192_1","RefName" : "VITIS_LOOP_192_1","ID" : "41","Type" : "no",
						"SubInsts" : [
						{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_193_2_VITIS_LOOP_116_1_fu_935", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_193_2_VITIS_LOOP_116_1","ID" : "42","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_193_2_VITIS_LOOP_116_1","RefName" : "VITIS_LOOP_193_2_VITIS_LOOP_116_1","ID" : "43","Type" : "pipeline"},]},]},
					{"Name" : "VITIS_LOOP_192_1","RefName" : "VITIS_LOOP_192_1","ID" : "44","Type" : "no",
						"SubInsts" : [
						{"Name" : "grp_greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_193_2_VITIS_LOOP_116_16_fu_999", "RefName" : "greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_193_2_VITIS_LOOP_116_16","ID" : "45","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_193_2_VITIS_LOOP_116_1","RefName" : "VITIS_LOOP_193_2_VITIS_LOOP_116_1","ID" : "46","Type" : "pipeline"},]},]},]},]},]},]},
		{"Name" : "grp_store_matrix_to_dram_safe_fu_218", "RefName" : "store_matrix_to_dram_safe","ID" : "47","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_store_matrix_to_dram_safe_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_78_2_fu_40", "RefName" : "store_matrix_to_dram_safe_Pipeline_VITIS_LOOP_77_1_VITIS_LOOP_78_2","ID" : "48","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_77_1_VITIS_LOOP_78_2","RefName" : "VITIS_LOOP_77_1_VITIS_LOOP_78_2","ID" : "49","Type" : "pipeline"},]},]},]},]
}]}