#!/bin/bash -xv

exec &> /tmp/main.bash.log
core=$(dirname $0)

wait_sw () {
        set +xv
        while grep -q 1 /dev/rtswitch0 ; do
                sleep 0.1
        done
        while grep -q 0 /dev/rtswitch0 ; do
                sleep 0.1
        done
        set -xv
}

while true ; do
        $core/init.bash
        wait_sw
        $core/set.bash
        wait_sw
        $core/run.bash &
        wait_sw
        killall -1 run.bash
done
