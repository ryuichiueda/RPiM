#!/bin/bash -xv

source "$(dirname $(readlink -f $0))/actions"

while : ; do
	curve_to_wall R
	search_space L
done
