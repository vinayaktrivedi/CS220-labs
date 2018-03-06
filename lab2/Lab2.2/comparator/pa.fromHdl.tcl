
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name comparator -dir "/media/subhamkr/UBUNTU 16_0/CS220/Lab2.2/comparator/planAhead_run_2" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "comparator.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {comparator.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top comparator $srcset
add_files [list {comparator.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
