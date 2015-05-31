#!/usr/bin/python

class Languages(object):
	def __init__(self):
		self.languages = []

	def add(self, language):
		self.languages.append(language)

	def get(self, key):
		if len(self.languages) > 0:
			for language in self.languages:
				if key in language.getFileName():
					return language

		return None

class Language(object):
	def __init__(self, fileName):
		self.fileName = fileName
		self.results = {}

	def getFileName(self):
		return self.fileName

	def addValues(self, key, value):
		self.results[key] = value

	def getResults(self):
		keys = sorted(self.results.iterkeys())
		results = []

		for key in keys:
			results.append({ "key" : key , "value" : self.results[key]})

		return results
