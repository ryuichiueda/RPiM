#!/usr/bin/python
# -*- coding: utf-8 -*- 
import sys
import time
import threading

def motor0(l_hz,r_hz,msec):
	motor = open("/dev/rtmotor0","w")
	print >> motor, "%d %d %d" % (r_hz,l_hz,msec)
	motor.close()

def forward(distance):
	r_hz = 400
	l_hz = 400
	tm = int(1000*distance/(45*3.141592))

	if tm < 0:
		r_hz, l_hz, tm = -r_hz, -l_hz, -tm

	motor0(l_hz,r_hz,tm)
		

def turn(deg):
	r_hz = -400
	l_hz = 400
	tm = int(1000.0*deg/180)

	if tm < 0:
		r_hz, l_hz, tm = -r_hz, -l_hz, -tm

	motor0(l_hz,r_hz,tm)
		

