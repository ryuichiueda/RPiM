#!/bin/bash

###低い音で鳴り続ける（モータ励磁の警告音）###
echo 100 > /dev/rtbuzzer0
echo 1 > /dev/rtmotoren0
