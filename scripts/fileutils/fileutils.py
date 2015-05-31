#!/usr/bin/python

import os
from subprocess import call

def writeLine(f, text, addLine = False, tabs = 0):
	text = text + "\n"
	if addLine:
		text = text + "\n"

	for i in range(0, tabs):
		text = "\t" + text

	f.write(text)

def newLine(f):
	f.write("\n")

def buildPath(path, fresh = False):
	print path
	if fresh:
		if os.path.exists(path):
			print "Recreating path..."
			call(["rm", "-rf", path])

	components = path.split("/")
	currentPath = ""

	for segment in components:
		currentPath = os.path.join(currentPath, segment)
		path = os.path.join(os.getcwd(), currentPath)

		if not os.path.exists(path):
			if not fresh:
				print "building path..."
			os.makedirs(path)

