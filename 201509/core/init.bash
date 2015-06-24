#!/bin/bash

echo 0 > /dev/rtled1
echo 0 > /dev/rtled2

###プーッと短く音が鳴る###
echo 0 > /dev/rtmotoren0
echo 0 > /dev/rtmotor_raw_l0
echo 0 > /dev/rtmotor_raw_r0

echo 1000 > /dev/rtbuzzer0
sleep 0.2
echo 0 > /dev/rtbuzzer0

echo 1 > /dev/rtled0
