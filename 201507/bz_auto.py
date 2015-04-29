#!/usr/bin/python
import sys
import time

scale = {}

for line in open('SCALE','r') :
	e = line.rstrip().split(' ')
	scale[e[0]] = e[1]

for line in open(sys.argv[1]) :
	bz = open('/dev/rtbuzzer0', 'w')
	s = line.rstrip().split(' ')
	print >> bz, scale[ s[0] ]
	bz.close()
	time.sleep(float(s[1]))

