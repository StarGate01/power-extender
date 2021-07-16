/**
 * @file PowerExtender.cpp
 * @author Christoph Honal
 * @brief Implements the functions defined in PowerExtender.h
 * @version 0.0.1
 * @date 2021-07-15
 */


#include <Arduino.h>
#include <Wire.h>

#include "PowerExtender.h"


PowerExtender::PowerExtender()
{ }

void PowerExtender::begin()
{
    Wire.begin();

    // Init GPIO
    _writeRegister(PERIPHERAL_GPIO_ADDRESS, PCA9557_REG_CONTROL_CONFIGURATION, 0x00); // Set all GPIO to output
    _writeRegister(PERIPHERAL_GPIO_ADDRESS, PCA9557_REG_CONTROL_POLARITY_INVERSION, 0x00); // No polarity inversion
    _writeRegister(PERIPHERAL_GPIO_ADDRESS, PCA9557_REG_CONTROL_OUTPUT_PORT, 0x00); // Turn off all GPIOs

    // Init ADCs
    _reconfigureADC(PEPORT_AK);
    _reconfigureADC(PEPORT_A1);
}

void PowerExtender::pinMode(const PEPIN_D_IN pin, const uint8_t mode)
{
    if(pin > PEPIN_DIN_3 || pin < PEPIN_DIN_0) return; 

    // Clear or set bit in cached pinmap
    if(mode == OUTPUT) _gpio_mode &= ~(0x01 << pin);
    else if(mode == INPUT) _gpio_mode |= 0x01 << pin;

    // Upload pinmap
    _writeRegister(PERIPHERAL_GPIO_ADDRESS, PCA9557_REG_CONTROL_CONFIGURATION, _gpio_mode);
}

void PowerExtender::digitalWrite(const PEPIN_D_OUT pin, const uint8_t val)
{
    if(pin > PEPIN_DOUT_K4 || pin < PEPIN_DOUT_0) return; 

    // Clear or set bit in cached output map
    if(val == LOW) _gpio_out &= ~(0x01 << pin);
    else if(val == HIGH) _gpio_out |= (0x01 << pin);

    // Upload output map
    _writeRegister(PERIPHERAL_GPIO_ADDRESS, PCA9557_REG_CONTROL_OUTPUT_PORT, _gpio_out);
}

uint8_t PowerExtender::digitalRead(const PEPIN_D_IN pin)
{
    if(pin > PEPIN_DIN_3 || pin < PEPIN_DIN_0) return 0; 

    // Read from input map
    uint8_t state = _readRegister(PERIPHERAL_GPIO_ADDRESS, PCA9557_REG_CONTROL_INPUT_PORT);

    // Check specific pin
    return (state & (0x01 << pin))? HIGH : LOW;
}

void PowerExtender::setAnalogDataRate(const PEPORT_A port, const ADS1115_DR data_rate)
{
    if(port > PEPORT_A1 || port < PEPORT_AK) return; 

    // Set data rate and upload to ADC
    _data_rate[port] = data_rate;
    _reconfigureADC(port);
}

void PowerExtender::setAnalogGain(const PEPORT_A port, const ADS1115_PGA gain)
{
    if(port > PEPORT_A1 || port < PEPORT_AK) return; 

    // Set gain and upload to ADC
    _gain[port] = gain;
    _reconfigureADC(port);
}

double PowerExtender::analogReadAsVoltage(const PEPIN_A pin)
{
    if(!((pin >= PEPIN_AK1 && pin <= PEPIN_AK4) || 
        (pin >= PEPIN_A10 && pin <= PEPIN_A13))) return 0.0; 

    uint8_t port = (pin >= PEPIN_A10)? PEPORT_A1 : PEPORT_AK;
    uint8_t real_pin = (pin >= PEPIN_A10)? pin - PEPIN_A10 : pin;

    // Perform single shot measurement
    Wire.beginTransmission(_adc_address[port]);
    Wire.write(ADS1115_REG_POINTER_CONFIG);
    // Configure mux in open ended mode
    Wire.write(ADS1115_REG_CONFIG_HI_OS_BEGIN | ADS1115_REG_CONFIG_HI_MUX_AIN_N_GND |
        ((real_pin << ADS1115_REG_CONFIG_HI_MUX_AIN_P_OFFSET) & ADS1115_REG_CONFIG_HI_MUX_AIN_P_MASK) |
        _gain[port] | ADS1115_REG_CONFIG_HI_MODE_SINGLESHOT);
    Wire.write(_data_rate[port] | ADS1115_REG_CONFIG_LO_COMP_MODE_TRAD |
        ADS1115_REG_CONFIG_LO_COMP_POL_LOW | ADS1115_REG_CONFIG_LO_COMP_LAT_NON |
        ADS1115_REG_CONFIG_LO_COMP_QUE_DISABLE);
    Wire.endTransmission();

    int16_t adc_raw = 0;
    while(true)
    {
        // Read ADC status
        Wire.beginTransmission(_adc_address[port]);
        Wire.write(ADS1115_REG_POINTER_CONFIG);
        Wire.endTransmission();
        Wire.requestFrom(_adc_address[port], 2);
        uint8_t hi = Wire.read();
        uint8_t lo = Wire.read();

        // Check if conversion is done
        if((hi & ADS1115_REG_CONFIG_HI_OS_MASK) == ADS1115_REG_CONFIG_HI_OS_IDLE)
        {
            // Read converted value
            Wire.beginTransmission(_adc_address[port]);
            Wire.write(ADS1115_REG_POINTER_CONVERSION);
            Wire.endTransmission();
            Wire.requestFrom(_adc_address[port], 2);
            hi = Wire.read();
            lo = Wire.read();
            adc_raw = (int16_t)(((uint16_t)hi) << 8) | (uint16_t)lo;
            break;
        }

        // Wait heuristic time depending on sample rate
        delay(max(1, 1000 / (2 << ((_data_rate[port] >> ADS1115_REG_CONFIG_LO_DR_OFFSET) + 2))));
    }

    // Compute actual voltage
    double fs = 0.0;
    switch(_gain[port])
    {
        case PGA_6_144:
            fs = 6.144;
            break;
        case PGA_4_096:
            fs = 4.096;
            break;
        case PGA_2_048:
            fs = 2.048;
            break;
        case PGA_1_024:
            fs = 1.024;
            break;
        case PGA_0_512:
            fs = 0.512;
            break;
        case PGA_0_256:
            fs = 0.256;
            break;
    }
    return max(0.0, ((double)adc_raw * fs) / (double)0x8000);
}

double PowerExtender::analogReadAsCurrent(const PEPIN_A pin)
{
    // Assume 2.5V center point, +-10A range
    return abs((analogReadAsVoltage(pin) - 2.5) * 4.0);
}

void PowerExtender::_reconfigureADC(const PEPORT_A port)
{
    if(port > PEPORT_A1 || port < PEPORT_AK) return; 

    // Upload gain and data rate to ADC
    Wire.beginTransmission(_adc_address[port]);
    Wire.write(ADS1115_REG_POINTER_CONFIG);
    Wire.write(_gain[port] | ADS1115_REG_CONFIG_HI_MODE_SINGLESHOT);
    Wire.write(_data_rate[port]);
    Wire.endTransmission();
}

void PowerExtender::_writeRegister(const uint8_t address, uint8_t control, uint8_t data)
{
    // Write single byte to byte register
    Wire.beginTransmission(address);
    Wire.write(control);
    Wire.write(data);
    Wire.endTransmission();
}

uint8_t PowerExtender::_readRegister(const uint8_t address, uint8_t control)
{
    // Read single byte from byte register
    Wire.beginTransmission(address);
    Wire.write(control);
    Wire.endTransmission();
    Wire.requestFrom(address, 1);
    uint8_t result = Wire.read();
    return result;
}
       