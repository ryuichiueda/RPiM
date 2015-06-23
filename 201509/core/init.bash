#!/bin/bash
###プーッと短く音が鳴る###
echo 0 > /dev/rtmotoren0

echo 1000 > /dev/rtbuzzer0
sleep 0.2
echo 0 > /dev/rtbuzzer0

