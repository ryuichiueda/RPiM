#!/bin/bash -xv

source "$(dirname $0)/../../util/actions"

while : ; do
	forward_to_wall_fether
	turn_avoid_wall R
done
#forward_to_wall 4000 >> /run/shm/hoge
