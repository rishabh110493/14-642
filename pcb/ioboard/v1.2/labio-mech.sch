EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:labio-special
LIBS:wise_logo
LIBS:cmu_logo
LIBS:labio-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 10
Title "Raspberry Pi Embedded Lab I/O"
Date ""
Rev "1.2.0"
Comp "Carnegie Mellon University"
Comment1 ""
Comment2 "Drawn by: Ian Hartwig"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L hole H1001
U 1 1 578DE081
P 1400 1900
F 0 "H1001" H 1400 2150 60  0000 C CNN
F 1 "hole" H 1400 1650 60  0000 C CNN
F 2 "labio-special:hole-m3" H 1400 1900 60  0001 C CNN
F 3 "" H 1400 1900 60  0000 C CNN
	1    1400 1900
	1    0    0    -1  
$EndComp
$Comp
L hole H1003
U 1 1 578DE0C4
P 2000 1900
F 0 "H1003" H 2000 2150 60  0000 C CNN
F 1 "hole" H 2000 1650 60  0000 C CNN
F 2 "labio-special:hole-m3" H 2000 1900 60  0001 C CNN
F 3 "" H 2000 1900 60  0000 C CNN
	1    2000 1900
	1    0    0    -1  
$EndComp
$Comp
L hole H1004
U 1 1 578DE0DA
P 2600 1900
F 0 "H1004" H 2600 2150 60  0000 C CNN
F 1 "hole" H 2600 1650 60  0000 C CNN
F 2 "labio-special:hole-m3" H 2600 1900 60  0001 C CNN
F 3 "" H 2600 1900 60  0000 C CNN
	1    2600 1900
	1    0    0    -1  
$EndComp
$Comp
L hole H1005
U 1 1 578DE0FA
P 3200 1900
F 0 "H1005" H 3200 2150 60  0000 C CNN
F 1 "hole" H 3200 1650 60  0000 C CNN
F 2 "labio-special:hole-m3" H 3200 1900 60  0001 C CNN
F 3 "" H 3200 1900 60  0000 C CNN
	1    3200 1900
	1    0    0    -1  
$EndComp
Text Notes 1300 1500 0    60   ~ 0
RPi-like Mounting Holes\n\nM3 for M3/no 4/M2.5 hardware.
$Comp
L hole H1002
U 1 1 578DE13B
P 1400 3100
F 0 "H1002" H 1400 3350 60  0000 C CNN
F 1 "hole" H 1400 2850 60  0000 C CNN
F 2 "labio-special:hole-m3" H 1400 3100 60  0001 C CNN
F 3 "" H 1400 3100 60  0000 C CNN
	1    1400 3100
	1    0    0    -1  
$EndComp
Text Notes 1300 2700 0    60   ~ 0
Heatsink Mounting\n\n25x25mm with 30x30mm M3 holes
NoConn ~ 1600 1900
NoConn ~ 2200 1900
NoConn ~ 2800 1900
NoConn ~ 3400 1900
$Comp
L hole H1006
U 1 1 578DEF5B
P 2000 3100
F 0 "H1006" H 2000 3350 60  0000 C CNN
F 1 "hole" H 2000 2850 60  0000 C CNN
F 2 "labio-special:hole-m3" H 2000 3100 60  0001 C CNN
F 3 "" H 2000 3100 60  0000 C CNN
	1    2000 3100
	1    0    0    -1  
$EndComp
NoConn ~ 2200 3100
NoConn ~ 1600 3100
$Comp
L hole H1007
U 1 1 578EDB90
P 3800 1900
F 0 "H1007" H 3800 2150 60  0000 C CNN
F 1 "hole" H 3800 1650 60  0000 C CNN
F 2 "labio-special:hole-m3" H 3800 1900 60  0001 C CNN
F 3 "" H 3800 1900 60  0000 C CNN
	1    3800 1900
	1    0    0    -1  
$EndComp
$Comp
L hole H1008
U 1 1 578EDB96
P 4400 1900
F 0 "H1008" H 4400 2150 60  0000 C CNN
F 1 "hole" H 4400 1650 60  0000 C CNN
F 2 "labio-special:hole-m3" H 4400 1900 60  0001 C CNN
F 3 "" H 4400 1900 60  0000 C CNN
	1    4400 1900
	1    0    0    -1  
$EndComp
NoConn ~ 4000 1900
NoConn ~ 4600 1900
$Comp
L hole H1009
U 1 1 579067D9
P 5000 1900
F 0 "H1009" H 5000 2150 60  0000 C CNN
F 1 "hole" H 5000 1650 60  0000 C CNN
F 2 "labio-special:hole-m3" H 5000 1900 60  0001 C CNN
F 3 "" H 5000 1900 60  0000 C CNN
	1    5000 1900
	1    0    0    -1  
$EndComp
NoConn ~ 5200 1900
$Comp
L WISE_LOGO G2
U 1 1 5795B82C
P 2300 3850
F 0 "G2" H 2300 3632 60  0001 C CNN
F 1 "WISE_LOGO" H 2300 4068 60  0001 C CNN
F 2 "labio-special:wise_logo_fsilk_2.5mm" H 2300 3850 60  0001 C CNN
F 3 "" H 2300 3850 60  0000 C CNN
	1    2300 3850
	1    0    0    -1  
$EndComp
$Comp
L WISE_LOGO G4
U 1 1 5795B859
P 4700 3850
F 0 "G4" H 4700 3632 60  0001 C CNN
F 1 "WISE_LOGO" H 4700 4068 60  0001 C CNN
F 2 "labio-special:wise_logo_fcu_2.5mm" H 4700 3850 60  0001 C CNN
F 3 "" H 4700 3850 60  0000 C CNN
	1    4700 3850
	1    0    0    -1  
$EndComp
$Comp
L CMU_LOGO G1
U 1 1 5795B878
P 1850 4650
F 0 "G1" H 1850 4439 60  0001 C CNN
F 1 "CMU_LOGO" H 1850 4861 60  0001 C CNN
F 2 "labio-special:cmu_logo_fsilk_3.7mm" H 1850 4650 60  0001 C CNN
F 3 "" H 1850 4650 60  0000 C CNN
	1    1850 4650
	1    0    0    -1  
$EndComp
$Comp
L CMU_LOGO G3
U 1 1 5795B8A5
P 4250 4650
F 0 "G3" H 4250 4439 60  0001 C CNN
F 1 "CMU_LOGO" H 4250 4861 60  0001 C CNN
F 2 "labio-special:cmu_logo_fcu_3.7mm" H 4250 4650 60  0001 C CNN
F 3 "" H 4250 4650 60  0000 C CNN
	1    4250 4650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
