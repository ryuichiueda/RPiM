#!/usr/bin/python
# -*- coding: utf-8 -*- 
import time

motor_l = open("/dev/rtmotor_raw_l0","w")
motor_r = open("/dev/rtmotor_raw_r0","w")
motor_sw = open("/dev/rtmotoren0","w")

####前進###
print >> motor_l, "400"
print >> motor_r, "400"

motor_l.close()
motor_r.close()

####壁が近づくと止める処理###
n = 0
while n <= 500:
	s = open("/dev/rtlightsensor0","r")
	vs = s.readline().rstrip().split()
	n = sum([ int(s) for s in vs ])
	time.sleep(0.1)

print >> motor_sw, "0"
motor_sw.close()
