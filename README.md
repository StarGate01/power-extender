# Power Extender
Hardware for a power and IO extension PCB with current monitoring.


## Design Goals

 - I2C interface for RPi
 - 4 Relays (3 active + 1 hot spare)
   - Rated for 12V / 150W
   - Current monitoring
 - ca. 4 additional digital IO pins (TTL)
 - ca. 4 additional analog input pins

## Rough Design:

 - Integrated I2C adapter ICs for digital IO
   - 4 dedicated relay control pins, 4 free to use
 - Dedicated current measuring IC per relay
 - Multi-channel ADC with I2C interface
 - Flyback relay protection
 - Indicator LEDs for debugging
 - JST connector for TTL signals
 - Heady duty screw terminals for high power connections

## Component selection

 - Constraints: 
   - Price
   - Availability at LCSC
   - SMD preferred due to size (assembly will be done at the fab)

- Selection:
  - Standalone min. 8-channel digital IO I2C extender
  - Current measuring ICs
  - Standalone min. 8-channel I2C ADC
  - Relays
  - Indicator LEDs
  - Various passive components

## PCB Design Considerations

 - Constraints defined by the fab (PCBWay)
 - 2-Layer board with ground planes
 - EMI due to current spikes when switching relays?
 - Analog signal pathways and high voltage