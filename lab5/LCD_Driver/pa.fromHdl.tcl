
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name LCD_Driver -dir "/users/btech/vinayakt/Desktop/lab5/LCD_Driver/planAhead_run_2" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "lcd_top.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {initialise.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {lcd_top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top lcd_top $srcset
add_files [list {lcd_top.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
