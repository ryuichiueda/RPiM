#!/bin/bash -xv

source "$(dirname $(readlink -f $0))/actions"
tmp=/run/shm/tmp$$
log=/home/pi/log

balance_lr () {
	while : ; do
		awk '$2+$3>1500{print $2-$3}' /dev/rtlightsensor0	|
		awk '$1>100{print "L"}$1<-100{print "R"}' > $tmp-dir

		D=$(cat $tmp-dir)
		[ "$D" = "" ] && break

		[ "$D" = "R" ] &&
		echo 100 -100 100 | tee -a $log > /dev/rtmotor0 ||
		echo -100 100 100 | tee -a $log > /dev/rtmotor0
	done
}

forward_to_wall () {
	while : ; do
		awk '$1>2000 || $4>2000' /dev/rtlightsensor0 > $tmp-ok
		[ -s "$tmp-ok" ] && break

		awk '$2-$3>300 || $2-$3<-300' /dev/rtlightsensor0 |
		awk '$2+$3>1500'	> $tmp-turn

		[ -s "$tmp-turn" ] && balance_lr

		echo 300 300 300 | tee -a $log > /dev/rtmotor0
	done
}


while awk '$1>500&&$2>500&&$3>500&&$4>500{exit 1}' /dev/rtlightsensor0 ; do
	forward_to_wall
	turn -90
done
