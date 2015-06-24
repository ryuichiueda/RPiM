#!/bin/bash

trap 'exit 0' 1

echo 1 > /dev/rtled2
echo 0 > /dev/rtbuzzer0

echo 400 > /dev/rtmotor_raw_l0
echo 400 > /dev/rtmotor_raw_r0
