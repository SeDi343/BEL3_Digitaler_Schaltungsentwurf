vsim -t ns -novopt -lib work work.tb_d_flipflop
view *
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_d_flipflop/data_i
add wave -noupdate -format Logic /tb_d_flipflop/clk_i
add wave -noupdate -format Logic /tb_d_flipflop/reset_i
add wave -noupdate -format Logic /tb_d_flipflop/qout_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
run 300 ns