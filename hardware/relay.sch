EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
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
L Device:Q_NPN_BEC Q1
U 1 1 60C3AACC
P 5350 4250
AR Path="/60C36AE5/60C3AACC" Ref="Q1"  Part="1" 
AR Path="/60CBD6BF/60C3AACC" Ref="Q2"  Part="1" 
AR Path="/60CBD77D/60C3AACC" Ref="Q3"  Part="1" 
AR Path="/60CBD7BB/60C3AACC" Ref="Q4"  Part="1" 
F 0 "Q1" H 5541 4296 50  0000 L CNN
F 1 "PMBT3904" H 5541 4205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5550 4350 50  0001 C CNN
F 3 "~" H 5350 4250 50  0001 C CNN
	1    5350 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 60C3DB9C
P 4700 4250
AR Path="/60C36AE5/60C3DB9C" Ref="R3"  Part="1" 
AR Path="/60CBD6BF/60C3DB9C" Ref="R6"  Part="1" 
AR Path="/60CBD77D/60C3DB9C" Ref="R9"  Part="1" 
AR Path="/60CBD7BB/60C3DB9C" Ref="R12"  Part="1" 
F 0 "R3" V 4800 4200 50  0000 L CNN
F 1 "1K" V 4600 4200 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4630 4250 50  0001 C CNN
F 3 "~" H 4700 4250 50  0001 C CNN
	1    4700 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 60C3E090
P 2900 4050
AR Path="/60C36AE5/60C3E090" Ref="R1"  Part="1" 
AR Path="/60CBD6BF/60C3E090" Ref="R4"  Part="1" 
AR Path="/60CBD77D/60C3E090" Ref="R7"  Part="1" 
AR Path="/60CBD7BB/60C3E090" Ref="R10"  Part="1" 
F 0 "R1" V 3000 4000 50  0000 L CNN
F 1 "200R" V 2800 3950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2830 4050 50  0001 C CNN
F 3 "~" H 2900 4050 50  0001 C CNN
	1    2900 4050
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J1
U 1 1 60C4BBD2
P 5850 2350
AR Path="/60C36AE5/60C4BBD2" Ref="J1"  Part="1" 
AR Path="/60CBD6BF/60C4BBD2" Ref="J2"  Part="1" 
AR Path="/60CBD77D/60C4BBD2" Ref="J3"  Part="1" 
AR Path="/60CBD7BB/60C4BBD2" Ref="J4"  Part="1" 
F 0 "J1" V 5900 2050 50  0000 L CNN
F 1 "LOAD" V 5800 1950 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 5850 2350 50  0001 C CNN
F 3 "~" H 5850 2350 50  0001 C CNN
	1    5850 2350
	0    -1   -1   0   
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
	3900 4250 4550 4250
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
$Comp
L Device:D_ALT D2
U 1 1 60C544FE
P 4650 3450
AR Path="/60C36AE5/60C544FE" Ref="D2"  Part="1" 
AR Path="/60CBD6BF/60C544FE" Ref="D4"  Part="1" 
AR Path="/60CBD77D/60C544FE" Ref="D6"  Part="1" 
AR Path="/60CBD7BB/60C544FE" Ref="D8"  Part="1" 
F 0 "D2" V 4604 3530 50  0000 L CNN
F 1 "1N4007F" V 4695 3530 50  0000 L CNN
F 2 "Diode_SMD:D_SMA" H 4650 3450 50  0001 C CNN
F 3 "~" H 4650 3450 50  0001 C CNN
	1    4650 3450
	0    1    1    0   
$EndComp
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
L Device:R R2
U 1 1 60C3D896
P 4300 3150
AR Path="/60C36AE5/60C3D896" Ref="R2"  Part="1" 
AR Path="/60CBD6BF/60C3D896" Ref="R5"  Part="1" 
AR Path="/60CBD77D/60C3D896" Ref="R8"  Part="1" 
AR Path="/60CBD7BB/60C3D896" Ref="R11"  Part="1" 
F 0 "R2" H 4370 3196 50  0000 L CNN
F 1 "200R" H 4370 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4230 3150 50  0001 C CNN
F 3 "~" H 4300 3150 50  0001 C CNN
	1    4300 3150
	1    0    0    -1  
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_C K1
U 1 1 60C370D4
P 5650 3450
AR Path="/60C36AE5/60C370D4" Ref="K1"  Part="1" 
AR Path="/60CBD6BF/60C370D4" Ref="K2"  Part="1" 
AR Path="/60CBD77D/60C370D4" Ref="K3"  Part="1" 
AR Path="/60CBD7BB/60C370D4" Ref="K4"  Part="1" 
F 0 "K1" H 5350 3900 50  0000 C CNN
F 1 "SRD-05VDC-SL-C" H 5050 3800 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 6100 3400 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 5650 3450 50  0001 C CNN
	1    5650 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4450 5450 4650
Wire Wire Line
	5450 4650 3200 4650
Wire Wire Line
	3200 4250 3200 4650
Connection ~ 5450 4650
$Comp
L power:GND #PWR01
U 1 1 60C91E1E
P 5450 4850
AR Path="/60C36AE5/60C91E1E" Ref="#PWR01"  Part="1" 
AR Path="/60CBD6BF/60C91E1E" Ref="#PWR04"  Part="1" 
AR Path="/60CBD77D/60C91E1E" Ref="#PWR06"  Part="1" 
AR Path="/60CBD7BB/60C91E1E" Ref="#PWR08"  Part="1" 
F 0 "#PWR01" H 5450 4600 50  0001 C CNN
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
	5750 2550 5750 3150
Wire Wire Line
	5850 2550 5850 2700
Wire Wire Line
	5850 2700 6250 2700
Wire Wire Line
	6250 3750 5850 3750
Wire Wire Line
	6250 2700 6250 3550
Wire Wire Line
	5950 2550 5950 3050
Wire Wire Line
	5450 4650 7150 4650
Wire Wire Line
	7150 3550 7150 4650
Wire Wire Line
	6450 3050 5950 3050
Connection ~ 5950 3050
Wire Wire Line
	5950 3050 5950 3150
Wire Wire Line
	6450 3450 6450 3550
Wire Wire Line
	6450 3550 6250 3550
Connection ~ 6250 3550
Wire Wire Line
	6250 3550 6250 3750
Wire Wire Line
	6450 3050 6450 3250
$Comp
L CustomComponents:PC817X2CSP9F U5
U 1 1 60D16537
P 3600 4150
AR Path="/60CBD77D/60D16537" Ref="U5"  Part="1" 
AR Path="/60C36AE5/60D16537" Ref="U1"  Part="1" 
AR Path="/60CBD6BF/60D16537" Ref="U3"  Part="1" 
AR Path="/60CBD7BB/60D16537" Ref="U7"  Part="1" 
F 0 "U1" H 3600 4475 50  0000 C CNN
F 1 "PC817X2CSP9F" H 3600 4384 50  0000 C CNN
F 2 "CustomComponents:PC817X2CSP9F" H 3400 3950 50  0001 L CIN
F 3 "" H 3600 4150 50  0001 L CNN
	1    3600 4150
	1    0    0    -1  
$EndComp
$Comp
L CustomComponents:CC690XSO-XA U6
U 1 1 60D16B35
P 6800 3400
AR Path="/60CBD77D/60D16B35" Ref="U6"  Part="1" 
AR Path="/60C36AE5/60D16B35" Ref="U2"  Part="1" 
AR Path="/60CBD6BF/60D16B35" Ref="U4"  Part="1" 
AR Path="/60CBD7BB/60D16B35" Ref="U8"  Part="1" 
F 0 "U2" H 6800 3815 50  0000 C CNN
F 1 "CC6902SO-10A" H 6800 3724 50  0000 C CNN
F 2 "CustomComponents:CC690XSO-XA" H 6800 3100 50  0001 C CNN
F 3 "" H 6800 3600 50  0001 C CNN
	1    6800 3400
	1    0    0    -1  
$EndComp
Connection ~ 6450 3550
Wire Wire Line
	6450 3250 6450 3350
Connection ~ 6450 3250
Wire Wire Line
	5450 2850 7200 2850
Wire Wire Line
	7150 3250 7200 3250
Wire Wire Line
	7200 2850 7200 3250
$Comp
L Device:LED D1
U 1 1 60C3C98C
P 4300 3600
AR Path="/60C36AE5/60C3C98C" Ref="D1"  Part="1" 
AR Path="/60CBD6BF/60C3C98C" Ref="D3"  Part="1" 
AR Path="/60CBD77D/60C3C98C" Ref="D5"  Part="1" 
AR Path="/60CBD7BB/60C3C98C" Ref="D7"  Part="1" 
F 0 "D1" V 4300 3750 50  0000 C CNN
F 1 "LED" V 4200 3750 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 4300 3600 50  0001 C CNN
F 3 "~" H 4300 3600 50  0001 C CNN
	1    4300 3600
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 60CD3C14
P 4300 2650
AR Path="/60C36AE5/60CD3C14" Ref="#PWR017"  Part="1" 
AR Path="/60CBD6BF/60CD3C14" Ref="#PWR018"  Part="1" 
AR Path="/60CBD77D/60CD3C14" Ref="#PWR019"  Part="1" 
AR Path="/60CBD7BB/60CD3C14" Ref="#PWR020"  Part="1" 
F 0 "#PWR017" H 4300 2500 50  0001 C CNN
F 1 "+5V" H 4315 2823 50  0000 C CNN
F 2 "" H 4300 2650 50  0001 C CNN
F 3 "" H 4300 2650 50  0001 C CNN
	1    4300 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 60C94FE5
P 7750 3900
AR Path="/60C36AE5/60C94FE5" Ref="C1"  Part="1" 
AR Path="/60CBD6BF/60C94FE5" Ref="C3"  Part="1" 
AR Path="/60CBD77D/60C94FE5" Ref="C5"  Part="1" 
AR Path="/60CBD7BB/60C94FE5" Ref="C7"  Part="1" 
F 0 "C1" H 7865 3946 50  0000 L CNN
F 1 "100P" H 7865 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7788 3750 50  0001 C CNN
F 3 "~" H 7750 3900 50  0001 C CNN
	1    7750 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 60CDBA1D
P 7500 3350
AR Path="/60C36AE5/60CDBA1D" Ref="R13"  Part="1" 
AR Path="/60CBD6BF/60CDBA1D" Ref="R14"  Part="1" 
AR Path="/60CBD77D/60CDBA1D" Ref="R15"  Part="1" 
AR Path="/60CBD7BB/60CDBA1D" Ref="R16"  Part="1" 
F 0 "R13" V 7293 3350 50  0000 C CNN
F 1 "100R" V 7384 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7430 3350 50  0001 C CNN
F 3 "~" H 7500 3350 50  0001 C CNN
	1    7500 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	7750 3350 7750 3750
Wire Wire Line
	7750 4050 7750 4650
$Comp
L Device:C C2
U 1 1 60C99EC6
P 8300 3900
AR Path="/60C36AE5/60C99EC6" Ref="C2"  Part="1" 
AR Path="/60CBD6BF/60C99EC6" Ref="C4"  Part="1" 
AR Path="/60CBD77D/60C99EC6" Ref="C6"  Part="1" 
AR Path="/60CBD7BB/60C99EC6" Ref="C8"  Part="1" 
F 0 "C2" H 8415 3946 50  0000 L CNN
F 1 "100N" H 8415 3855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8338 3750 50  0001 C CNN
F 3 "~" H 8300 3900 50  0001 C CNN
	1    8300 3900
	1    0    0    -1  
$EndComp
Connection ~ 7150 4650
Wire Wire Line
	7150 4650 7750 4650
Wire Wire Line
	7650 3350 7750 3350
Wire Wire Line
	7150 3350 7350 3350
Wire Wire Line
	8300 4050 8300 4650
Wire Wire Line
	8300 2850 8300 3750
Connection ~ 7750 4650
Wire Wire Line
	7750 4650 8300 4650
Connection ~ 7200 2850
Wire Wire Line
	7200 2850 8300 2850
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
Text Notes 5550 4500 0    50   ~ 0
0.4A max (0.2A limit) \nat hFE = 100 
$EndSCHEMATC
