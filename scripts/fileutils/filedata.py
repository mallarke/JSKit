#!/usr/bin/python

from fileutils import *

from data import constants
from data import Path

def convertToObjc(value):
    return ("true" if value else "false");

class FileData(object):
    def __init__(self, name):
        prefix = constants.getFilePrefix()
        self.name = (name if prefix is None else prefix + name)
        self.path = Path(self.getRoot(), self.name)

    def getName(self):
        return self.name

    def getPath(self):
        return self.path

    def wantsExtenstion(self):
        return False

    # protected methods. must be over written
    def getRoot(self):
        pass

    def writeStaticMethods(self, f):
        pass

    def writeExtension(self, f):
        pass

    def writeInterfaceImports(self, f):
        pass

    def writeInterfaceMethods(self, f):
        pass

    def writeImplementationImports(self, f):
        pass

    def writeImplementationMethods(self, f):
        pass

class StringsFile(FileData):
    def __init__(self, language):
        FileData.__init__(self, "LocalizedString")
        self.language = language

    def getRoot(self):
        return constants.getStringsDir()

    def writeImplementationImports(self, f):
        writeLine(f, "#import <JSKit/JSUtility.h>", addLine = True)

    def	writeInterfaceMethods(self, f):
        for dictionary in self.language:
            key = dictionary["key"]
            value = dictionary["value"]
            count = 0;

            if "%@" in value:
                count = value.count("%@")

            if count == 0:
                writeLine(f, "+ (NSString *){0};".format(key))
            elif count == 1:
                writeLine(f, "+ (NSString *){0}:(NSString *)string;".format(key))
            else:
                writeLine(f, "+ (NSString *){0}:(NSString *)string, ...;".format(key))

    def writeImplementationMethods(self, f):
        for dictionary in self.language:
            key = dictionary["key"]
            value = dictionary["value"]
            count = 0;

            if "%@" in value:
                count = value.count("%@")

            if count == 0:
                writeLine(f, "+ (NSString *){0}".format(key) + " {")
                writeLine(f, "return NSLocalizedString(@\"{0}\", nil);".format(value), tabs = 1)
            elif count == 1:
                writeLine(f, "+ (NSString *){0}:(NSString *)string".format(key) + " {")
                writeLine(f, "NSString *text = [NSString stringWithFormat:@\"{0}\", string];".format(value), tabs = 1)
                writeLine(f, "return NSLocalizedString(text, nil);", tabs = 1)
            else:
                writeLine(f, "+ (NSString *){0}:(NSString *)string, ...".format(key) + " {")
                writeLine(f, "va_list list;", tabs = 1)
                writeLine(f, "va_start(list, string);", tabs = 1)
                writeLine(f, "NSString *text = format_string(@\"{0}\", string, list);".format(value), tabs = 1)
                writeLine(f, "va_end(list);", addLine = True, tabs = 1)
                writeLine(f, "return NSLocalizedString(text, nil);", tabs = 1)

            writeLine(f, "}", True)

class ImageFile(FileData):
    def __init__(self, images):
        FileData.__init__(self, "Image")
        self.images = images

    def getRoot(self):
        return constants.getImagesDir()

    def writeInterfaceMethods(self, f):
        for image in self.images.getAll():
            writeLine(f, "+ (UIImage *){0};".format(image.getBaseName()))

    def writeImplementationImports(self, f):
        writeLine(f, "#import <JSKit/JSImageManager.h>", True)

    def writeImplementationMethods(self, f):
        for image in self.images.getAll():
            writeLine(f, "+ (UIImage *){0}".format(image.getBaseName()))
            writeLine(f, "{")
            writeLine(f, "return [[JSImageManager sharedManager] get:@\"{0}\"];".format(image.getBaseName()), tabs = 1)
            writeLine(f, "}", True)















