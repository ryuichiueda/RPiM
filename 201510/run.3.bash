#!/bin/bash -xv

source "$(dirname $(readlink -f $0))/actions"

while : ; do
	sleep 0.1
	curve_to_wall R
	sleep 0.1
	search_space L
done
