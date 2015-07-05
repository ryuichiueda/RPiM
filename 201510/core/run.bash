#!/bin/bash -xv

source "$(dirname $0)/../util/actions"

echo 300 | tee /dev/rtmotor_raw_?0 > /dev/null
sleep 3
stop
