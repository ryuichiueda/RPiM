#!/bin/bash -xv

exec &> /tmp/main.bash.log
core=$(dirname $0)
util="$core/../../util"

while true ; do
        $core/init.bash
	$util/wait_sw_push 0
	$util/wait_sw_unpush 0
        $core/set.bash
	$util/wait_sw_push 0
	$util/wait_sw_unpush 0
        $core/run.bash &
	$util/wait_sw_push 0
	$util/wait_sw_unpush 0
        killall -1 run.bash
done
