
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name finite_machine -dir "/home/vinayak/Desktop/CS220/all_labs/practice_labs/FSM/finite_machine/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "finite.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {finite.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top finite $srcset
add_files [list {finite.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
