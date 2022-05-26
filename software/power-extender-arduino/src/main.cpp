/**
 * @file main.cpp
 * @author Christoph Honal
 * @brief Implements some test code for the power-extender library
 * @version 0.0.1
 * @date 2021-07-15
 */

#include <Arduino.h>

#include "PowerExtender.h"


PowerExtender power_extender;


void setup()
{
    Serial.begin(9600);
    Serial.println("Hello!");

    power_extender.begin();

    power_extender.setPinMode(PEPIN_DIN_1, INPUT);
    power_extender.setPinMode(PEPIN_DIN_2, INPUT);
    power_extender.setPinMode(PEPIN_DIN_3, OUTPUT);
}

double k1 = 0, k2 = 0, k3 = 0, k4 = 0;
uint8_t d1, d2;
int cnt = 0;
bool state = false;

void loop()
{
    k1 = power_extender.analogReadAsCurrent(PEPIN_AK1);
    k2 = power_extender.analogReadAsCurrent(PEPIN_AK2);
    k3 = power_extender.analogReadAsCurrent(PEPIN_AK3);
    k4 = power_extender.analogReadAsVoltage(PEPIN_A10);

    Serial.print(k1);
    Serial.print(";");
    Serial.print(k2);
    Serial.print(";");
    Serial.print(k3);
    Serial.print(";");
    Serial.print(k4);
    Serial.print(";");
    // Serial.print("\n");

    d1 = power_extender.digitalRead(PEPIN_DIN_1);
    d2 = power_extender.digitalRead(PEPIN_DIN_2);

    Serial.print(d1);
    Serial.print(";");
    Serial.print(d2);
    Serial.print("\n");

    if(cnt % 20 == 0)
    {
        state = !state;
        power_extender.digitalWrite(PEPIN_DOUT_K1, state? HIGH:LOW);
        power_extender.digitalWrite(PEPIN_DOUT_K2, state? HIGH:LOW);
        power_extender.digitalWrite(PEPIN_DOUT_K3, state? HIGH:LOW);
        power_extender.digitalWrite(PEPIN_DOUT_K4, state? HIGH:LOW);

        power_extender.digitalWrite(PEPIN_DOUT_3, state? LOW:HIGH);
    }

    cnt++;
    delay(100);
}
