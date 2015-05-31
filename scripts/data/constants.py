#!/usr/bin/python

import os

_project = None

_res = None
_localization = None
_strings = None
_images = None

_filePrefix = None

_pch = None

def updateConfig(config):
	global _project
	global _filePrefix

	global _res
	global _localization
	global _strings
	global _images

	global _pch

	if "project" in config:
		_project = config["project"]

	if "prefix" in config:
		_filePrefix = config["prefix"]

	prefix = None
	if "path" in config:
		prefix = config["path"]

	_res = (os.path.join(prefix, "res") if prefix is not None else "res")
	_localization = os.path.join(_res, "localization")
	_strings = os.path.join(_res, "strings")
	_images = os.path.join(_res, "images")

	if "pch" in config:
		_pch = config["pch"]

def getProject():
	global _project
	return _project

def getProjectName():
	global _project
	return _project + ".xcodeproj"

def getFilePrefix():
	global _filePrefix
	return _filePrefix

def getResDir():
	global _res
	return _res

def getLocalizationDir():
	global _localization
	return _localization

def getStringsDir():
	global _strings
	return _strings

def getImagesDir():
	global _images
	return _images

def getPch():
	global _pch
	return _pch

def log():
	print "logging constants vars..."
	print "Project:     " + getProject()
	print "ProjectName: " + getProjectName()

	print "\nlogging dir vars..."
	print "Prefix:       " + getFilePrefix()
	print "Res:          " + getResDir()
	print "Localization: " + getLocalizationDir()
	print "Strings:      " + getStringsDir()
	print "Images:       " + getImageDir()

