#!/bin/bash -xv

source "$(dirname $(readlink -f $0))/actions"
tmp=/run/shm/tmp$$
log=/home/pi/log

balance () {
	while : ; do
		awk '$2+$3>1500{print $2-$3}' /dev/rtlightsensor0	|
		awk '$1>300{print "L"}$1<-300{print "R"}' > $tmp-dir

		case "$(cat $tmp-dir)" in
			"" ) return ;;
			"R" ) turn -3 ;;
			"L" ) turn 3 ;;
		esac
		cat /dev/rtlightsensor0
	done
}

forward_to_wall () {
	while awk '$1>2000 || $4>2000{exit 1}' /dev/rtlightsensor0 ; do
		balance
		forward 50
		cat /dev/rtlightsensor0
	done
}


while awk '$1>500&&$2>500&&$3>500&&$4>500{exit 1}' /dev/rtlightsensor0 ; do
	forward_to_wall
	turn -90
done > $log
