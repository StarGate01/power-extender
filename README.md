# Power Extender

Hardware and software for a power and IO extension PCB with current monitoring and I2C interface.

This project has been generously supported by [PCBWay](https://www.pcbway.com/). Read more about this project and also my review of the manufacturing on my blog: [Article will be added soon] .

![PCB](https://raw.githubusercontent.com/StarGate01/power-extender/master/fabrication/rev1_1/delivery.jpg)

## Usage

Use [KiCad](https://www.kicad.org/) with my [CustomComponents](https://github.com/StarGate01/KiCadLibs) library to view and edit the hardware project, or download the [fabrication files](fabrication) for PCB and/or PCBA manufacturing. I used [KiBOM](https://github.com/SchrodingersGat/kibom) to generate the BOM. You can also download the complete [schematics as PDF](hardware/power-extender_schematics_rev1_1.pdf).

See the [Arduino library documentation](https://github.com/StarGate01/power-extender/tree/master/software/power-extender-arduino/lib/power-extender) for usage with the Arduino framework. The library is also available on [PlatformIO](https://platformio.org/lib/show/12563/power-extender). Use [Visual Studio Code](https://code.visualstudio.com/) and the [PlatformIO](https://platformio.org/) plugin to edit the Arduino library and tests.

## Features and Specifications

- Power input via `5V` and `3V3` pins
  - Min. `250mA @ 5V` to actuate all four relays simultaneously
  - Less than `30mA @ 5V` standby current
  - `3V3` voltage level is only required for I2C level shifting if the I2C signal level is `3.3V` instead of `5V`
- I2C bus for connection to a I2C master via JST header `RPI`
  - I2C bus passthrough via JST header `PASS`
  - Internal pullup resistors
  - Level-shifting `3.3V - 5V` tolerant bus
- Four `SRD-05VDC-SL-C` three-lead (`NC - COM - NO`) magnetic relays
  - Each has a `CC6902SO-10A` inductive current measuring IC connected across `COM`
  - Galvanically isolated driver circuit using an optocoupler
  - Flyback diode protection
  - Red status LED indicates `COM - NO` actuation
  - `2oz` thick copper traces enable high currents
  - Isolation milling reduces risk of shorting in damp environments
  - Maximum power: `10A, 250VAC, 110VDC`
  - Contact load rating: resistive `7A @ 28VDC`, `10A @ 125VAC`, `7A @ 240VAC`, inductive `3A @ 120VAC`, `3A @ 28VDC`
- One `PCA9557` 8-channel GPIO port (I2C address: `0x18`), logic level `0V | 5V`
  - GPIO channels `0Z` - `3` connected to JST header `DIGITAL`
  - Relays are connected to GPIO channels `4` - `7`
  - Maximum current (except channel `0Z`): `25mA` sink, `20mA` source per channel, max. total: `100mA` sink, `85mA` source
  - Channel `0Z` is high-impedance and open-drain (see datasheet for details)
- Two `ADS1115` 4-channel 16-bit ADC ports, voltage range `0V - 5V`
  - All four pins of ADC 1 connected to current measuring ICs (I2C address: `0x48`)
  - All four pins of ADC 2 connected to JST header `ANALOG` (I2C address: `0x49`)
  - Configurable sample rate and gain amplifier
  - Max. `10mA` continuous input current

For further specifications and ratings, all [datasheets](https://github.com/StarGate01/power-extender/tree/master/datasheets) can be found in this repository.

### Sensor Calibration

Due to the inherent nature of magnetic relays, the inductive current measuring ICs and also the ADCs experience a measurement offset while the relays are energized. It is recommended to measure the actual load at a distance from the board, in order to obtain reference values. These reference values should then be used to compute an offset or function for each channel and amount of relays energized. 

For no load (floating), the maximum absolute measurement offset was found to be about as follows.

| Amount of relays energized | Offset at energized channel | Offset at disabled channel |
| -------------------------- | --------------------------- | -------------------------- |
| 0                          | `0.05A`                     | `0.05A`                    |
| 1                          | `1A`                        | `0.7A`                     |
| 2                          | `1.5A`                      | `1.3A`                     |
| 3                          | `2A`                        | `1.8A`                     |
| 4                          | `2.4A`                      | N / A                      |

Please note that these offsets are dependent on load and environmental factors.


## PCB Details

**17 unique** parts, **60 SMT** parts, **12 THT** parts on a double-sided `90mm x 71mm` PCB with `2oz` copper finish.

Component cost per board: about `$25` at [LCSC](https://lcsc.com/) (Ignoring shipping, bulk discounts and changes in price over time).

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
