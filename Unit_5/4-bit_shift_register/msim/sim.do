vsim -t ns -novopt -lib work work.tb_shifter
view *
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_shifter/data_i
add wave -noupdate -format Logic /tb_shifter/data_o
add wave -noupdate -format Logic /tb_shifter/clk_i
add wave -noupdate -format Logic /tb_shifter/reset_i
add wave -noupdate -format Logic /tb_shifter/sh_i
add wave -noupdate -format Logic /tb_shifter/en_i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
run 300 ns