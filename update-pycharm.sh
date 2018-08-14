#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "2 parameters needed:"
    echo "old pycharm directory (first parameter) will be deleted"
    echo "new pycharm .tar.gz (second parameter) will be extracted"
    exit 1
fi
echo "$1 will be deleted"
echo "$2 will be extracted to /opt/"

echo "are these parameters ok?"
read -p "Are you sure? " -n 1 -r
echo 
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

if [[ -f $1 ]]; then
    echo "$1 is a file, but should be a directory"
elif [[ -d $1 ]]; then
    echo "removing old directory $1"
    rm -rf $1
else
    echo "$1 is not valid"
fi

if [[ -d $2 ]]; then
    echo "$2 is a directory, but should be a file"
elif [[ -f $2 ]]; then
    echo "extracting $2 to /opt"
    tar -xf $2 -C /opt
else
    echo "$2 not valid"
fi
