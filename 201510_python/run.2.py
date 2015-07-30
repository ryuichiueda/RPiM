#!/usr/bin/python
# -*- coding: utf-8 -*- 
import sys
import time
import actions

if __name__ == '__main__':

	degs = [90,-90,90,-90]
	for d in degs:
		actions.turn(d)
		time.sleep(0.5)
		
	sys.exit(0)
