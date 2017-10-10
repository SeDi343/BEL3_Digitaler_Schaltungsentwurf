vsim -t ns -novopt -lib work work.tb_adder
view *
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_adder/data0_i
add wave -noupdate -format Logic /tb_adder/data1_i
add wave -noupdate -format Logic /tb_adder/sum_o
add wave -noupdate -format Logic /tb_adder/cy_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
run 300 ns