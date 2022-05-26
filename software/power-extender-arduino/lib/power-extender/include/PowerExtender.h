/**
 * @file PowerExtender.h
 * @author Christoph Honal
 * @brief Defines function to interface the power-extender board
 * @version 0.0.1
 * @date 2021-07-15
 */

#ifndef POWER_EXTENDER_H
#define POWER_EXTENDER_H

#include <Arduino.h>
#include <Wire.h>

#include "ADS1115_Registers.h"
#include "PCA9557_Registers.h"


#define PERIPHERAL_GPIO_ADDRESS         0x18 //!< I2C address of the GPIO IC
#define PERIPHERAL_ADC_RELAY_ADDRESS    0x48 //!< I2C address of the ADC connected to the relays
#define PERIPHERAL_ADC_AUX_ADDRESS      0x49 //!< I2C address of the ADC connected to the external pins 


/**
 * @brief Existing GPIO pins for output
 * 
 */
enum PEPIN_D_OUT : uint8_t
{
    PEPIN_DOUT_0Z = 0,
    PEPIN_DOUT_1 = 1,
    PEPIN_DOUT_2 = 2,
    PEPIN_DOUT_3 = 3,
    PEPIN_DOUT_K1 = 4,
    PEPIN_DOUT_K2 = 5,
    PEPIN_DOUT_K3 = 6,
    PEPIN_DOUT_K4 = 7
};

/**
 * @brief Existing GPIO pins for input
 * 
 */
enum PEPIN_D_IN : uint8_t
{
    PEPIN_DIN_0Z = 0,
    PEPIN_DIN_1 = 1,
    PEPIN_DIN_2 = 2,
    PEPIN_DIN_3 = 3
};

/**
 * @brief Existing analog ports (separate ADC ICs)
 * 
 */
enum PEPORT_A : uint8_t
{
    PEPORT_AK = 0,
    PEPORT_A1 = 1
};

/**
 * @brief Existing analog pins
 * 
 */
enum PEPIN_A : uint8_t
{
    PEPIN_AK1 = 0,
    PEPIN_AK2 = 1,
    PEPIN_AK3 = 2,
    PEPIN_AK4 = 3,
    PEPIN_A10 = 10,
    PEPIN_A11 = 11,
    PEPIN_A12 = 12,
    PEPIN_A13 = 13
};



/**
 * @brief Class to interface the power-extender
 * 
 */
class PowerExtender
{

    public:
        /**
         * @brief Construct a new Power Extender object
         * 
         */
        PowerExtender();

        /**
         * @brief Begin I2C communication
         * 
         */
        void begin();

        /**
         * @brief Configure the IO direction of a GPIO pin
         * 
         * @param pin Which pin to configure
         * @param mode INPUT or OUTPUT
         */
        void setPinMode(const PEPIN_D_IN pin, const uint8_t mode);

        /**
         * @brief Change the state of a GPIO output pin
         * 
         * @param pin Which pin to change
         * @param val HIGH or LOW
         */
        void digitalWrite(const PEPIN_D_OUT pin, const uint8_t val);

        /**
         * @brief Reads the state of a digital input pin
         * 
         * @param pin Which pin to read
         * @return HIGH or LOW
         */
        uint8_t digitalRead(const PEPIN_D_IN pin);

        /**
         * @brief Set the data rate for a whole ADC
         * 
         * @param port Which ADC port to configure
         * @param data_rate The new data rate
         */
        void setAnalogDataRate(const PEPORT_A port, const ADS1115_DR data_rate);

        /**
         * @brief Set the gain for a whole ADC
         * 
         * @param port Which ADC to configure
         * @param gain The new gain
         */
        void setAnalogGain(const PEPORT_A port, const ADS1115_PGA gain);

        /**
         * @brief Reads from an ADC, convert to input voltage
         * 
         * @param pin Which pin to read
         * @return The resulting value in volt
         */
        double analogReadAsVoltage(const PEPIN_A pin);

        /**
         * @brief Reads from an ADC, convert to output from current sensor
         * 
         * @param pin Which pin to read
         * @return The resulting value in ampere
         */
        double analogReadAsCurrent(const PEPIN_A pin);

    protected:
        const uint8_t _adc_address[2] = { PERIPHERAL_ADC_RELAY_ADDRESS, PERIPHERAL_ADC_AUX_ADDRESS }; //!< ADC address map
        uint8_t _gpio_out = 0x00, _gpio_mode = 0x00; //!< GPIO register chache
        ADS1115_DR _data_rate[2] = { ADS1115_DR_64, ADS1115_DR_64 }; //!< Configured data rates
        ADS1115_PGA _gain[2] = { ADS1115_PGA_6_144, ADS1115_PGA_6_144 }; //!< Configured gains

        /**
         * @brief Reinitializes a ADC
         * 
         * @param port Which ADC to initialize
         */
        void _reconfigureADC(const PEPORT_A port);

        /**
         * @brief Writes a byte to a register
         * 
         * @param address The I2C address
         * @param control The register address
         * @param data The new register data
         */
        void _writeRegister(const uint8_t address, uint8_t control, uint8_t data);

        /**
         * @brief Reads a byte from a register
         * 
         * @param address The I2C address
         * @param control The register address
         * @return The register data
         */
        uint8_t _readRegister(const uint8_t address, uint8_t control);

};


#endif
