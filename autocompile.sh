#!/bin/bash

# This takes 1 argument, which is the name of the file to be compiled
#Needs to install docker.io

#Checks to see if the argument exists, and if there are enough arguments
if [[ -z "$1" ]] || [[ $# -gt 1 ]]; then
    echo "You need 1 argument"
    exit 1
fi

#Quick first check to see if there is a file extension
if grep -iq ".*" $1; then

    if grep -iq ".py" $1; then
        docker build -f Dockerfile.py -t pyDockerAPKImage .
        docker run --name pyDockerAPKContainer pyDockerAPKImage
    fi

    if grep -iq ".c" $1; then
        :
    fi

    if grep -iq ".cpp" $1; then
        :
    fi

    if grep -iq ".sh" $1; then
        :
    fi

else
    echo "File extension could not be found, or language is unsupported"
    exit 1

fi