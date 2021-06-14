# Power Extender

Hardware for a power and IO extension PCB with current monitoring.

## Usage

Use [KiCad](https://www.kicad.org/) and my [CustomComponents](https://github.com/StarGate01/KiCadLibs) to view and edit this project.


## Design

### Goals

 - Serial interface for RPi
 - 4 Relays (3 active + 1 hot spare)
   - Rated for min. 12V / 8A inductive loads (rotary pumps)
   - Current monitoring
 - ca. 4 additional digital IO pins (TTL)
 - ca. 4 additional analog input pins
 - Operate in damp, cold and hot environments

### Board

  - Dual layer with ground planes
  - Isolation routing for digital signals
  - Bare routing without ground plane for high voltages
  - Large spacing for high power traces
  - 2oz/ft copper weight to carry 10A in ~4mm traces
  - Isolation milling to limit creepage (?)

### Interfacing

  - JST connector for VDD, GND and I2C signals
  - 4 aux digital IO pins and 4 aux ADC pins
  - High power interface directly at relay outputs
  - Arduino compatible pin headers for aux signals
  - 5V circuit due to current draw and RPi limits
  - Voltage level-shifter for I2C
   
### Relay subsystem

  - Min. 100W inductive DC load
  - Flyback diode to limit switching inductive power surge
  - Indicator LED with resistor
  - Stage 1 optocoupler for galvanic isolation from high power noise
  - Stage 2 NPN transistor to drive the relay coil from coupler output
  - Heavy duty screw terminals for high power connections

### Power monitoring subsystem

  - Hall loop of sensor connected across relay load
  - Analog output connected to ADC
  - Prevent high power induction into signal traces (?)
  - Multi-channel ADC connected to I2C bus
 
 
## Component selection

### Constraints

  - Price
  - In stock at LCSC
  - SMD preferred, assembly will be done at the fab

### Selection

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
  - Indicator LEDs: `17-21SURC/S530-A3/TR8`
    - 200 Ohm resistor for 2V, ca. 15 mA
    - Red, 0805 format
  - Resistors and capacitors
    - 0805 format
  - Shifting MOSFETS: `BSS138`
    - SOT-23 format
