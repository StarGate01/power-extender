# class `PowerExtender` <a id="classPowerExtender"></a>

Class to interface the power-extender.

## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
`public  `[`PowerExtender`](#classPowerExtender_1a80c1741a40c9457be1dd2f036e7edfc9)`()` | Construct a new Power Extender object.
`public void `[`begin`](#classPowerExtender_1afd100c8d722c9ddca91f130b458966bd)`()` | Begin I2C communication.
`public void `[`setPinMode`](#classPowerExtender_1a646d016a4b9701847c3467cad0b139b7)`(const `[`PEPIN_D_IN`](#PowerExtender_8h_1a685519a6a58a2e8ad4f2ce6af2510799)` pin,const uint8_t mode)` | Configure the IO direction of a GPIO pin.
`public void `[`digitalWrite`](#classPowerExtender_1a23b7ab524d28626d51db4e3f1762192b)`(const `[`PEPIN_D_OUT`](#PowerExtender_8h_1a07782b9be93fe6cb58069f9b1a771a30)` pin,const uint8_t val)` | Change the state of a GPIO output pin.
`public uint8_t `[`digitalRead`](#classPowerExtender_1ab618f5536a2d8255eeb173ac5fab63b6)`(const `[`PEPIN_D_IN`](#PowerExtender_8h_1a685519a6a58a2e8ad4f2ce6af2510799)` pin)` | Reads the state of a digital input pin.
`public void `[`setAnalogDataRate`](#classPowerExtender_1a32828af582b59d6ac0806719d10f4c5a)`(const `[`PEPORT_A`](#PowerExtender_8h_1ad485c9fc79e6f2c1769c0f37be04af7c)` port,const ADS1115_DR data_rate)` | Set the data rate for a whole ADC.
`public void `[`setAnalogGain`](#classPowerExtender_1a8c17b5f73b6b5f6642a196cb489826eb)`(const `[`PEPORT_A`](#PowerExtender_8h_1ad485c9fc79e6f2c1769c0f37be04af7c)` port,const ADS1115_PGA gain)` | Set the gain for a whole ADC.
`public double `[`analogReadAsVoltage`](#classPowerExtender_1a0f3bfdc12295b7241377cb1136f8d152)`(const `[`PEPIN_A`](#PowerExtender_8h_1a8ceac853d8a64b38bef008dc6f666f93)` pin)` | Reads from an ADC, convert to input voltage.
`public double `[`analogReadAsCurrent`](#classPowerExtender_1abe53dd52cd6d55e81ca92a35c53ce69f)`(const `[`PEPIN_A`](#PowerExtender_8h_1a8ceac853d8a64b38bef008dc6f666f93)` pin)` | Reads from an ADC, convert to output from current sensor.

## Members

#### `public  `[`PowerExtender`](#classPowerExtender_1a80c1741a40c9457be1dd2f036e7edfc9)`()` <a id="classPowerExtender_1a80c1741a40c9457be1dd2f036e7edfc9"></a>

Construct a new Power Extender object.

#### `public void `[`begin`](#classPowerExtender_1afd100c8d722c9ddca91f130b458966bd)`()` <a id="classPowerExtender_1afd100c8d722c9ddca91f130b458966bd"></a>

Begin I2C communication.

#### `public void `[`setPinMode`](#classPowerExtender_1a646d016a4b9701847c3467cad0b139b7)`(const `[`PEPIN_D_IN`](#PowerExtender_8h_1a685519a6a58a2e8ad4f2ce6af2510799)` pin,const uint8_t mode)` <a id="classPowerExtender_1a646d016a4b9701847c3467cad0b139b7"></a>

Configure the IO direction of a GPIO pin.

#### Parameters
* `pin` Which pin to configure 

* `mode` INPUT or OUTPUT

#### `public void `[`digitalWrite`](#classPowerExtender_1a23b7ab524d28626d51db4e3f1762192b)`(const `[`PEPIN_D_OUT`](#PowerExtender_8h_1a07782b9be93fe6cb58069f9b1a771a30)` pin,const uint8_t val)` <a id="classPowerExtender_1a23b7ab524d28626d51db4e3f1762192b"></a>

Change the state of a GPIO output pin.

#### Parameters
* `pin` Which pin to change 

* `val` HIGH or LOW

#### `public uint8_t `[`digitalRead`](#classPowerExtender_1ab618f5536a2d8255eeb173ac5fab63b6)`(const `[`PEPIN_D_IN`](#PowerExtender_8h_1a685519a6a58a2e8ad4f2ce6af2510799)` pin)` <a id="classPowerExtender_1ab618f5536a2d8255eeb173ac5fab63b6"></a>

Reads the state of a digital input pin.

#### Parameters
* `pin` Which pin to read 

#### Returns
HIGH or LOW

#### `public void `[`setAnalogDataRate`](#classPowerExtender_1a32828af582b59d6ac0806719d10f4c5a)`(const `[`PEPORT_A`](#PowerExtender_8h_1ad485c9fc79e6f2c1769c0f37be04af7c)` port,const ADS1115_DR data_rate)` <a id="classPowerExtender_1a32828af582b59d6ac0806719d10f4c5a"></a>

Set the data rate for a whole ADC.

#### Parameters
* `port` Which ADC port to configure 

* `data_rate` The new data rate

#### `public void `[`setAnalogGain`](#classPowerExtender_1a8c17b5f73b6b5f6642a196cb489826eb)`(const `[`PEPORT_A`](#PowerExtender_8h_1ad485c9fc79e6f2c1769c0f37be04af7c)` port,const ADS1115_PGA gain)` <a id="classPowerExtender_1a8c17b5f73b6b5f6642a196cb489826eb"></a>

Set the gain for a whole ADC.

#### Parameters
* `port` Which ADC to configure 

* `gain` The new gain

#### `public double `[`analogReadAsVoltage`](#classPowerExtender_1a0f3bfdc12295b7241377cb1136f8d152)`(const `[`PEPIN_A`](#PowerExtender_8h_1a8ceac853d8a64b38bef008dc6f666f93)` pin)` <a id="classPowerExtender_1a0f3bfdc12295b7241377cb1136f8d152"></a>

Reads from an ADC, convert to input voltage.

#### Parameters
* `pin` Which pin to read 

#### Returns
The resulting value in volt

#### `public double `[`analogReadAsCurrent`](#classPowerExtender_1abe53dd52cd6d55e81ca92a35c53ce69f)`(const `[`PEPIN_A`](#PowerExtender_8h_1a8ceac853d8a64b38bef008dc6f666f93)` pin)` <a id="classPowerExtender_1abe53dd52cd6d55e81ca92a35c53ce69f"></a>

Reads from an ADC, convert to output from current sensor.

#### Parameters
* `pin` Which pin to read 

#### Returns
The resulting value in ampere

Generated by [Moxygen](https://sourcey.com/moxygen)