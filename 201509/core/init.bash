#!/bin/bash -e

###LEDを消す###
echo 0 > /dev/rtled1
echo 0 > /dev/rtled2

###モータを止める###
echo 0 > /dev/rtmotoren0
echo 0 > /dev/rtmotor_raw_l0
echo 0 > /dev/rtmotor_raw_r0

