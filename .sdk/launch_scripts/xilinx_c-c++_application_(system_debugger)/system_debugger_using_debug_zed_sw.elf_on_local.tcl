connect -url tcp:127.0.0.1:3121
source /home/alex/GitHub/AD9361_ZyCAP/zed_hw/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248764603"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248764603" && level==0} -index 1
fpga -file /home/alex/GitHub/AD9361_ZyCAP/zed_hw/system_top.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248764603"} -index 0
loadhw /home/alex/GitHub/AD9361_ZyCAP/zed_hw/system.hdf
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248764603"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248764603"} -index 0
dow /home/alex/GitHub/AD9361_ZyCAP/zed_sw/Debug/zed_sw.elf
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248764603"} -index 0
con
