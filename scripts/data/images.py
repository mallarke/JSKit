#!/usr/bin/python

EXTENSION = ".png"
HI_RES = "@2x"
SUPER_HI_RES = "@3x"
IPHONE_5 = "-568h"
IPHONE_6 = "-1334h"
LANDSCAPE = "-landscape"

def getBaseName(image):
	image = image.replace(EXTENSION, "")
	image = image.replace(HI_RES, "")
	image = image.replace(SUPER_HI_RES, "")
	image = image.replace(IPHONE_5, "")
	image = image.replace(IPHONE_6, "")
	image = image.replace(LANDSCAPE, "")

	return image

class Images(object):
	def __init__(self):
		self.images = []

	def addImage(self, image):
		if image is None:
			return

		hasImageItem = False
		baseName = getBaseName(image)

		imageItem = self.getItem(baseName)
		if imageItem is None:
			imageItem = Image(baseName, image)
			self.images.append(imageItem)
		else:
			imageItem.addImage(image)

	def getAll(self):
		return self.images

	def get(self, index):
		return self.images[index]

	def getItem(self, baseName):
		for item in self.images:
			if item.getBaseName() == baseName:
				return item

		return None

	def orderImages(self):
		names = []
		for image in self.images:
			names.append(image.getBaseName())

		names = sorted(names)

		images = []
		for name in names:
			for image in self.images:
				if name == image.getBaseName():
					images.append(image)
					break

		self.images = images

	def __repr__(self):
		return str(self)

	def __str__(self):
		text = "Images: {0}\n".format(len(self.images))
		for image in self.images:
			text = "{0}  {1}\n".format(text, image)

		return text

class Image(object):
	def __init__(self, baseName, image):
		self.baseName = baseName
		self.variants = []
		self.variants.append(image)

		self.hasIphone5Image = (IPHONE_5 in image)

	def getBaseName(self):
		return self.baseName

	def addImage(self, image):
		if image is None or image in self.variants:
			return False

		if IPHONE_5 in image:
			self.hasIphone5Image = True

		self.variants.append(image)
		return True

	def containsIphone5Image(self):
		return self.hasIphone5Image

	def __repr__(self):
		return str(self)

	def __str__(self):
		return self.baseName


