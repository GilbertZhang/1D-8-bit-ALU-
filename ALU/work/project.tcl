set projDir "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/planAhead"
set projName "ALU"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/mojo_top_0.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/reset_conditioner_1.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/testcase_2.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/alu_3.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/blink_4.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/alu_3.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/add_6.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/compare_7.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/boolean_8.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/shift_9.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/muldiv_10.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/add_6.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/compare_7.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/boolean_8.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/shift_9.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/muldiv_10.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/reverse_16.v" "D:/Dropbox/Dropbox/Term4/50.002computation structure/1D-8-bit-ALU-/ALU/work/verilog/reverse_16.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "D:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "D:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
