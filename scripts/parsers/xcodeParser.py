#!/usr/bin/python

from data import constants
from jsutils import *

import re
import os

from images import Images

LOCALIZED_DIR_REGEX = re.compile(r"((.*?)([\w]{2}[.]lproj)(.*))")
IMAGE_FILE_REGEX = re.compile(r"(([\d\w]+ /\* )([\w\d-]{0,}(@[2-9]x){0,1}(-landscape){0,1}.png)(.)+)")

def regexMatch(match):
	return match.group(3)

def parse():
	print "parsing project file..."

	supportedLanguages = []
	images = Images()

	results = { "languages" : supportedLanguages, "images" : images }

	path = os.path.join(constants.getProjectName(), "project.pbxproj")
	plist = os.path.join("lproj", "InfoPlist.strings")

	with open(path) as f:
		for line in f:
			line = line.rstrip()

			if plist in line:
				fileName = stripWhiteSpace(LOCALIZED_DIR_REGEX.sub(regexMatch, line))
				
				addUniqueValue(supportedLanguages, fileName)

			if ".png" in line:
				imageName = stripWhiteSpace(IMAGE_FILE_REGEX.sub(regexMatch, line).rstrip())
				images.addImage(imageName)

	images.orderImages()

	return results

