#!/usr/bin/python
# -*- coding: utf-8 -*- 
import sys
import time
import threading

g_lock = threading.Lock()
g_sensor_values = [0,0,0,0]

def motor(l_hz,r_hz,msec):
	f = open("/dev/rtmotor0","w")
	print >> f, "%d %d %d" % (l_hz,r_hz,msec)
	f.close()

def lightsensorLock():
	global g_lock
	global g_sensor_values
	with g_lock:
		f = open("/dev/rtlightsensor0","r")
		vs = f.readline().rstrip().split()
		f.close()
		g_sensor_values = [ int(s) for s in vs ]

def lightsensor():
	f = open("/dev/rtlightsensor0","r")
	vs = f.readline().rstrip().split()
	f.close()

	return [ int(s) for s in vs ]

def forward(distance):
	r_hz = 400
	l_hz = 400
	tm = int(1000*distance/(45*3.141592))

	if tm < 0:
		r_hz, l_hz, tm = -r_hz, -l_hz, -tm

	motor(l_hz,r_hz,tm)
		

def turn(deg):
	r_hz = -400
	l_hz = 400
	tm = int(1000.0*deg/180)

	if tm < 0:
		r_hz, l_hz, tm = -r_hz, -l_hz, -tm

	motor(l_hz,r_hz,tm)

def curve_to_wall(direction):
	global g_sensor_values

	while True:
		t = threading.Thread(target=lightsensorLock)
		t.start()

		r_hz, l_hz = 450, 450
		tm = 100
		if direction == "R":
			l_hz = l_hz + 50
		else:
			r_hz = r_hz + 50

		motor(l_hz,r_hz,tm)

		t.join()
		if sum(g_sensor_values) > 500:
			return


def search_space(direction):
	global g_sensor_values

	while True:
		t = threading.Thread(target=lightsensorLock)
		t.start()

		r_hz, l_hz = 300, -300 
		tm = 100
		if direction == "R":
			r_hz, l_hz = -r_hz, -l_hz

		motor(l_hz,r_hz,tm)

		t.join()
		if g_sensor_values[0] + g_sensor_values[3] < 200:
			return

