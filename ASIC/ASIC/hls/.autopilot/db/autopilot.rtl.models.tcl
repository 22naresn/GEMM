set SynModuleInfo {
  {SRCNAME load_matrix_from_dram_Pipeline_VITIS_LOOP_49_1_VITIS_LOOP_51_2 MODELNAME load_matrix_from_dram_Pipeline_VITIS_LOOP_49_1_VITIS_LOOP_51_2 RTLNAME fmm_reduce_kernel_load_matrix_from_dram_Pipeline_VITIS_LOOP_49_1_VITIS_LOOP_51_2
    SUBMODULES {
      {MODELNAME fmm_reduce_kernel_flow_control_loop_pipe_sequential_init RTLNAME fmm_reduce_kernel_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME fmm_reduce_kernel_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME load_matrix_from_dram_Pipeline_VITIS_LOOP_56_3_VITIS_LOOP_57_4 MODELNAME load_matrix_from_dram_Pipeline_VITIS_LOOP_56_3_VITIS_LOOP_57_4 RTLNAME fmm_reduce_kernel_load_matrix_from_dram_Pipeline_VITIS_LOOP_56_3_VITIS_LOOP_57_4}
  {SRCNAME load_matrix_from_dram MODELNAME load_matrix_from_dram RTLNAME fmm_reduce_kernel_load_matrix_from_dram
    SUBMODULES {
      {MODELNAME fmm_reduce_kernel_mul_31ns_31ns_62_1_1 RTLNAME fmm_reduce_kernel_mul_31ns_31ns_62_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME fmm_reduce_kernel_mul_32ns_32ns_63_1_1 RTLNAME fmm_reduce_kernel_mul_32ns_32ns_63_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME compute_pp_nn_Pipeline_VITIS_LOOP_104_1 MODELNAME compute_pp_nn_Pipeline_VITIS_LOOP_104_1 RTLNAME fmm_reduce_kernel_compute_pp_nn_Pipeline_VITIS_LOOP_104_1
    SUBMODULES {
      {MODELNAME fmm_reduce_kernel_sparsemux_9_2_32_1_1 RTLNAME fmm_reduce_kernel_sparsemux_9_2_32_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME compute_pp_nn MODELNAME compute_pp_nn RTLNAME fmm_reduce_kernel_compute_pp_nn}
  {SRCNAME compute_greedy_potential_score_Pipeline_VITIS_LOOP_124_1 MODELNAME compute_greedy_potential_score_Pipeline_VITIS_LOOP_124_1 RTLNAME fmm_reduce_kernel_compute_greedy_potential_score_Pipeline_VITIS_LOOP_124_1}
  {SRCNAME compute_greedy_potential_score_Pipeline_VITIS_LOOP_146_1 MODELNAME compute_greedy_potential_score_Pipeline_VITIS_LOOP_146_1 RTLNAME fmm_reduce_kernel_compute_greedy_potential_score_Pipeline_VITIS_LOOP_146_1
    SUBMODULES {
      {MODELNAME fmm_reduce_kernel_sparsemux_9_2_32_1_1_x RTLNAME fmm_reduce_kernel_sparsemux_9_2_32_1_1_x BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
    }
  }
  {SRCNAME compute_greedy_potential_score_Pipeline_VITIS_LOOP_152_2 MODELNAME compute_greedy_potential_score_Pipeline_VITIS_LOOP_152_2 RTLNAME fmm_reduce_kernel_compute_greedy_potential_score_Pipeline_VITIS_LOOP_152_2}
  {SRCNAME compute_greedy_potential_score_Pipeline_VITIS_LOOP_163_3 MODELNAME compute_greedy_potential_score_Pipeline_VITIS_LOOP_163_3 RTLNAME fmm_reduce_kernel_compute_greedy_potential_score_Pipeline_VITIS_LOOP_163_3}
  {SRCNAME compute_greedy_potential_score MODELNAME compute_greedy_potential_score RTLNAME fmm_reduce_kernel_compute_greedy_potential_score
    SUBMODULES {
      {MODELNAME fmm_reduce_kernel_mul_32s_32s_32_1_1 RTLNAME fmm_reduce_kernel_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME find_best_move MODELNAME find_best_move RTLNAME fmm_reduce_kernel_find_best_move}
  {SRCNAME greedy_potential_reduce_Pipeline_VITIS_LOOP_124_1 MODELNAME greedy_potential_reduce_Pipeline_VITIS_LOOP_124_1 RTLNAME fmm_reduce_kernel_greedy_potential_reduce_Pipeline_VITIS_LOOP_124_1}
  {SRCNAME greedy_potential_reduce MODELNAME greedy_potential_reduce RTLNAME fmm_reduce_kernel_greedy_potential_reduce}
  {SRCNAME store_matrix_to_dram_Pipeline_VITIS_LOOP_68_1_VITIS_LOOP_69_2 MODELNAME store_matrix_to_dram_Pipeline_VITIS_LOOP_68_1_VITIS_LOOP_69_2 RTLNAME fmm_reduce_kernel_store_matrix_to_dram_Pipeline_VITIS_LOOP_68_1_VITIS_LOOP_69_2}
  {SRCNAME store_matrix_to_dram MODELNAME store_matrix_to_dram RTLNAME fmm_reduce_kernel_store_matrix_to_dram}
  {SRCNAME fmm_reduce_kernel MODELNAME fmm_reduce_kernel RTLNAME fmm_reduce_kernel IS_TOP 1
    SUBMODULES {
      {MODELNAME fmm_reduce_kernel_M_e_0_RAM_1P_LUTRAM_1R1W RTLNAME fmm_reduce_kernel_M_e_0_RAM_1P_LUTRAM_1R1W BINDTYPE storage TYPE ram_1p IMPL lutram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME fmm_reduce_kernel_gmem_m_axi RTLNAME fmm_reduce_kernel_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME fmm_reduce_kernel_control_s_axi RTLNAME fmm_reduce_kernel_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME fmm_reduce_kernel_control_r_s_axi RTLNAME fmm_reduce_kernel_control_r_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
