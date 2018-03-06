
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name ripple_led -dir "/users/btech/subhamkr/lab3.2/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "ripple_led.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ripple_led.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top ripple_led $srcset
add_files [list {ripple_led.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
