#!/usr/bin/python

from jsutils import *

def parse():
	print "parsing config file..."

	results = {}

	with open("config.py") as f:
		for line in f:
			line = line.rstrip()

			values = line.split(" = ")
			if not len(values) == 2:
				continue

			key = values[0]
			value = stripQuotes(stripWhiteSpace(values[1]))
			results[key] = value


	return results
