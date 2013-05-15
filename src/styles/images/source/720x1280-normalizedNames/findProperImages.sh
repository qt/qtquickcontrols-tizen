#!/bin/bash



echo "var images = {"


for baseName in `find . -name '*.png' | sed s#.*\./## | sed s/\.png// | sort | uniq`; do
    path="imagesPath +"
    subPath=""
    extension=".png"
    if [ -e "white/$baseName$extension" ]; then
	subPath="white/"
	path="$path theme +"
    fi 
    if [ -e "$subPath$baseName.sci" ]; then
	extension=".sci"
    fi
    echo -n "    img_$baseName" && echo ": $path \"$baseName$extension\","
done

echo "}"
