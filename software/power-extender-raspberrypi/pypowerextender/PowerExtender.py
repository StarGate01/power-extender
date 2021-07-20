## @package pypowerextender
# @file PowerExtender.py
# @author Christoph Honal
# @brief Defines function to interface the power-extender board
# @version 0.0.1
# @date 2021-07-20

from enum import IntEnum
import smbus
import time

from . import ADS1115_Registers
from . import PCA9557_Registers


PERIPHERAL_GPIO_ADDRESS = 0x18 ## I2C address of the GPIO IC
PERIPHERAL_ADC_RELAY_ADDRESS = 0x48 ## I2C address of the ADC connected to the relays
PERIPHERAL_ADC_AUX_ADDRESS = 0x49 ## I2C address of the ADC connected to the external pins 

## Existing GPIO pins for output
class PEPIN_D_OUT(IntEnum):
    PEPIN_DOUT_0Z = 0
    PEPIN_DOUT_1 = 1
    PEPIN_DOUT_2 = 2
    PEPIN_DOUT_3 = 3
    PEPIN_DOUT_K1 = 4
    PEPIN_DOUT_K2 = 5
    PEPIN_DOUT_K3 = 6
    PEPIN_DOUT_K4 = 7

## Existing GPIO pins for input
class PEPIN_D_IN(IntEnum):
    PEPIN_DIN_0Z = 0
    PEPIN_DIN_1 = 1
    PEPIN_DIN_2 = 2
    PEPIN_DIN_3 = 3

## Existing analog ports (separate ADC ICs)
class PEPORT_A(IntEnum):
    PEPORT_AK = 0
    PEPORT_A1 = 1

## Existing analog pins
class PEPIN_A(IntEnum):
    PEPIN_AK1 = 0
    PEPIN_AK2 = 1
    PEPIN_AK3 = 2
    PEPIN_AK4 = 3
    PEPIN_A10 = 10
    PEPIN_A11 = 11
    PEPIN_A12 = 12
    PEPIN_A13 = 13

## Pinmode definitions
class PINMODE(IntEnum):
    INPUT = 0
    OUTPUT = 1

## Pinstate definitions
class PINSTATE(IntEnum):
    LOW = 0
    HIGH = 1


## Class to interface the power-extender
class PowerExtender:

    ## Construct a new Power Extender object
    def __init__(self):
        self._adc_address = [ PERIPHERAL_ADC_RELAY_ADDRESS, PERIPHERAL_ADC_AUX_ADDRESS ] ## ADC address map
        self._gpio_out = 0x00 ## GPIO register chache
        self._gpio_mode = 0x00 ## GPIO register chache
        self._data_rate = [ ADS1115_Registers.ADS1115_DR.DR_64, ADS1115_Registers.ADS1115_DR.DR_64 ] ## Configured data rates
        self._gain = [ ADS1115_Registers.ADS1115_PGA.PGA_6_144, ADS1115_Registers.ADS1115_PGA.PGA_6_144 ] ## Configured gains


    ## Begin I2C communication
    def begin(self, bus: int = 1):
        self._bus = smbus.SMBus(bus)

        # Init GPIO
        self._writeRegister(PERIPHERAL_GPIO_ADDRESS, PCA9557_Registers.PCA9557_REG_CONTROL_CONFIGURATION, 0x00) # Set all GPIO to output
        self._writeRegister(PERIPHERAL_GPIO_ADDRESS, PCA9557_Registers.PCA9557_REG_CONTROL_POLARITY_INVERSION, 0x00) # No polarity inversion
        self._writeRegister(PERIPHERAL_GPIO_ADDRESS, PCA9557_Registers.PCA9557_REG_CONTROL_OUTPUT_PORT, 0x00) # Turn off all GPIOs

        # Init ADCs
        self._reconfigureADC(PEPORT_A.PEPORT_AK)
        self._reconfigureADC(PEPORT_A.PEPORT_A1)


    ## Configure the IO direction of a GPIO pin
    #
    # @param pin Which pin to configure
    # @param mode INPUT or OUTPUT
    def pinMode(self, pin: PEPIN_D_IN, mode: PINMODE):
        if(pin > PEPIN_D_IN.PEPIN_DIN_3 or pin < PEPIN_D_IN.PEPIN_DIN_0Z): return

        # Clear or set bit in cached pinmap
        if(mode == PINMODE.OUTPUT): self._gpio_mode &= ~(0x01 << pin)
        elif(mode == PINMODE.INPUT): self._gpio_mode |= 0x01 << pin

        # Upload pinmap
        self._writeRegister(PERIPHERAL_GPIO_ADDRESS, PCA9557_Registers.PCA9557_REG_CONTROL_CONFIGURATION, self._gpio_mode)


    ## Change the state of a GPIO output pin
    # 
    # @param pin Which pin to change
    # @param val HIGH or LOW
    def digitalWrite(self, pin: PEPIN_D_OUT, val: PINSTATE):
        if(pin > PEPIN_D_OUT.PEPIN_DOUT_K4 or pin < PEPIN_D_OUT.PEPIN_DOUT_0Z): return

        # Clear or set bit in cached output map
        if(val == PINSTATE.LOW): self._gpio_out &= ~(0x01 << pin)
        elif(val == PINSTATE.HIGH): self._gpio_out |= (0x01 << pin)

        # Upload output map
        self._writeRegister(PERIPHERAL_GPIO_ADDRESS, PCA9557_Registers.PCA9557_REG_CONTROL_OUTPUT_PORT, self._gpio_out)


    ## Reads the state of a digital input pin
    # 
    # @param pin Which pin to read
    # @return HIGH or LOW
    def digitalRead(self, pin: PEPIN_D_IN) -> PINSTATE:
        if(pin > PEPIN_D_IN.PEPIN_DIN_3 or pin < PEPIN_D_IN.PEPIN_DIN_0Z): return 0

        # Read from input map
        state = self._readRegister(PERIPHERAL_GPIO_ADDRESS, PCA9557_Registers.PCA9557_REG_CONTROL_INPUT_PORT)

        # Check specific pin
        return PINSTATE.HIGH if (state & (0x01 << pin)) else PINSTATE.LOW


    ## Set the data rate for a whole ADC
    # 
    # @param port Which ADC port to configure
    # @param data_rate The new data rate
    def setAnalogDataRate(self, port: PEPORT_A, data_rate: ADS1115_Registers.ADS1115_DR):
        if(port > PEPORT_A.PEPORT_A1 or port < PEPORT_A.PEPORT_AK): return

        # Set data rate and upload to ADC
        self._data_rate[port] = data_rate
        self._reconfigureADC(port)


    ## Set the gain for a whole ADC
    # 
    # @param port Which ADC to configure
    # @param gain The new gain
    def setAnalogGain(self, port: PEPORT_A, gain: ADS1115_Registers.ADS1115_PGA):
        if(port > PEPORT_A.PEPORT_A1 or port < PEPORT_A.PEPORT_AK): return

        # Set gain and upload to ADC
        self._gain[port] = gain
        self._reconfigureADC(port)


    ## Reads from an ADC, convert to input voltage
    # 
    # @param pin Which pin to read
    # @return The resulting value in volt
    def analogReadAsVoltage(self, pin: PEPIN_A) -> float:
        if(not ((pin >= PEPIN_A.PEPIN_AK1 or pin <= PEPIN_A.PEPIN_AK4) or 
            (pin >= PEPIN_A.PEPIN_A10 or pin <= PEPIN_A.PEPIN_A13))): return 0.0 

        port = PEPORT_A.PEPORT_A1 if (pin >= PEPIN_A.PEPIN_A10) else PEPORT_A.PEPORT_AK
        real_pin = pin - PEPIN_A.PEPIN_A10 if (pin >= PEPIN_A.PEPIN_A10) else pin

        # Perform single shot measurement
        # Configure mux in open ended mode
        self._bus.write_i2c_block_data(self._adc_address[port], ADS1115_Registers.ADS1115_REG_POINTER_CONFIG, [
            (ADS1115_Registers.ADS1115_REG_CONFIG_HI_OS_BEGIN | ADS1115_Registers.ADS1115_REG_CONFIG_HI_MUX_AIN_N_GND |
                ((real_pin << ADS1115_Registers.ADS1115_REG_CONFIG_HI_MUX_AIN_P_OFFSET) & ADS1115_Registers.ADS1115_REG_CONFIG_HI_MUX_AIN_P_MASK) |
                self._gain[port] | ADS1115_Registers.ADS1115_REG_CONFIG_HI_MODE_SINGLESHOT),
            (self._data_rate[port] | ADS1115_Registers.ADS1115_REG_CONFIG_LO_COMP_MODE_TRAD |
                ADS1115_Registers.ADS1115_REG_CONFIG_LO_COMP_POL_LOW | ADS1115_Registers.ADS1115_REG_CONFIG_LO_COMP_LAT_NON |
                ADS1115_Registers.ADS1115_REG_CONFIG_LO_COMP_QUE_DISABLE)
        ])

        adc_raw = 0
        while(True):
            # Read ADC status
            hilo = self._bus.read_i2c_block_data(self._adc_address[port], ADS1115_Registers.ADS1115_REG_POINTER_CONFIG, 2)
            
            # Check if conversion is done
            if((hilo[0] & ADS1115_Registers.ADS1115_REG_CONFIG_HI_OS_MASK) == ADS1115_Registers.ADS1115_REG_CONFIG_HI_OS_IDLE):
                # Read converted value
                adc_raw = int.from_bytes(self._bus.read_i2c_block_data(self._adc_address[port], ADS1115_Registers.ADS1115_REG_POINTER_CONVERSION, 2),
                    byteorder='big', signed=True)
                break

            # Wait heuristic time depending on sample rate
            time.sleep(max(1.0, 1000.0 / (2 << ((self._data_rate[port] >> ADS1115_Registers.ADS1115_REG_CONFIG_LO_DR_OFFSET) + 2))) / 1000.0)

        # Compute actual voltage
        fs = 0.0
        if(self._gain[port] == ADS1115_Registers.ADS1115_PGA.PGA_6_144):
            fs = 6.144
        elif(self._gain[port] == ADS1115_Registers.ADS1115_PGA.PGA_4_096):
            fs = 4.096
        elif(self._gain[port] == ADS1115_Registers.ADS1115_PGA.PGA_2_048):
            fs = 2.048
        elif(self._gain[port] == ADS1115_Registers.ADS1115_PGA.PGA_1_024):
            fs = 1.024
        elif(self._gain[port] == ADS1115_Registers.ADS1115_PGA.PGA_0_512):
            fs = 0.512
        elif(self._gain[port] == ADS1115_Registers.ADS1115_PGA.PGA_0_256):
            fs = 0.256

        return max(0.0, (float(adc_raw) * fs) / float(0x8000))


    ## Reads from an ADC, convert to output from current sensor
    # 
    # @param pin Which pin to read
    # @return The resulting value in ampere
    def analogReadAsCurrent(self, pin: PEPIN_A) -> float:
        # Assume 2.5V center point, +-10A range
        current = (self.analogReadAsVoltage(pin) - 2.5) * 4.0

        # Current changes direction depending on relay wiring
        return abs(current)


    ## Reinitializes a ADC
    # 
    # @param port Which ADC to initialize
    def _reconfigureADC(self, port: PEPORT_A):
        if(port > PEPORT_A.PEPORT_A1 or port < PEPORT_A.PEPORT_AK): return

        # Upload gain and data rate to ADC
        self._bus.write_i2c_block_data(self._adc_address[port], ADS1115_Registers.ADS1115_REG_POINTER_CONFIG, [
                (self._gain[port] | ADS1115_Registers.ADS1115_REG_CONFIG_HI_MODE_SINGLESHOT), 
                (self._data_rate[port])
        ])


    ## Writes a byte to a register
    # 
    # @param address The I2C address
    # @param control The register address
    # @param data The new register data
    def _writeRegister(self, address: int, control: int, data: int):
        # Write single byte to byte register
        self._bus.write_i2c_block_data(address, control, [data])


    ## Reads a byte from a register
    # 
    # @param address The I2C address
    # @param control The register address
    # @return The register data
    def _readRegister(self, address: int, control: int) -> int:
        # Read single byte from byte register
        return self._bus.read_i2c_block_data(address, control, 1)[0]

