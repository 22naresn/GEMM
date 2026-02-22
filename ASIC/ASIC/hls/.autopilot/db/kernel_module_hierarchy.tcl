set ModuleHierarchy {[{
"Name" : "fmm_reduce_kernel", "RefName" : "fmm_reduce_kernel","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_load_matrix_from_dram_fu_104", "RefName" : "load_matrix_from_dram","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_load_matrix_from_dram_Pipeline_VITIS_LOOP_49_1_VITIS_LOOP_51_2_fu_68", "RefName" : "load_matrix_from_dram_Pipeline_VITIS_LOOP_49_1_VITIS_LOOP_51_2","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_49_1_VITIS_LOOP_51_2","RefName" : "VITIS_LOOP_49_1_VITIS_LOOP_51_2","ID" : "3","Type" : "pipeline"},]},
		{"Name" : "grp_load_matrix_from_dram_Pipeline_VITIS_LOOP_56_3_VITIS_LOOP_57_4_fu_80", "RefName" : "load_matrix_from_dram_Pipeline_VITIS_LOOP_56_3_VITIS_LOOP_57_4","ID" : "4","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_56_3_VITIS_LOOP_57_4","RefName" : "VITIS_LOOP_56_3_VITIS_LOOP_57_4","ID" : "5","Type" : "pipeline"},]},]},
	{"Name" : "grp_greedy_potential_reduce_fu_132", "RefName" : "greedy_potential_reduce","ID" : "6","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_232_1","RefName" : "VITIS_LOOP_232_1","ID" : "7","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_find_best_move_fu_202", "RefName" : "find_best_move","ID" : "8","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_212_1","RefName" : "VITIS_LOOP_212_1","ID" : "9","Type" : "no",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_213_2","RefName" : "VITIS_LOOP_213_2","ID" : "10","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_compute_pp_nn_fu_272", "RefName" : "compute_pp_nn","ID" : "11","Type" : "sequential",
							"SubInsts" : [
							{"Name" : "grp_compute_pp_nn_Pipeline_VITIS_LOOP_104_1_fu_64", "RefName" : "compute_pp_nn_Pipeline_VITIS_LOOP_104_1","ID" : "12","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_104_1","RefName" : "VITIS_LOOP_104_1","ID" : "13","Type" : "pipeline"},]},]},
					{"Name" : "grp_compute_greedy_potential_score_fu_288", "RefName" : "compute_greedy_potential_score","ID" : "14","Type" : "sequential",
							"SubInsts" : [
							{"Name" : "grp_compute_pp_nn_fu_399", "RefName" : "compute_pp_nn","ID" : "15","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_compute_pp_nn_Pipeline_VITIS_LOOP_104_1_fu_64", "RefName" : "compute_pp_nn_Pipeline_VITIS_LOOP_104_1","ID" : "16","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "VITIS_LOOP_104_1","RefName" : "VITIS_LOOP_104_1","ID" : "17","Type" : "pipeline"},]},]},
							{"Name" : "grp_compute_greedy_potential_score_Pipeline_VITIS_LOOP_124_1_fu_417", "RefName" : "compute_greedy_potential_score_Pipeline_VITIS_LOOP_124_1","ID" : "18","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_124_1","RefName" : "VITIS_LOOP_124_1","ID" : "19","Type" : "pipeline"},]},
							{"Name" : "grp_compute_greedy_potential_score_Pipeline_VITIS_LOOP_146_1_fu_435", "RefName" : "compute_greedy_potential_score_Pipeline_VITIS_LOOP_146_1","ID" : "20","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_146_1","RefName" : "VITIS_LOOP_146_1","ID" : "21","Type" : "pipeline"},]},
							{"Name" : "grp_compute_greedy_potential_score_Pipeline_VITIS_LOOP_152_2_fu_451", "RefName" : "compute_greedy_potential_score_Pipeline_VITIS_LOOP_152_2","ID" : "22","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_152_2","RefName" : "VITIS_LOOP_152_2","ID" : "23","Type" : "pipeline"},]},
							{"Name" : "grp_compute_greedy_potential_score_Pipeline_VITIS_LOOP_163_3_fu_469", "RefName" : "compute_greedy_potential_score_Pipeline_VITIS_LOOP_163_3","ID" : "24","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_163_3","RefName" : "VITIS_LOOP_163_3","ID" : "25","Type" : "pipeline"},]},],
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_180_1","RefName" : "VITIS_LOOP_180_1","ID" : "26","Type" : "no",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_181_2","RefName" : "VITIS_LOOP_181_2","ID" : "27","Type" : "no"},]},]},]},]},]},
		{"Name" : "grp_greedy_potential_reduce_Pipeline_VITIS_LOOP_124_1_fu_224", "RefName" : "greedy_potential_reduce_Pipeline_VITIS_LOOP_124_1","ID" : "28","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_124_1","RefName" : "VITIS_LOOP_124_1","ID" : "29","Type" : "pipeline"},]},]},]},
	{"Name" : "grp_store_matrix_to_dram_fu_156", "RefName" : "store_matrix_to_dram","ID" : "30","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_store_matrix_to_dram_Pipeline_VITIS_LOOP_68_1_VITIS_LOOP_69_2_fu_28", "RefName" : "store_matrix_to_dram_Pipeline_VITIS_LOOP_68_1_VITIS_LOOP_69_2","ID" : "31","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_68_1_VITIS_LOOP_69_2","RefName" : "VITIS_LOOP_68_1_VITIS_LOOP_69_2","ID" : "32","Type" : "pipeline"},]},]},]
}]}