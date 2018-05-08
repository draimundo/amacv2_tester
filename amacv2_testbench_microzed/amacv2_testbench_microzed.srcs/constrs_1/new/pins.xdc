#
# Fun LEDs
set_property IOSTANDARD LVCMOS25 [get_ports LED0]
set_property IOSTANDARD LVCMOS25 [get_ports LED1]
set_property IOSTANDARD LVCMOS25 [get_ports LED2]
set_property IOSTANDARD LVCMOS25 [get_ports LED3]

#
# For I2C IP Core testing
set_property PULLUP true [get_ports I2C_scl_io]
set_property PULLUP true [get_ports I2C_sda_io]
set_property IOSTANDARD LVCMOS25 [get_ports I2C_scl_io]
set_property IOSTANDARD LVCMOS25 [get_ports I2C_sda_io]


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
set_property IOSTANDARD LVCMOS25 [get_ports HVOSC0]
set_property IOSTANDARD LVCMOS25 [get_ports HVOSC1]
set_property IOSTANDARD LVCMOS25 [get_ports HVOSC2]
set_property IOSTANDARD LVCMOS25 [get_ports HVOSC3]
set_property IOSTANDARD LVCMOS25 [get_ports CLKOUT]

#
# Testboard Control

# SPI
set_property IOSTANDARD LVCMOS25 [get_ports SCLK]
set_property IOSTANDARD LVCMOS25 [get_ports SDI]
set_property IOSTANDARD LVCMOS25 [get_ports SDO]
set_property IOSTANDARD LVCMOS25 [get_ports DPOT_CS0]
set_property IOSTANDARD LVCMOS25 [get_ports DPOT_CS1]
set_property IOSTANDARD LVCMOS25 [get_ports DPOT_CS2]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_CS0]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_CS1]
set_property IOSTANDARD LVCMOS25 [get_ports ADC_CS0]
set_property IOSTANDARD LVCMOS25 [get_ports ADC_CS1]
set_property IOSTANDARD LVCMOS25 [get_ports ADC_CS2]

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
