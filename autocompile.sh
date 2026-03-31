#!/bin/bash

# This takes 1 argument, which is the name of the file to be compiled

#Checks to see if the argument exists, and if there are enough arguments
if [[ -z "$1" ]] || [[ $# -gt 1 ]]; then
    echo "You need 1 argument"
    exit 1
fi

#Quick first check to see if there is a file extension
if [[ $1 || grep -i ".*" ]]; then

    if [[ grep -i ".py" ]]; then
        docker build -f Dockerfile.py -t pyDockerAPKImage .
        docker run --name pyDockerAPKContainer pyDockerAPKImage
    fi

    if [[ grep -i ".sh" ]]; then

    fi

    if [[ grep -i ".cpp" ]]; then

    fi

    if [[grep -i ".c" ]]; then

    fi

else
    echo "File extension could not be found, or language is unsupported"
    exit 1

fi