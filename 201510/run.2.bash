#!/bin/bash -xv

source "$(dirname $(readlink -f $0))/actions"

for n in 90 -90 90 -90 ; do
	turn $n
	sleep 0.5
done
