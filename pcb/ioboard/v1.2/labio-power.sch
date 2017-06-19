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
Sheet 9 10
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
L CONN_01X06 P901
U 1 1 5778271C
P 5000 1850
F 0 "P901" H 5000 2200 50  0000 C CNN
F 1 "CONN_01X06" V 5100 1850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06" H 5000 1850 50  0001 C CNN
F 3 "" H 5000 1850 50  0000 C CNN
	1    5000 1850
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR057
U 1 1 57782798
P 6300 2000
F 0 "#PWR057" H 6300 1750 50  0001 C CNN
F 1 "GND" H 6300 1850 50  0000 C CNN
F 2 "" H 6300 2000 50  0000 C CNN
F 3 "" H 6300 2000 50  0000 C CNN
	1    6300 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 1800 6300 2000
Wire Wire Line
	5200 1800 6300 1800
Wire Wire Line
	5200 1900 5300 1900
Wire Wire Line
	5300 1900 5300 1800
Connection ~ 5300 1800
Text HLabel 5400 1600 2    60   Input ~ 0
VDD_5V
Wire Wire Line
	5400 1600 5200 1600
NoConn ~ 5200 1700
Text HLabel 5400 2100 2    60   Input ~ 0
VS_MOTOR
Wire Wire Line
	5200 2100 5400 2100
Wire Wire Line
	5200 2000 5300 2000
Wire Wire Line
	5300 2000 5300 2100
Connection ~ 5300 2100
Text Notes 4600 1400 0    60   ~ 0
External Power (Future)\n\nProvides logic and motor power from power supply or\nbattery pack with possible charging from USB (rpi) power.\n2x motor power for current rating.
$EndSCHEMATC
