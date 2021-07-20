#!/usr/bin/env python3

##
# @file main.py
# @author Christoph Honal
# @brief Implements some test code for the pypowerextender library
# @version 0.0.1
# @date 2021-07-20


import time

from pypowerextender import PowerExtender


power_extender = PowerExtender.PowerExtender()


def setup():
    print("Hello!\n")
    power_extender.begin()
    power_extender.pinMode(PowerExtender.PEPIN_D_IN.PEPIN_DIN_1, PowerExtender.PINMODE.INPUT)
    power_extender.pinMode(PowerExtender.PEPIN_D_IN.PEPIN_DIN_2, PowerExtender.PINMODE.INPUT)
    power_extender.pinMode(PowerExtender.PEPIN_D_IN.PEPIN_DIN_3, PowerExtender.PINMODE.OUTPUT)
    

cnt = 0
state = False

def loop():
    global cnt, state
    
    k1 = power_extender.analogReadAsCurrent(PowerExtender.PEPIN_A.PEPIN_AK1);
    k2 = power_extender.analogReadAsCurrent(PowerExtender.PEPIN_A.PEPIN_AK2);
    k3 = power_extender.analogReadAsCurrent(PowerExtender.PEPIN_A.PEPIN_AK3);
    k4 = power_extender.analogReadAsVoltage(PowerExtender.PEPIN_A.PEPIN_A10);

    d1 = power_extender.digitalRead(PowerExtender.PEPIN_D_IN.PEPIN_DIN_1);
    d2 = power_extender.digitalRead(PowerExtender.PEPIN_D_IN.PEPIN_DIN_2);

    print(str(round(k1, 3)) + ";" + str(round(k2, 3)) + ";" + str(round(k3, 3)) + ";" + str(round(k4, 3)) + ";" + str(int(d1)) + ";" + str(int(d2)))

    if(cnt % 20 == 0):
        state = not state
        power_extender.digitalWrite(PowerExtender.PEPIN_D_OUT.PEPIN_DOUT_K1, PowerExtender.PINSTATE.HIGH if state else PowerExtender.PINSTATE.LOW)
        power_extender.digitalWrite(PowerExtender.PEPIN_D_OUT.PEPIN_DOUT_K2, PowerExtender.PINSTATE.HIGH if state else PowerExtender.PINSTATE.LOW)
        power_extender.digitalWrite(PowerExtender.PEPIN_D_OUT.PEPIN_DOUT_K3, PowerExtender.PINSTATE.HIGH if state else PowerExtender.PINSTATE.LOW)
        power_extender.digitalWrite(PowerExtender.PEPIN_D_OUT.PEPIN_DOUT_K4, PowerExtender.PINSTATE.HIGH if state else PowerExtender.PINSTATE.LOW)

        power_extender.digitalWrite(PowerExtender.PEPIN_D_OUT.PEPIN_DOUT_3, PowerExtender.PINSTATE.HIGH if state else PowerExtender.PINSTATE.LOW)

    cnt += 1
    time.sleep(0.1)


if __name__ == "__main__":
    setup()
    while(True): loop()