#!/usr/bin/python

from os.path import join

import dirs

class FactoryFile(object):
	def __init__(self, prefix, name):
		self.name = (name if prefix is None else prefix + name)

	def getName(self):
		return self.name

	def getPath(self):
		return None

	def getH(self):
		return self.name + ".h"

	def getM(self):
		return self.name + ".m"

	def getHPath(self):
		return join(self.getPath(), self.getH())

	def getMPath(self):
		return join(self.getPath(), self.getM())

	def __repr__(self):
		return str(self)

	def __str__(self):
		return "File: {0}$ h: {1} (path: {2}), m: {3} (path: {4})".format(self.name, self.getH(), self. getHPath(), self.getM(), self.getMPath())

class StringsFactory(FactoryFile):
	def __init__(self, prefix):
		FactoryFile.__init__(self, prefix, "LocalizedString")

	def getPath(self):
		return dirs.getStringsDir()

class ImageFactory(FactoryFile):
	def __init__(self, prefix):
		FactoryFile.__init__(self, prefix, "Image")

	def getPath(self):
		return dirs.getImageDir()

_prefix = None

def setResPrefix(prefix):
	global _prefix
	_prefix = prefix

def getStrings():
	return StringsFactory(_prefix)

def getImages():
	return ImageFactory(_prefix)

def log():
	print "\nlogging factory vars..."
	print getStrings()
	print getImages()
	print "\n"
