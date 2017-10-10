vsim -t ns -novopt -lib work work.tb_vectorgates
view *
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_vectorgates/a_i
add wave -noupdate -format Logic /tb_vectorgates/b_i
add wave -noupdate -format Logic /tb_vectorgates/c_i
add wave -noupdate -format Logic /tb_vectorgates/d_i
add wave -noupdate -format Logic /tb_vectorgates/d1_o
add wave -noupdate -format Logic /tb_vectorgates/d2_o
add wave -noupdate -format Logic /tb_vectorgates/e_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {1 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
run 3000 ns