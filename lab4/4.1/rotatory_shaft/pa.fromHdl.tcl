
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name rotatory_shaft -dir "/home/vinayak/Desktop/CS220/4.1/rotatory_shaft/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "rotatory_shaft.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {check.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {rotatory_shaft.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top rotatory_shaft $srcset
add_files [list {rotatory_shaft.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
