#!/bin/bash -xv

source "$(dirname $(readlink -f $0))/actions"

for n in 500 -500 500 -500 ; do
	forward $n
	sleep 0.5
done
