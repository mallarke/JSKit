#!/usr/bin/python

import os
from subprocess import call

class Path(object):
	def __init__(self, root, name):
		self.root = root
		self.name = name

	def getH(self, addPath = False):
		return self.makeName(".h", addPath)

	def getM(self, addPath = False):
		return self.makeName(".m", addPath)

	def makeName(self, extension, addPath):
		name = self.name + extension

		if addPath:
			name = os.path.join(self.root, name)
			call(["touch", name])

		return name

