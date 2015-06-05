#!/bin/sh -evx

cd /tmp/
exec 2> ./init.log

PI="Pi1B+"
KERNEL=`uname -r`

### set the driver ###
insmod /home/pi/RaspberryPiMouse/lib/$PI/$KERNEL/rtmouse.ko
sleep 1
chmod 666 /dev/rt*

### run the main script ###
chmod a+x /home/pi/RPiM/core/main.bash
sudo -u pi /home/pi/RPiM/core/main.bash > /dev/null 2> /dev/null &
