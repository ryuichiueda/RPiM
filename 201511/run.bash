#!/bin/bash -xv

source "$(dirname $(readlink -f $0))/actions"
tmp=/run/shm/tmp$$
log=/home/pi/log

: > $log

balance () {
	while : ; do
		awk '$2+$3>1500{print $2-$3}' /dev/rtlightsensor0	|
		awk '$1>300{print "L"}$1<-300{print "R"}' > $tmp-dir

		case "$(cat $tmp-dir)" in
			"" ) return ;;
			"R" ) echo 150 -150 100 | tee -a $log > /dev/rtmotor0 ;;
			"L" ) echo -150 150 100 | tee -a $log > /dev/rtmotor0 ;;
		esac
		cat < /dev/rtlightsensor0 >> $log
	done
}

forward_to_wall () {
	while awk '$1>2000 || $4>2000{exit 1}' /dev/rtlightsensor0 ; do
		balance
		echo 300 300 300 | tee -a $log > /dev/rtmotor0
		cat < /dev/rtlightsensor0 >> $log
	done
}


while awk '$1>500&&$2>500&&$3>500&&$4>500{exit 1}' /dev/rtlightsensor0 ; do
	forward_to_wall
	turn -90
done
