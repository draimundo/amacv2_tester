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
set_property port_width 1 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/frq0_i]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/hi_cnt]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list TopLevel_i/freq_meas_0/U0/freq_meas_v1_0_S00_AXI_inst/freq_meas_inst_0/t_cnt]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
