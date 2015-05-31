#!/usr/bin/python

from data import constants
from fileutils import *

import os
from subprocess import call

from filedata import FileData 
from filedata import StringsFile
from filedata import ImageFile

FOUNDATION = "#import <Foundation/Foundation.h>"
END = "@end"
AUTO_GENERATED_TEXT =  "/* AUTO-GENERATED FILE!!! MODIFICATIONS WILL BE OVERWRITTEN */"

def appendAutoGenerate(f):
	writeLine(f, AUTO_GENERATED_TEXT, True)

def buildPathForLanguage(dirMethod, language, fileName):
	path = os.path.join(dirMethod(), language)
	buildPath(path)

	stringPath = os.path.join(path, fileName)
	call(["touch", stringPath])


class FileManager(object):
	def __init__(self):
		pass

	def hasConfig(self):
		return os.path.isfile("config.py")

	def buildConfig(self):
		print "building config.py..."

		call(["touch", "config.py"])

	def buildRes(self):
		print "building res dir..."

		buildPath(constants.getStringsDir())
		buildPath(constants.getLocalizationDir())
		buildPath(constants.getImagesDir())

	def addLanguages(self, languages, translations):
		for language in languages:
			buildPathForLanguage(constants.getStringsDir, language, "strings.h")
			buildPathForLanguage(constants.getLocalizationDir, language, "Localizable.strings")

		english = translations.get("en")
		if english is not None:
			stringsFile = StringsFile(english.getResults())
			self.makeFile(stringsFile)

			self.updatePch(stringsFile.getPath().getH())

	def addImages(self, images):
		buildPath(constants.getImagesDir())

		imageFile = ImageFile(images)
		self.makeFile(imageFile)

		self.updatePch(imageFile.getPath().getH())

	def makeFile(self, fileData):
		path = fileData.getPath()

		print "writing file {0}...".format(path.getH())

		with open(path.getH(True), "w+") as f:
			appendAutoGenerate(f)

			writeLine(f, FOUNDATION, True)
			fileData.writeInterfaceImports(f)
			writeLine(f, "@interface {0} : NSObject".format(fileData.getName()), True)
			fileData.writeInterfaceMethods(f)
			newLine(f)
			writeLine(f, END)

		print "writing file {0}...".format(path.getM())

		with open(path.getM(True), "w+") as f:
			appendAutoGenerate(f)

			writeLine(f, "#import \"{0}\"".format(path.getH()), True)
			fileData.writeImplementationImports(f)

			fileData.writeStaticMethods(f)

			if fileData.wantsExtenstion():
				writeLine(f, "@interface {0}()".format(fileData.getName()), True)
				fileData.writeExtension(f)
				newLine(f)
				writeLine(f, END, True)

			writeLine(f, "@implementation {0}".format(fileData.getName()), True)
			fileData.writeImplementationMethods(f)
			writeLine(f, END)

	def updatePch(self, name):
		path_read = constants.getPch()
		path_write = path_read + "_temp_" + name

		lines = []

		with open(path_read) as f:
			for line in f:
				lines.append(line.rstrip())

				if name in line:
					return

		call(["touch", path_write])
		
		with open(path_write, "w+") as f:
			inScope = False

			for line in lines:
				if "#ifdef __OBJC__" in line:
					inScope = True

				if "#endif" in line and inScope:
					writeLine(f, "#import \"{0}\"".format(name), tabs = 1)

				writeLine(f, line)

		call(["mv", path_write, path_read])













			
