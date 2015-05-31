
import sys

from data import constants

sys.dont_write_bytecode = True

from parsers import configParser
from parsers import stringParser
from parsers import xcodeParser

from fileutils import FileManager

fileManager = FileManager()
if not fileManager.hasConfig():
	print "no config found..."
	fileManager.buildConfig()
	print "fill out and build project again..."
	sys.exit()

config = configParser.parse()

if len(config) == 0 or "project" not in config:
	print "config file is missing or unfinished..."
	sys.exit(2)

if "pch" not in config:
	print "missing pch path in config."
	print "i.e."
	print "pch = \"path to my pch file\""
	sys.exit(2)

constants.updateConfig(config)
fileManager.buildRes()

xcodeResult = xcodeParser.parse()
languages = xcodeResult["languages"]
images = xcodeResult["images"]

translations = stringParser.parse()

fileManager.addLanguages(languages, translations)
fileManager.addImages(images)

