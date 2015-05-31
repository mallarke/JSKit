#!/usr/bin/python

from data import constants
from data import Languages
from data import Language

import os

def parse():
	languages = Languages()

	for root, dirs, files in os.walk(constants.getStringsDir()):
		for f in files:
			path = os.path.join(root, f)

			if "lproj" not in path:
				continue

			fileName = os.path.dirname(path)
			fileName = os.path.basename(fileName)

			language = Language(fileName)
			languages.add(language)

			with open(path) as f:
				for line in f:
					line = line.rstrip()

					if " = " in line:
						line = line.replace(" = ", "=")

					if "=" in line:
						components = line.split("=")

						key = components[0]
						value = components[1]

						if value.endswith(";"):
							value = value.replace(";", "")

						key = key[ 1 : -1 ] 
						value = value[ 1 : -1 ]

						language.addValues(key, value)

	return languages
