#!/bin/bash

trap 'exit 0' 1

###前進###
echo 400 > /dev/rtmotor_raw_l0
echo 400 > /dev/rtmotor_raw_r0

###壁が近づくと止める処理###

#/tmp/warningに何か書かれたらループを出る
: > /tmp/warning
while [ ! -s /tmp/warning ] ; do
	cat /dev/rtlightsensor0		|
	awk '$1+$2+$3+$4>500{print "STOP"}' > /tmp/warning
	sleep 0.2
done

###止める###
echo 0 > /dev/rtmotor_raw_l0
echo 0 > /dev/rtmotor_raw_r0
