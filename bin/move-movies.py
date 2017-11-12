#!/usr/bin/python

import re
import os
from shutil import move

PATH='/media/gotham/videos/movies'
EXT=('mp4', 'mkv')

files = []
for (dirPath, dirNames, fileNames) in os.walk('.'):
    for f in fileNames:
        ext = re.search("\.([\w]+$)", f).group(1)
        if ext is None or ext not in EXT:
            continue

        name = re.search("(.*)\.[\d]{4}\.", f).group(1)
        year = re.search("\.([\d]{4})\.", f).group(1)
        quality = re.search("[\d]{4}\.([\d]{3,4}[\w]){0,1}\.", f).grou(1)

        newName = "%s.%s.%s.%s" % (name, year, quality, ext)
        oldPath = os.path.abspath(os.path.join(dirPath, f))
        newPath = os.path.join(PATH, newName)

        print("Moving file from completed/%s to movies/%s" % (f, newName))
        print("Approve? y or n")
        answer = raw_input()
        if answer != 'y':
            continue

        move(oldPath, newPath)
