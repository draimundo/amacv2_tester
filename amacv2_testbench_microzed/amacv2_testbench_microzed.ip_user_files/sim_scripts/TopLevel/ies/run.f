-makelib ies_lib/xil_defaultlib -sv \
  "/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/axi_protocol_checker_v2_0_1 -sv \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/3b24/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/axi_vip_v1_1_1 -sv \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/a16a/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_3 -sv \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/1313/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/TopLevel/ip/TopLevel_processing_system7_0_0/sim/TopLevel_processing_system7_0_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_12 \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/TopLevel/ip/TopLevel_rst_ps7_0_100M_0/sim/TopLevel_rst_ps7_0_100M_0.vhd" \
  "../../../bd/TopLevel/sim/TopLevel.vhd" \
  "../../../bd/TopLevel/ipshared/4fcb/hdl/microzed_fmc_led_controller_v1_0_S00_AXI.vhd" \
  "../../../bd/TopLevel/ipshared/4fcb/hdl/microzed_fmc_led_controller_v1_0.vhd" \
  "../../../bd/TopLevel/ip/TopLevel_microzed_fmc_led_controller_0_2/sim/TopLevel_microzed_fmc_led_controller_0_2.vhd" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_15 \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/3ed1/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/5c35/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_14 \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/9909/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_crossbar_v2_1_16 \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/c631/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/TopLevel/ip/TopLevel_xbar_0/sim/TopLevel_xbar_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/TopLevel/ipshared/e151/hdl/amacv2_dummy_testbench_v1_0_S00_AXI.vhd" \
  "../../../bd/TopLevel/ipshared/e151/hdl/amacv2_dummy_testbench_v1_0.vhd" \
  "../../../bd/TopLevel/ip/TopLevel_amacv2_dummy_testbench_0_0/sim/TopLevel_amacv2_dummy_testbench_0_0.vhd" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_15 \
  "../../../../amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ipshared/ff69/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/TopLevel/ip/TopLevel_auto_pc_0/sim/TopLevel_auto_pc_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

