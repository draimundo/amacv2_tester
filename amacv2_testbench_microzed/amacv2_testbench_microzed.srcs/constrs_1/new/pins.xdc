#
# Fun LEDs
set_property IOSTANDARD LVCMOS25 [get_ports LED0]
set_property IOSTANDARD LVCMOS25 [get_ports LED1]
set_property IOSTANDARD LVCMOS25 [get_ports LED2]
set_property IOSTANDARD LVCMOS25 [get_ports LED3]

#
# AMACv2 Digital IO
set_property IOSTANDARD LVCMOS25 [get_ports RO_PG_O]
set_property IOSTANDARD LVCMOS25 [get_ports OFout]
set_property IOSTANDARD LVCMOS25 [get_ports GPO]
set_property IOSTANDARD LVCMOS25 [get_ports RESETB]
set_property IOSTANDARD LVCMOS25 [get_ports DCDCen]
set_property IOSTANDARD LVCMOS25 [get_ports {ID[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ID[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ID[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ID[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ID[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports LDx0en]
set_property IOSTANDARD LVCMOS25 [get_ports LDx1en]
set_property IOSTANDARD LVCMOS25 [get_ports LDx2en]
set_property IOSTANDARD LVCMOS25 [get_ports LDy0en]
set_property IOSTANDARD LVCMOS25 [get_ports LDy1en]
set_property IOSTANDARD LVCMOS25 [get_ports LDy2en]
set_property IOSTANDARD LVCMOS25 [get_ports SSSHx]
set_property IOSTANDARD LVCMOS25 [get_ports SSSHy]
set_property IOSTANDARD LVCMOS25 [get_ports HrstBx]
set_property IOSTANDARD LVCMOS25 [get_ports HrstBy]
set_property IOSTANDARD LVCMOS25 [get_ports OFin]
set_property IOSTANDARD LVCMOS25 [get_ports DCDCadj]
set_property IOSTANDARD LVCMOS25 [get_ports GPI]
set_property IOSTANDARD LVCMOS25 [get_ports LAM]
set_property IOSTANDARD LVCMOS25 [get_ports PGOOD]
set_property IOSTANDARD LVDS_25 [get_ports CMD_IN_P]
set_property DIFF_TERM TRUE [get_ports CMD_IN_P]
set_property IOSTANDARD LVDS_25 [get_ports CMD_OUT_P]
set_property DIFF_TERM TRUE [get_ports CMD_OUT_P]
set_property DIFF_TERM TRUE [get_ports CMD_OUT_N]
set_property IOSTANDARD LVCMOS25 [get_ports HVOSC0]
set_property IOSTANDARD LVCMOS25 [get_ports HVOSC1]
set_property IOSTANDARD LVCMOS25 [get_ports HVOSC2]
set_property IOSTANDARD LVCMOS25 [get_ports HVOSC3]
set_property IOSTANDARD LVCMOS25 [get_ports CLKOUT]

#
# Testboard Control

# SPI

# DPOT_CS0 - spi_rtl_ss_io[0]
# DPOT_CS1 - spi_rtl_ss_io[1]
# DPOT_CS2 - spi_rtl_ss_io[2]
# DAC_CS0 - spi_rtl_ss_io[3]
# DAC_CS1 - spi_rtl_ss_io[4]
# ADC_CS0 - spi_rtl_ss_io[5]
# ADC_CS1 - spi_rtl_ss_io[6]
# ADC_CS2 - spi_rtl_ss_io[7]
set_property IOSTANDARD LVCMOS25 [get_ports spi_rtl_sck_io]
set_property IOSTANDARD LVCMOS25 [get_ports spi_rtl_io0_io]
set_property IOSTANDARD LVCMOS25 [get_ports spi_rtl_io1_io]
set_property IOSTANDARD LVCMOS25 [get_ports {spi_rtl_ss_io[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {spi_rtl_ss_io[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {spi_rtl_ss_io[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {spi_rtl_ss_io[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {spi_rtl_ss_io[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {spi_rtl_ss_io[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {spi_rtl_ss_io[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {spi_rtl_ss_io[7]}]

# Mux control
set_property IOSTANDARD LVCMOS25 [get_ports MPM_MUX_EN]
set_property IOSTANDARD LVCMOS25 [get_ports HVSW_MUX_EN]
set_property IOSTANDARD LVCMOS25 [get_ports {MPM_MUX[*]}]

# ADC read
set_property IOSTANDARD LVCMOS25 [get_ports ADC_CNV]

# LDO control
set_property IOSTANDARD LVCMOS25 [get_ports LV_EN_VP5]
set_property IOSTANDARD LVCMOS25 [get_ports LV_EN_VN5]
set_property IOSTANDARD LVCMOS25 [get_ports LV_EN_2V5]
set_property IOSTANDARD LVCMOS25 [get_ports LV_EN_AVEE]
set_property IOSTANDARD LVCMOS25 [get_ports LV_EN_AVDD5]
set_property IOSTANDARD LVCMOS25 [get_ports LV_EN_AVCC]
set_property IOSTANDARD LVCMOS25 [get_ports LD_EN_DVDD]


connect_debug_port u_ila_0/probe0 [get_nets [list {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[0]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[1]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[2]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[3]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[4]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[5]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[6]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[7]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[8]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[9]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[10]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[11]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[12]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[13]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[14]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[15]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[16]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[17]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[18]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[19]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[20]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[21]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[22]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[23]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[24]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[25]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[26]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[27]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[28]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_reg[29]}]]
connect_debug_port u_ila_0/probe4 [get_nets [list TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt]]

connect_debug_port u_ila_0/probe5 [get_nets [list {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[0]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[1]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[2]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[3]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[4]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[5]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[6]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[7]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[8]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[9]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[10]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[11]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[12]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[13]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[14]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[15]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[16]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[17]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[18]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[19]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[20]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[21]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[22]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[23]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[24]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[25]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[26]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[27]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[28]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[29]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[30]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg0[31]}]]
connect_debug_port u_ila_0/probe6 [get_nets [list {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[0]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[1]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[2]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[3]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[4]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[5]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[6]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[7]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[8]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[9]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[10]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[11]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[12]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[13]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[14]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[15]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[16]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[17]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[18]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[19]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[20]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[21]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[22]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[23]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[24]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[25]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[26]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[27]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[28]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[29]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[30]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg1[31]}]]
connect_debug_port u_ila_0/probe7 [get_nets [list {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[0]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[1]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[2]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[3]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[4]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[5]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[6]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[7]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[8]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[9]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[10]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[11]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[12]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[13]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[14]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[15]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[16]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[17]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[18]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[19]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[20]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[21]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[22]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[23]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[24]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[25]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[26]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[27]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[28]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[29]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/slv_reg2[30]}]]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list TopLevel_i/processing_system7_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 15 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[0]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[1]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[2]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[3]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[4]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[5]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[6]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[7]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[8]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[9]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[10]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[11]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[12]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[13]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 30 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[0]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[1]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[2]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[3]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[4]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[5]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[6]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[7]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[8]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[9]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[10]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[11]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[12]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[13]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[14]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[15]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[16]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[17]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[18]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[19]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[20]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[21]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[22]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[23]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[24]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[25]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[26]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[27]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[28]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt[29]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 31 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[0]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[1]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[2]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[3]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[4]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[5]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[6]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[7]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[8]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[9]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[10]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[11]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[12]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[13]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[14]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[15]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[16]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[17]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[18]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[19]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[20]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[21]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[22]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[23]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[24]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[25]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[26]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[27]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[28]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[29]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt[30]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 15 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[0]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[1]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[2]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[3]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[4]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[5]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[6]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[7]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[8]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[9]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[10]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[11]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[12]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[13]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/lo_cnt[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 30 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[0]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[1]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[2]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[3]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[4]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[5]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[6]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[7]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[8]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[9]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[10]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[11]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[12]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[13]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[14]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[15]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[16]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[17]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[18]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[19]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[20]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[21]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[22]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[23]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[24]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[25]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[26]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[27]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[28]} {TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/ts_cnt_b[29]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/frq0_i]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
