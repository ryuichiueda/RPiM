#!/usr/bin/python
# -*- coding: utf-8 -*- 
import sys
import time
import actions

if __name__ == '__main__':

	while True:
		actions.curve_to_wall('R')
		actions.search_space('L')

	sys.exit(0)
