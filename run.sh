#!/bin/bash

# This takes 1 argument, which is the name of the file to be compiled
#Needs to install docker.io

DOCKERIMAGENAME="execution_image"
DOCKERCONTAINERNAME="execution_container"
CLEANUPDOCKERIMAGENAME="$DOCKERIMAGENAME:latest"


#Checks to see if the argument exists, and if there are enough arguments
if [[ -z "$1" ]] || [[ $# -gt 1 ]]; then
    echo "You need 1 argument"
    exit 1
fi

#Quick first check to see if there is a file extension
if grep -iq ".*" $1; then
    #Makes a directory for docker to pull from and copies a version of the file into it
    mkdir dockerTemp
    #Copies the specified file and moves it into dockerTemp under the generic name dockerCode (for the dockers to know what to run)
    cp $1 ./dockerTemp/dockerCode

    #Determine file type based off of file extension
    # Python
    if grep -iqw "*.py" $1; then
        #Builds image. -f is which Dockerfile to use and from where. -t is docker image name. "." is where the docker will reside
        sudo docker build -f ./Dockerfiles/Dockerfile.py -t $DOCKERIMAGENAME .
        sudo docker run --name $DOCKERCONTAINERNAME $DOCKERIMAGENAME
        #Removes the base image
        sudo docker image rm "python:3.11.15-slim-trixie"
    fi
    # C
    if grep -iqw "*.c" $1; then
        #Builds image. -f is which Dockerfile to use and from where. -t is docker image name. "." is where the docker will reside
        sudo docker build -f ./Dockerfiles/Dockerfile.py -t $DOCKERIMAGENAME .
        sudo docker run --name $DOCKERCONTAINERNAME $DOCKERIMAGENAME
        #Removes the base image
        sudo docker image rm "python:3.11.15-slim-trixie"
    fi
    # C++
    if grep -iqw "*.cpp" $1; then
        #Builds image. -f is which Dockerfile to use and from where. -t is docker image name. "." is where the docker will reside
        sudo docker build -f ./Dockerfiles/Dockerfile.cpp -t $DOCKERIMAGENAME .
        sudo docker run --name $DOCKERCONTAINERNAME $DOCKERIMAGENAME
        #Removes the base image
        sudo docker image rm "gcc:trixie"
    fi
    # Bash
    if grep -iqw "*.sh" $1; then
        #Builds image. -f is which Dockerfile to use and from where. -t is docker image name. "." is where the docker will reside
        sudo docker build -f ./Dockerfiles/Dockerfile.py -t $DOCKERIMAGENAME .
        sudo docker run --name $DOCKERCONTAINERNAME $DOCKERIMAGENAME
        #Removes the base image
        sudo docker image rm "python:3.11.15-slim-trixie"
    fi

    #Cleanup
    rm -r dockerTemp
    sudo docker image rm $CLEANUPDOCKERIMAGENAME -f
    sudo docker container rm $DOCKERCONTAINERNAME
else
    echo "File extension could not be found, or language is unsupported"
    exit 1
fi