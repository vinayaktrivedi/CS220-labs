
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name led_blink -dir "/users/btech/subhamkr/CS220/led_blink/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "led_blink.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {led_blink.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top led_blink $srcset
add_files [list {led_blink.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
