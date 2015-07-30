#!/usr/bin/python
# -*- coding: utf-8 -*- 
import sys
import time
import actions

if __name__ == '__main__':

	dist = [500,-500,500,-500]
	for d in dist:
		actions.forward(d)
		time.sleep(0.5)
		
	sys.exit(0)
