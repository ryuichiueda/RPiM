#!/bin/bash -xv

while sleep 0.1 ; do
	cat /dev/rtswitch1	|
	tr -dc '01\n'
done	|
gawk 'BEGIN{a=0}/0/{a++;print a}/1/{a=0}a>=30{system("sudo reboot")}'

