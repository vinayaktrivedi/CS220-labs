
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name full_ader_schematic -dir "/media/cse/UBUNTU 16_0/CS220/Lab_1.2/full_ader_schematic/planAhead_run_4" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "two_bit_adder.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {../../Lab_1.1/full_adder/full_adder.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Lab1.3/two_bit_adder.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top two_bit_adder $srcset
add_files [list {two_bit_adder.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
