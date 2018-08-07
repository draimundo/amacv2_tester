restart

close_wave_config -force

add_wave_divider Generic
add_wave {{/tb_freq_meas/clock}}
add_wave {{/tb_freq_meas/reset}}


add_wave_divider Extern
add_wave {{/tb_freq_meas/fmcomp/frq_i}}
add_wave {{/tb_freq_meas/fmcomp/ts_cnt_i}}
add_wave {{/tb_freq_meas/fmcomp/hi_n_o}}
add_wave {{/tb_freq_meas/fmcomp/lo_n_o}}
add_wave {{/tb_freq_meas/fmcomp/hi_t_o}}

add_wave_divider Intern
add_wave {{/tb_freq_meas/fmcomp/hi_n}}
add_wave {{/tb_freq_meas/fmcomp/lo_n}}
add_wave {{/tb_freq_meas/fmcomp/ts_cnt}}
add_wave {{/tb_freq_meas/fmcomp/freeze_i}}
add_wave {{/tb_freq_meas/fmcomp/nrst_i}}

set time 0
set period_clk 1000

# Init
add_force {/tb_freq_meas/clock} {1 0ns} "0 [expr ${period_clk}/2]ns" -repeat_every ${period_clk}ns
add_force {/tb_freq_meas/reset} {1 0ns} "0 [expr ${period_clk}]ns" "1 [expr ${period_clk}*4]ns"
add_force {/tb_freq_meas/fmcomp/ts_cnt_i} -radix dec {32 0ns}
add_force {/tb_freq_meas/fmcomp/freeze_i} "0"

run [expr ${period_clk}*10]

set duty_c 0.5
set period_frq [expr $period_clk*8]
set delay [expr $period_clk*0.7]
add_force {/tb_freq_meas/fmcomp/frq_i} "0 [expr ${delay}]ns" "1 [expr ${period_frq}*${duty_c}+${delay}]ns" -repeat_every ${period_frq}ns
run [expr ${period_clk}*1000]

# Frequency sweep
#for {set p 1} {$p<=16} {incr p 1} {
#	set period_frq [expr $period_clk*2**$p]
#	add_force {/tb_freq_meas/fmcomp/frq_i} {1 0ns} "0 [expr ${period_frq}*${duty_c}]ns" -#repeat_every ${period_frq}ns
#	run [expr ${period_frq}]
#}

