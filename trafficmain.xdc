# Clock Signal
set_property PACKAGE_PIN W5 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]
create_clock -name clk -period 10.000 -waveform {0 5} [get_ports clock]
# Pushbutton (Clear)
set_property PACKAGE_PIN U18 [get_ports clear] ;# btnC
    set_property IOSTANDARD LVCMOS33 [get_ports clear]

# Slide Switch (X - Traffic in Day)
set_property PACKAGE_PIN V17 [get_ports X] ;# sw0
    set_property IOSTANDARD LVCMOS33 [get_ports X]

# Slide Switches (Hours - 5 bits)
set_property PACKAGE_PIN V16 [get_ports {hours[0]}] ;# sw15 (adjust indices as needed on your board for hours/minutes)
    set_property IOSTANDARD LVCMOS33 [get_ports {hours[0]}]
set_property PACKAGE_PIN W16 [get_ports {hours[1]}] ;# sw14
    set_property IOSTANDARD LVCMOS33 [get_ports {hours[1]}]
set_property PACKAGE_PIN W17 [get_ports {hours[2]}] ;# sw13
    set_property IOSTANDARD LVCMOS33 [get_ports {hours[2]}]
set_property PACKAGE_PIN W15 [get_ports {hours[3]}] ;# sw12
    set_property IOSTANDARD LVCMOS33 [get_ports {hours[3]}]
set_property PACKAGE_PIN V15 [get_ports {hours[4]}] ;# sw11
    set_property IOSTANDARD LVCMOS33 [get_ports {hours[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {hours[*]}]
set_property PACKAGE_PIN R2 [get_ports is_true] ;# sw11
    set_property IOSTANDARD LVCMOS33 [get_ports is_true]
# Slide Switches (Minutes - 6 bits)
set_property PACKAGE_PIN W14 [get_ports {minutes[0]}] ;# sw10
    set_property IOSTANDARD LVCMOS33 [get_ports {minutes[0]}]
set_property PACKAGE_PIN W13 [get_ports {minutes[1]}] ;# sw9
    set_property IOSTANDARD LVCMOS33 [get_ports {minutes[1]}]
set_property PACKAGE_PIN V2 [get_ports {minutes[2]}] ;# sw8
    set_property IOSTANDARD LVCMOS33 [get_ports {minutes[2]}]
set_property PACKAGE_PIN T3 [get_ports {minutes[3]}] ;# sw7
    set_property IOSTANDARD LVCMOS33 [get_ports {minutes[3]}]
set_property PACKAGE_PIN T2 [get_ports {minutes[4]}] ;# sw6
    set_property IOSTANDARD LVCMOS33 [get_ports {minutes[4]}]
set_property PACKAGE_PIN R3 [get_ports {minutes[5]}] ;# sw5
    set_property IOSTANDARD LVCMOS33 [get_ports {minutes[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {minutes[*]}]

# LEDs (Highway Traffic Light)
set_property PACKAGE_PIN U16 [get_ports hwy[0]];# Connect to your chosen red LED (e.g., LED0)
    set_property IOSTANDARD LVCMOS33 [get_ports hwy[0]];
set_property PACKAGE_PIN E19 [get_ports hwy[1]];# Connect to your chosen yellow LED (e.g., LED1)
    set_property IOSTANDARD LVCMOS33 [get_ports hwy[1]];
#set_property PACKAGE_PIN U19 [get_ports hwy_green] ;# Connect to your chosen green LED (e.g., LED2)
#    set_property IOSTANDARD LVCMOS33 [get_ports hwy_green];
# LEDs (Country Traffic Light)
set_property PACKAGE_PIN V19 [get_ports country[0]];# Connect to your chosen red LED (e.g., LED3)
    set_property IOSTANDARD LVCMOS33 [get_ports country[0]];
set_property PACKAGE_PIN W18 [get_ports country[1]] ;# Connect to your chosen yellow LED (e.g., LED4)
    set_property IOSTANDARD LVCMOS33 [get_ports country[1]];
#set_property PACKAGE_PIN U15 [get_ports country_green] ;# Connect to your chosen green LED (e.g., LED5)
#    set_property IOSTANDARD LVCMOS33 [get_ports country_green]

# Assuming Pmod JA, pin 1 (A1) is used
set_property PACKAGE_PIN J1 [get_ports is_true1] ;# Pmod JA pin 1
    set_property IOSTANDARD LVCMOS33 [get_ports is_true1]
