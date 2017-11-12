#!/usr/bin/python

import re
import os
from shutil import move

PATH='/media/gotham/videos/movies'
EXT=('mp4', 'mkv')

files = []
for (dirPath, dirNames, fileNames) in os.walk('.'):
    for fileName in fileNames:
        ext = re.search("\.([\w]+$)", fileName).group(1)
        if ext is None or ext not in EXT:
            continue

        name = re.search("(.*)\.[\d]{4}\.", fileName).group(1)
        year = re.search("\.([\d]{4})\.", fileName).group(1)

        newName = "%s.%s.%s" % (name, year, ext)
        oldPath = os.path.abspath(os.path.join(dirPath, fileName))
        newPath = os.path.join(PATH, newName)

        print("Moving file from completed/%s to movies/%s" % (fileName, newName))
        print("Approve? y or n")
        answer = raw_input()
        if answer != 'y':
            continue

        move(oldPath, newPath)
