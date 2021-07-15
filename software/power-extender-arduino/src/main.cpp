/**
 * @file main.cpp
 * @author Christoph Honal
 * @brief Implements some test code for the power-extender library
 * @version 0.0.1
 * @date 2021-07-15
 */

#include <Arduino.h>

#include "PowerExtender.h"


PowerExtender power_extender();


void setup() 
{
    Serial.begin(9600);
    Serial.println("Hello World!");
}

void loop() 
{

}