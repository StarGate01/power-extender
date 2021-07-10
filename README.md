# Power Extender

Hardware and software for a power and IO extension PCB with current monitoring and I2C interface.

## Usage

Use [KiCad](https://www.kicad.org/) with my [CustomComponents](https://github.com/StarGate01/KiCadLibs) library to view and edit this project, or download the [fabrication files](https://github.com/StarGate01/power-extender/tree/master/fabrication). I used [KiBOM](https://github.com/SchrodingersGat/kibom) to generate the BOM.


<details>
<summary>State of the project</summary>

 - [x] Lay out circuit
 - [x] Select components
 - [x] Lay out PCB
 - [x] Export rev. 1
 - [x] PCB reviewed by fab
 - [x] BOM finalized
 - [x] Export rev. 1.1 (adapt to BOM)
 - [x] PCB reviewed by fab
 - [x] PCBs produced
 - [x] PCBA confirmed
 - [ ] PCBA completed
 - [ ] PCBs received
 - [ ] Testing and verification
 - [ ] (... More revisions if needed ...)
 - [ ] Update readme with final specs and BOM

</details>

## Images

![3D Render](https://raw.githubusercontent.com/StarGate01/power-extender/master/fabrication/rev1/render/power-extender-render-3d-rev1.png)

## Design

<details>
<summary>Goals</summary>

 - Serial interface for RPi
 - 4 Relays (3 active + 1 hot spare)
   - Rated for min. 12V / 8A inductive loads (rotary pumps)
   - Current monitoring
 - ca. 4 additional digital IO pins (TTL)
 - ca. 4 additional analog input pins
 - Operate in damp, cold and hot environments

</details>

<details>
<summary>Board</summary>

  - Dual layer with ground plane
  - Large spacing for high power traces
  - 2oz/ft copper weight to carry 10A in ~4mm traces
  - Isolation milling to limit creepage 

</details>

<details>
<summary>Interfacing</summary>

  - JST connector for VDD, GND and I2C signals
  - 4 aux digital IO pins and 4 aux ADC pins
  - High power interface directly at relay outputs
  - Arduino compatible pin headers for aux signals
  - 5V circuit due to current draw and RPi limits
  - Voltage level-shifter for I2C
   
</details>

<details>
<summary>Relay subsystem</summary>

  - Min. 100W inductive DC load
  - Flyback diode to limit switching inductive power surge
  - Indicator LED with resistor
  - Stage 1 optocoupler for galvanic isolation from high power noise
  - Stage 2 NPN transistor to drive the relay coil from coupler output
  - Heavy duty screw terminals for high power connections

</details>

<details>
<summary>Power monitoring subsystem</summary>

  - Hall loop of sensor connected across relay load
  - Analog output connected to ADC
  - Prevent high power induction into signal traces (?)
  - Multi-channel ADC connected to I2C bus
 
</details>

## Component selection

<details>
<summary>Constraints</summary>

  - Price
  - In stock at LCSC
  - SMD preferred, assembly will be done at the fab

</details>

<details>
<summary>Rationale</summary>

  - Standalone I2C port extender: `PCA9557PW`
  - Current measuring IC: `CC6902SO-10A`
    - Max. current: 10A
    - Signal level: 5V
  - Standalone I2C ADCs: `ADS1115IDGSR`
    - Voltage level: 5V
  - Relays: `SRD-05VDC-SL-C`
    - Coil sensitivity: 0.36W / 72 mA at 5V
    - Optocoupler: `PC817X2CSP9F`
      - Input: 1.2V, ca. 20 mA
      - Transfer ratio: min. 50%
    - NPN Transistor: `PMBT3904,215`
      - Max. 0.2A output
      - 1K base resistor to limit optocoupler current
      - Gain ca. 100 for max. theoretical current of ca. 0.4A
    - Flyback diode: `1N4007`
      - SMA format
    - Screw terminals: 5mm pitch
  - Indicator LEDs: `17-21SURC/S530-A3/TR8`
    - 200 Ohm resistor for 2V, ca. 15 mA
    - Red, 0805 format
  - Resistors and capacitors
    - 0805 format
  - Shifting MOSFETS: `BSS138`
    - SOT-23 format
</details>

<details>
<summary>Rev 1.1 BOM</summary>

|Item #|Designator                            |Quantity|Manufacturer          |Manufacturer Part #  |Description / Value                         |Distributor|Distributor part #|Package / Footprint|Type|Notes|
|------|--------------------------------------|--------|----------------------|---------------------|--------------------------------------------|-----------|------------------|-------------------|----|-----|
|1     |C11, C21, C31, C41                    |4       |Any                   |TBD                  |CAP CER 100PF MAX. 5% MIN. 10V 0805 SMD     |Any        |TBD               |SMD 0805           |SMD |     |
|2     |C1, C2, C12, C22, C32, C42            |6       |Any                   |TBD                  |CAP CER 100NF MAX. 5% MIN. 10V 0805 SMD     |Any        |TBD               |SMD 0805           |SMD |     |
|3     |D12, D22, D32, D42                    |4       |Shikues               |1N4007F              |DIODE 1N4007 SMAF                           |LCSC       |C110856           |SMAF               |SMD |     |
|4     |D11, D21, D31, D41                    |4       |Everlight Elec        |17-21SURC/S530-A3/TR8|LED RED 2V 0805 SMD                         |LCSC       |C72037            |SMD 0805           |SMD |     |
|5     |J1, J2, J3, J4                        |4       |Any                   |TBD                  |CONN JST-XH PITCH-2.50MM VERTICAL MALE 5 PIN|Any        |TBD               |Through Hole       |PTH |     |
|6     |J11, J21, J31, J41                    |4       |Ningbo Kangnex Elec   |WJ128V-5.0-3P        |CONN SCREW TERMINAL PITCH-5.0MM 3 PIN 20A   |LCSC       |C8270             |Through Hole       |PTH |     |
|7     |K11, K21, K31, K41                    |4       |Ningbo Songle Relay   |SRD-05VDC-SL-C       |RELAY SEALED SENSITIVE 5V 10A               |LCSC       |C35449            |Through Hole       |PTH |     |
|8     |Q1, Q2                                |2       |Shikues               |BSS138               |MOSFET N-CH SOT-23-3                        |LCSC       |C112239           |SOT-23-3           |SMD |     |
|9     |Q11, Q21, Q31, Q41                    |4       |Nexperia              |PMBT3904,215         |BJT NPN SOT-23-3                            |LCSC       |C8667             |SOT-23-3           |SMD |     |
|10    |R14, R24, R34, R44                    |4       |Any                   |TBD                  |RES 100 OHM MAX. 1% MIN. 1/8W 0805 SMD      |Any        |TBD               |SMD 0805           |SMD |     |
|11    |R11, R12, R21, R22, R31, R32, R41, R42|8       |Any                   |TBD                  |RES 200 OHM MAX. 1% MIN. 1/8W 0805 SMD      |Any        |TBD               |SMD 0805           |SMD |     |
|12    |R1, R13, R23, R33, R43                |5       |Any                   |TBD                  |RES 1K OHM MAX. 1% MIN. 1/8W 0805 SMD       |Any        |TBD               |SMD 0805           |SMD |     |
|13    |R2, R3, R4, R5, R15, R25, R35, R45    |8       |Any                   |TBD                  |RES 10K OHM MAX. 1% MIN. 1/8W 0805 SMD      |Any        |TBD               |SMD 0805           |SMD |     |
|14    |U1, U3                                |2       |Texas Instruments     |ADS1115IDGSR         |IC I2C 4 CH ADC VSSOP-10                    |LCSC       |C37593            |VSSOP-10           |SMD |     |
|15    |U12, U22, U32, U42                    |4       |Cross Chip            |CC6902SO-10A         |IC CURRENT SENSOR 5V 10A SOP-8              |LCSC       |C350865           |SOP-8              |SMD |     |
|16    |U11, U21, U31, U41                    |4       |Sharp Microelectronics|PC817X2CSP9F         |IC OPTOCOUPLER SMD-4                        |LCSC       |C66405            |SMD-4              |SMD |     |
|17    |U2                                    |1       |NXP Semicon           |PCA9557PW,118        |IC I2C 8 CH IO EXPANDER TSSOP-16            |LCSC       |C141380           |TSSOP-16           |SMD |     |

</details>