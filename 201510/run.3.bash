#!/bin/bash -xv

source "$(dirname $(readlink -f $0))/actions"

while : ; do
	sleep 0.2
	curve_to_wall R
	sleep 0.2
	avoid_wall L
done
