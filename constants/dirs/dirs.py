#!/usr/bin/python

from os import getcwd
from os.path import join

_rootPath = getcwd()

_res = None
_localization = None
_strings = None
_images = None

def setPathPrefix(prefix):
	global _res
	global _localization
	global _strings
	global _images

	_res = (join(prefix, "res") if prefix is not None else "res")
	_localization = join(_res, "localization")
	_strings = join(_res, "strings")
	_images = join(_res, "images")

def getRootPath():
	global _rootPath
	return _rootPath

def setRootPath(path):
	global _rootPath
	_rootPath = path

def getResDir():
	global _res
	return _res

def getLocalizationDir():
	global _localization
	return _localization

def getStringsDir():
	global _strings
	return _strings

def getImageDir():
	global _images
	return _images

def log():
	print "\nlogging dir vars..."
	print "Root path:    " + getRootPath()
	print "Res:          " + getResDir()
	print "Localization: " + getLocalizationDir()
	print "Strings:      " + getStringsDir()
	print "Images:       " + getImageDir()

setPathPrefix(None)
