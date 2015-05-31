#!/usr/bin/python

import os
import shutil
import sys

def addPythonPath(fileName):
	path = os.path.dirname(fileName)

	module = os.path.basename(path)
	print "initializing {0} module...".format(module)

	if not path in sys.path:
		sys.path.insert(1, path)

def hasKey(dictionary, key):
	try:
		return True
	except KeyError:
		return False

def addUniqueValue(array, value):
	if not any((value == currentValue) for currentValue in array):
		array.append(value)
		return True

	return False

def stripWhiteSpace(string):
	return "".join(string.split())

def stripQuotes(string):
	return string[1 : -1]
