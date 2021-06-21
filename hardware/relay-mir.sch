EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
Title "Relay Subsystem"
Date "2021-06-11"
Rev "1"
Comp "Christoph Honal"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Q_NPN_BEC Q11
U 1 1 60D1BECC
P 5350 4250
AR Path="/60C36AE5/60D1BECC" Ref="Q11"  Part="1" 
AR Path="/60CBD6BF/60D1BECC" Ref="Q21"  Part="1" 
AR Path="/60CBD77D/60D1BECC" Ref="Q31"  Part="1" 
AR Path="/60CBD7BB/60D1BECC" Ref="Q41"  Part="1" 
F 0 "Q41" H 5541 4296 50  0000 L CNN
F 1 "PMBT3904" H 5541 4205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5550 4350 50  0001 C CNN
F 3 "~" H 5350 4250 50  0001 C CNN
F 4 "BJT NPN SOT-23-3" H 5350 4250 50  0001 C CNN "Description / Value"
F 5 "LCSC" H 5350 4250 50  0001 C CNN "Distributor"
F 6 "C8667" H 5350 4250 50  0001 C CNN "Distributor part #"
F 7 "Nexperia" H 5350 4250 50  0001 C CNN "Manufacturer"
F 8 "PMBT3904,215" H 5350 4250 50  0001 C CNN "Manufacturer Part #"
F 9 "SOT-23-3" H 5350 4250 50  0001 C CNN "Package / Footprint"
F 10 "SMD" H 5350 4250 50  0001 C CNN "Type"
	1    5350 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 60C3DB9C
P 4700 4250
AR Path="/60C36AE5/60C3DB9C" Ref="R13"  Part="1" 
AR Path="/60CBD6BF/60C3DB9C" Ref="R23"  Part="1" 
AR Path="/60CBD77D/60C3DB9C" Ref="R33"  Part="1" 
AR Path="/60CBD7BB/60C3DB9C" Ref="R43"  Part="1" 
F 0 "R43" V 4800 4200 50  0000 L CNN
F 1 "1K" V 4600 4200 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4630 4250 50  0001 C CNN
F 3 "~" H 4700 4250 50  0001 C CNN
F 4 "RES 1K OHM MAX. 1% MIN. 1/8W 0805 SMD" H 4700 4250 50  0001 C CNN "Description / Value"
F 5 "Any" H 4700 4250 50  0001 C CNN "Distributor"
F 6 "TBD" H 4700 4250 50  0001 C CNN "Distributor part #"
F 7 "TBD" H 4700 4250 50  0001 C CNN "Manufacturer"
F 8 "TBD" H 4700 4250 50  0001 C CNN "Manufacturer Part #"
F 9 "0805" H 4700 4250 50  0001 C CNN "Package / Footprint"
F 10 "SMD" H 4700 4250 50  0001 C CNN "Type"
	1    4700 4250
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J11
U 1 1 60D1BED1
P 6600 2350
AR Path="/60C36AE5/60D1BED1" Ref="J11"  Part="1" 
AR Path="/60CBD6BF/60D1BED1" Ref="J21"  Part="1" 
AR Path="/60CBD77D/60D1BED1" Ref="J31"  Part="1" 
AR Path="/60CBD7BB/60D1BED1" Ref="J41"  Part="1" 
F 0 "J41" H 6550 2050 50  0000 L CNN
F 1 "LOAD" H 6550 2150 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-3_1x03_P5.00mm_Horizontal" H 6600 2350 50  0001 C CNN
F 3 "~" H 6600 2350 50  0001 C CNN
F 4 "CONN SCREW TERMINAL PITCH-5.0MM 3 PIN 20A" H 6600 2350 50  0001 C CNN "Description / Value"
F 5 "LCSC" H 6600 2350 50  0001 C CNN "Distributor"
F 6 "C8270" H 6600 2350 50  0001 C CNN "Distributor part #"
F 7 "Ningbo Kangnex Elec" H 6600 2350 50  0001 C CNN "Manufacturer"
F 8 "WJ128V-5.0-3P" H 6600 2350 50  0001 C CNN "Manufacturer Part #"
F 9 "Through-Hole" H 6600 2350 50  0001 C CNN "Package / Footprint"
F 10 "THT" H 6600 2350 50  0001 C CNN "Type"
	1    6600 2350
	1    0    0    1   
$EndComp
Wire Wire Line
	3050 4050 3300 4050
Text HLabel 2600 4050 0    50   Input ~ 0
TRIGGER
Wire Wire Line
	2600 4050 2750 4050
Wire Wire Line
	5450 4050 5450 3900
Wire Wire Line
	4850 4250 5150 4250
Wire Wire Line
	5450 3900 4650 3900
Connection ~ 5450 3900
Wire Wire Line
	5450 3900 5450 3750
Wire Wire Line
	4650 3900 4650 3600
Wire Wire Line
	5450 2850 5450 3150
Wire Wire Line
	4650 3300 4650 2850
Connection ~ 4650 2850
Wire Wire Line
	4650 2850 5450 2850
Connection ~ 5450 2850
Wire Wire Line
	3900 4050 4000 4050
Wire Wire Line
	4000 4050 4000 2850
Wire Wire Line
	3300 4250 3200 4250
Connection ~ 4650 3900
Wire Wire Line
	4650 3900 4300 3900
Wire Wire Line
	4300 3900 4300 3750
Wire Wire Line
	4300 3450 4300 3300
Wire Wire Line
	4000 2850 4300 2850
Wire Wire Line
	4300 2850 4650 2850
Connection ~ 4300 2850
Wire Wire Line
	4300 3000 4300 2850
$Comp
L Relay:SANYOU_SRD_Form_C K11
U 1 1 60C370D4
P 5650 3450
AR Path="/60C36AE5/60C370D4" Ref="K11"  Part="1" 
AR Path="/60CBD6BF/60C370D4" Ref="K21"  Part="1" 
AR Path="/60CBD77D/60C370D4" Ref="K31"  Part="1" 
AR Path="/60CBD7BB/60C370D4" Ref="K41"  Part="1" 
F 0 "K41" H 5350 3900 50  0000 C CNN
F 1 "SRD-05VDC-SL-C" H 5050 3800 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 6100 3400 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 5650 3450 50  0001 C CNN
F 4 "RELAY 5V 10A" H 5650 3450 50  0001 C CNN "Description / Value"
F 5 "LCSC" H 5650 3450 50  0001 C CNN "Distributor"
F 6 "C35449" H 5650 3450 50  0001 C CNN "Distributor part #"
F 7 "Ningbo Songle Relay" H 5650 3450 50  0001 C CNN "Manufacturer"
F 8 "SRD-05VDC-SL-C" H 5650 3450 50  0001 C CNN "Manufacturer Part #"
F 9 "Through-Hole" H 5650 3450 50  0001 C CNN "Package / Footprint"
F 10 "THT" H 5650 3450 50  0001 C CNN "Type"
	1    5650 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4450 5450 4650
Wire Wire Line
	5450 4650 4200 4650
Wire Wire Line
	3200 4250 3200 4650
Connection ~ 5450 4650
$Comp
L power:GND #PWR0101
U 1 1 60C91E1E
P 5450 4850
AR Path="/60C36AE5/60C91E1E" Ref="#PWR0101"  Part="1" 
AR Path="/60CBD6BF/60C91E1E" Ref="#PWR022"  Part="1" 
AR Path="/60CBD77D/60C91E1E" Ref="#PWR032"  Part="1" 
AR Path="/60CBD7BB/60C91E1E" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 5450 4600 50  0001 C CNN
F 1 "GND" H 5455 4677 50  0000 C CNN
F 2 "" H 5450 4850 50  0001 C CNN
F 3 "" H 5450 4850 50  0001 C CNN
	1    5450 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4650 5450 4850
Text HLabel 8450 3350 2    50   Output ~ 0
VIOUT
Wire Wire Line
	4300 2650 4300 2850
Wire Wire Line
	5450 4650 7000 4650
Wire Wire Line
	7000 3550 7000 4650
$Comp
L CustomComponents:CC690XSO-XA U32
U 1 1 60D16B35
P 6650 3400
AR Path="/60CBD77D/60D16B35" Ref="U32"  Part="1" 
AR Path="/60C36AE5/60D16B35" Ref="U12"  Part="1" 
AR Path="/60CBD6BF/60D16B35" Ref="U22"  Part="1" 
AR Path="/60CBD7BB/60D16B35" Ref="U42"  Part="1" 
F 0 "U42" H 6650 3815 50  0000 C CNN
F 1 "CC6902SO-10A" H 6650 3724 50  0000 C CNN
F 2 "CustomComponents:CC690XSO-XA" H 6650 3100 50  0001 C CNN
F 3 "" H 6650 3600 50  0001 C CNN
F 4 "IC CURRENT SENSOR 5V 10A SOP-8" H 6650 3400 50  0001 C CNN "Description / Value"
F 5 "LCSC" H 6650 3400 50  0001 C CNN "Distributor"
F 6 "C350865" H 6650 3400 50  0001 C CNN "Distributor part #"
F 7 "Cross Chip" H 6650 3400 50  0001 C CNN "Manufacturer"
F 8 "CC6902SO-10A" H 6650 3400 50  0001 C CNN "Manufacturer Part #"
F 9 "SOP-8" H 6650 3400 50  0001 C CNN "Package / Footprint"
F 10 "SMD" H 6650 3400 50  0001 C CNN "Type"
	1    6650 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2850 7050 2850
Wire Wire Line
	7000 3250 7050 3250
Wire Wire Line
	7050 2850 7050 3250
$Comp
L power:+5V #PWR0102
U 1 1 60D1BED6
P 4300 2650
AR Path="/60C36AE5/60D1BED6" Ref="#PWR0102"  Part="1" 
AR Path="/60CBD6BF/60D1BED6" Ref="#PWR021"  Part="1" 
AR Path="/60CBD77D/60D1BED6" Ref="#PWR031"  Part="1" 
AR Path="/60CBD7BB/60D1BED6" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 4300 2500 50  0001 C CNN
F 1 "+5V" H 4315 2823 50  0000 C CNN
F 2 "" H 4300 2650 50  0001 C CNN
F 3 "" H 4300 2650 50  0001 C CNN
	1    4300 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 60C94FE5
P 7750 3900
AR Path="/60C36AE5/60C94FE5" Ref="C11"  Part="1" 
AR Path="/60CBD6BF/60C94FE5" Ref="C21"  Part="1" 
AR Path="/60CBD77D/60C94FE5" Ref="C31"  Part="1" 
AR Path="/60CBD7BB/60C94FE5" Ref="C41"  Part="1" 
F 0 "C41" H 7865 3946 50  0000 L CNN
F 1 "100P" H 7865 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7788 3750 50  0001 C CNN
F 3 "~" H 7750 3900 50  0001 C CNN
F 4 "CAP CER 100PF MAX. 5% MIN. 10V 0805 SMD" H 7750 3900 50  0001 C CNN "Description / Value"
F 5 "Any" H 7750 3900 50  0001 C CNN "Distributor"
F 6 "TBD" H 7750 3900 50  0001 C CNN "Distributor part #"
F 7 "TBD" H 7750 3900 50  0001 C CNN "Manufacturer"
F 8 "TBD" H 7750 3900 50  0001 C CNN "Manufacturer Part #"
F 9 "0805" H 7750 3900 50  0001 C CNN "Package / Footprint"
F 10 "SMD" H 7750 3900 50  0001 C CNN "Type"
	1    7750 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 60CDBA1D
P 7500 3350
AR Path="/60C36AE5/60CDBA1D" Ref="R14"  Part="1" 
AR Path="/60CBD6BF/60CDBA1D" Ref="R24"  Part="1" 
AR Path="/60CBD77D/60CDBA1D" Ref="R34"  Part="1" 
AR Path="/60CBD7BB/60CDBA1D" Ref="R44"  Part="1" 
F 0 "R44" V 7293 3350 50  0000 C CNN
F 1 "100R" V 7384 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7430 3350 50  0001 C CNN
F 3 "~" H 7500 3350 50  0001 C CNN
F 4 "RES 100 OHM MAX. 1% MIN. 1/8W 0805 SMD" H 7500 3350 50  0001 C CNN "Description / Value"
F 5 "Any" H 7500 3350 50  0001 C CNN "Distributor"
F 6 "TBD" H 7500 3350 50  0001 C CNN "Distributor part #"
F 7 "TBD" H 7500 3350 50  0001 C CNN "Manufacturer"
F 8 "TBD" H 7500 3350 50  0001 C CNN "Manufacturer Part #"
F 9 "0805" H 7500 3350 50  0001 C CNN "Package / Footprint"
F 10 "SMD" H 7500 3350 50  0001 C CNN "Type"
	1    7500 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	7750 3350 7750 3750
Wire Wire Line
	7750 4050 7750 4650
$Comp
L Device:C C12
U 1 1 60C99EC6
P 8300 3900
AR Path="/60C36AE5/60C99EC6" Ref="C12"  Part="1" 
AR Path="/60CBD6BF/60C99EC6" Ref="C22"  Part="1" 
AR Path="/60CBD77D/60C99EC6" Ref="C32"  Part="1" 
AR Path="/60CBD7BB/60C99EC6" Ref="C42"  Part="1" 
F 0 "C42" H 8415 3946 50  0000 L CNN
F 1 "100N" H 8415 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8338 3750 50  0001 C CNN
F 3 "~" H 8300 3900 50  0001 C CNN
F 4 "CAP CER 100NF MAX. 5% MIN. 10V 0805 SMD" H 8300 3900 50  0001 C CNN "Description / Value"
F 5 "Any" H 8300 3900 50  0001 C CNN "Distributor"
F 6 "TBD" H 8300 3900 50  0001 C CNN "Distributor part #"
F 7 "TBD" H 8300 3900 50  0001 C CNN "Manufacturer"
F 8 "TBD" H 8300 3900 50  0001 C CNN "Manufacturer Part #"
F 9 "0805" H 8300 3900 50  0001 C CNN "Package / Footprint"
F 10 "SMD" H 8300 3900 50  0001 C CNN "Type"
	1    8300 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3350 7750 3350
Wire Wire Line
	8300 4050 8300 4650
Wire Wire Line
	8300 2850 8300 3750
Connection ~ 7750 4650
Wire Wire Line
	7750 4650 8300 4650
Connection ~ 7750 3350
Wire Wire Line
	7750 3350 8450 3350
Wire Notes Line
	7300 3050 7300 4100
Wire Notes Line
	7300 4100 8100 4100
Wire Notes Line
	8100 4100 8100 3050
Wire Notes Line
	8100 3050 7300 3050
Text Notes 7250 3000 0    50   ~ 0
Low-pass Filter 15.9 MHz
Text Notes 3350 4500 0    50   ~ 0
CTR min. 50%\nIF = 19mA
Text Notes 5550 4450 0    50   ~ 0
0.2A at hFE = 50
Connection ~ 7000 4650
Connection ~ 7050 2850
Wire Wire Line
	7000 4650 7750 4650
Wire Wire Line
	7050 2850 8300 2850
Wire Wire Line
	7000 3350 7350 3350
Wire Wire Line
	5750 3150 5750 2450
Wire Wire Line
	5950 2250 6400 2250
Wire Wire Line
	5950 2250 5950 3150
Wire Wire Line
	6400 2450 5750 2450
$Comp
L Device:R R12
U 1 1 60D1BECE
P 4300 3150
AR Path="/60C36AE5/60D1BECE" Ref="R12"  Part="1" 
AR Path="/60CBD6BF/60D1BECE" Ref="R22"  Part="1" 
AR Path="/60CBD77D/60D1BECE" Ref="R32"  Part="1" 
AR Path="/60CBD7BB/60D1BECE" Ref="R42"  Part="1" 
F 0 "R42" H 4370 3196 50  0000 L CNN
F 1 "200R" H 4370 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4230 3150 50  0001 C CNN
F 3 "~" H 4300 3150 50  0001 C CNN
F 4 "RES 200 OHM MAX. 1% MIN. 1/8W 0805 SMD" H 4300 3150 50  0001 C CNN "Description / Value"
F 5 "Any" H 4300 3150 50  0001 C CNN "Distributor"
F 6 "TBD" H 4300 3150 50  0001 C CNN "Distributor part #"
F 7 "TBD" H 4300 3150 50  0001 C CNN "Manufacturer"
F 8 "TBD" H 4300 3150 50  0001 C CNN "Manufacturer Part #"
F 9 "0805" H 4300 3150 50  0001 C CNN "Package / Footprint"
F 10 "SMD" H 4300 3150 50  0001 C CNN "Type"
	1    4300 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:D_ALT D12
U 1 1 60D1BED2
P 4650 3450
AR Path="/60C36AE5/60D1BED2" Ref="D12"  Part="1" 
AR Path="/60CBD6BF/60D1BED2" Ref="D22"  Part="1" 
AR Path="/60CBD77D/60D1BED2" Ref="D32"  Part="1" 
AR Path="/60CBD7BB/60D1BED2" Ref="D42"  Part="1" 
F 0 "D42" V 4604 3530 50  0000 L CNN
F 1 "1N4007F" V 4695 3530 50  0000 L CNN
F 2 "CustomComponents:D_SMAF" H 4650 3450 50  0001 C CNN
F 3 "~" H 4650 3450 50  0001 C CNN
F 4 "DIODE 1N4007 SMAF" H 4650 3450 50  0001 C CNN "Description / Value"
F 5 "LCSC" H 4650 3450 50  0001 C CNN "Distributor"
F 6 "C110856" H 4650 3450 50  0001 C CNN "Distributor part #"
F 7 "Shikues" H 4650 3450 50  0001 C CNN "Manufacturer"
F 8 "1N4007F" H 4650 3450 50  0001 C CNN "Manufacturer Part #"
F 9 "SMAF" H 4650 3450 50  0001 C CNN "Package / Footprint"
F 10 "SMD" H 4650 3450 50  0001 C CNN "Type"
	1    4650 3450
	0    1    1    0   
$EndComp
$Comp
L Device:LED D11
U 1 1 60D1BECD
P 4300 3600
AR Path="/60C36AE5/60D1BECD" Ref="D11"  Part="1" 
AR Path="/60CBD6BF/60D1BECD" Ref="D21"  Part="1" 
AR Path="/60CBD77D/60D1BECD" Ref="D31"  Part="1" 
AR Path="/60CBD7BB/60D1BECD" Ref="D41"  Part="1" 
F 0 "D41" V 4300 3750 50  0000 C CNN
F 1 "LED" V 4200 3750 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 4300 3600 50  0001 C CNN
F 3 "~" H 4300 3600 50  0001 C CNN
F 4 "LED RED 2V 0805 SMD" H 4300 3600 50  0001 C CNN "Description / Value"
F 5 "LCSC" H 4300 3600 50  0001 C CNN "Distributor"
F 6 "C72037" H 4300 3600 50  0001 C CNN "Distributor part #"
F 7 "Everlight Elec" H 4300 3600 50  0001 C CNN "Manufacturer"
F 8 "17-21SURC/S530-A3/TR8" H 4300 3600 50  0001 C CNN "Manufacturer Part #"
F 9 "0805" H 4300 3600 50  0001 C CNN "Package / Footprint"
F 10 "SMD" H 4300 3600 50  0001 C CNN "Type"
	1    4300 3600
	0    -1   -1   0   
$EndComp
$Comp
L CustomComponents:PC817X2CSP9F U31
U 1 1 60D1BED8
P 3600 4150
AR Path="/60CBD77D/60D1BED8" Ref="U31"  Part="1" 
AR Path="/60C36AE5/60D1BED8" Ref="U11"  Part="1" 
AR Path="/60CBD6BF/60D1BED8" Ref="U21"  Part="1" 
AR Path="/60CBD7BB/60D1BED8" Ref="U41"  Part="1" 
F 0 "U41" H 3600 4475 50  0000 C CNN
F 1 "PC817X2CSP9F" H 3600 4384 50  0000 C CNN
F 2 "CustomComponents:PC817X2CSP9F" H 3400 3950 50  0001 L CIN
F 3 "" H 3600 4150 50  0001 L CNN
F 4 "IC OPTOCOUPLER SMD-4" H 3600 4150 50  0001 C CNN "Description / Value"
F 5 "LCSC" H 3600 4150 50  0001 C CNN "Distributor"
F 6 "C66405" H 3600 4150 50  0001 C CNN "Distributor part #"
F 7 "Sharp Microelectronics" H 3600 4150 50  0001 C CNN "Manufacturer"
F 8 "PC817X2CSP9F" H 3600 4150 50  0001 C CNN "Manufacturer Part #"
F 9 "SMD-4" H 3600 4150 50  0001 C CNN "Package / Footprint"
F 10 "SMD" H 3600 4150 50  0001 C CNN "Type"
	1    3600 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 60D1BED0
P 2900 4050
AR Path="/60C36AE5/60D1BED0" Ref="R11"  Part="1" 
AR Path="/60CBD6BF/60D1BED0" Ref="R21"  Part="1" 
AR Path="/60CBD77D/60D1BED0" Ref="R31"  Part="1" 
AR Path="/60CBD7BB/60D1BED0" Ref="R41"  Part="1" 
F 0 "R41" V 3000 4000 50  0000 L CNN
F 1 "200R" V 2800 3950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2830 4050 50  0001 C CNN
F 3 "~" H 2900 4050 50  0001 C CNN
F 4 "RES 200 OHM MAX. 1% MIN. 1/8W 0805 SMD" H 2900 4050 50  0001 C CNN "Description / Value"
F 5 "Any" H 2900 4050 50  0001 C CNN "Distributor"
F 6 "TBD" H 2900 4050 50  0001 C CNN "Distributor part #"
F 7 "TBD" H 2900 4050 50  0001 C CNN "Manufacturer"
F 8 "TBD" H 2900 4050 50  0001 C CNN "Manufacturer Part #"
F 9 "0805" H 2900 4050 50  0001 C CNN "Package / Footprint"
F 10 "SMD" H 2900 4050 50  0001 C CNN "Type"
	1    2900 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6300 3250 6300 3350
Wire Wire Line
	6300 3450 6300 3550
Wire Wire Line
	6300 3750 6300 3550
Wire Wire Line
	5850 3750 6300 3750
Connection ~ 6300 3550
Wire Wire Line
	6300 3250 6300 2350
Connection ~ 6300 3250
Wire Wire Line
	6300 2350 6400 2350
Connection ~ 4200 4650
Wire Wire Line
	4200 4650 3200 4650
Connection ~ 4200 4250
Wire Wire Line
	4200 4250 4550 4250
Wire Wire Line
	3900 4250 4200 4250
Wire Wire Line
	4200 4550 4200 4650
$Comp
L Device:R R25
U 1 1 60D7FFE4
P 4200 4400
AR Path="/60CBD6BF/60D7FFE4" Ref="R25"  Part="1" 
AR Path="/60CBD7BB/60D7FFE4" Ref="R45"  Part="1" 
F 0 "R45" H 4270 4446 50  0000 L CNN
F 1 "10K" H 4270 4355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4130 4400 50  0001 C CNN
F 3 "~" H 4200 4400 50  0001 C CNN
F 4 "RES 10K OHM MAX. 1% MIN. 1/8W 0805 SMD" H 4200 4400 50  0001 C CNN "Description / Value"
F 5 "Any" H 4200 4400 50  0001 C CNN "Distributor"
F 6 "TBD" H 4200 4400 50  0001 C CNN "Distributor part #"
F 7 "TBD" H 4200 4400 50  0001 C CNN "Manufacturer"
F 8 "TBD" H 4200 4400 50  0001 C CNN "Manufacturer Part #"
F 9 "0805" H 4200 4400 50  0001 C CNN "Package / Footprint"
F 10 "SMD" H 4200 4400 50  0001 C CNN "Type"
	1    4200 4400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
