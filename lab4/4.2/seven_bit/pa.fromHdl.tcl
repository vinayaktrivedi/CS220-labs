
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name seven_bit -dir "/media/subhamkr/R_SAXENA/4.2/seven_bit/planAhead_run_3" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "seven_bit.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {full_adder.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {check.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {seven_bit.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top seven_bit $srcset
add_files [list {seven_bit.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
