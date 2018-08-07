action = "simulation"
sim_tool = "vivado_sim"
sim_top="tb_freq_meas"

files = ["tb_freq_meas.vhd",]

modules = {
    "local" : ["../hdl" ],
}
