#!/bin/bash -xv

source "$(dirname $0)/../../util/actions"

forward_to_wall 2500 >> /run/shm/hoge
turn_avoid_wall R
forward_to_wall 4000 >> /run/shm/hoge
