#!/bin/bash

OIFS="$IFS"
IFS=$'\n'

for path in $(find /media/Gotham/completed/ -name "*1080*mp4" -o -name "*1080*mkv"); do
    echo "Inside $path..."

    full_name=$(basename $path)
    extension="${full_name##*.}"
    name="`echo $full_name | sed 's/1080p.*/1080p/'`.$extension"

    read -p "Use name $name? [y] or [n] " answer
    if [ "$answer" != "y" ]
    then
        read -p "What do you want to change $(basename $path) to? " name
    fi

    echo "Moving $path to /media/Gotham/Videos/Movies/$name"
    #mv "$path" "/media/Gotham/Videos/Movies/$name"
done

IFS="$OIFS"
