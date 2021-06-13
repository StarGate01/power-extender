# Power Extender
Hardware for a power and IO extension PCB with current monitoring.


## Design Goals

 - Digital interface for RPi
 - 4 Relays (3 active + 1 hot spare)
   - Rated for min. 12V / 8A inductive loads (rotary pumps)
   - Current monitoring
 - ca. 4 additional digital IO pins (TTL)
 - ca. 4 additional analog input pins
 - Operate in damp, cold and hot environments

## Design

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
  - Availability at LCSC
  - SMD preferred due to size (assembly will be done at the fab)

### Selection

  - Standalone I2C port extender
  - Current measuring IC: ~~`ACS712ELCTR-20A-T`~~ `CC6902SO-10A`
  - Standalone I2C ADCs: `ADS1115IDGSR`
  - Relays: `SRD-05VDC-SL-C`
    - Coil sensitivity: 0.45W / 90 mA at 5V
    - Optocoupler: `PC817X2CSP9F`
      - Input: 1.2V
      - Transfer current: 6.5 - 13 mA
    - NPN Transistor: `2N3904S-RTK/PS`
    - Flyback diode: `1N4007`
  - Indicator LEDs
    - Red
    - 0603 format
  - Various passive components
    - 0603 format
