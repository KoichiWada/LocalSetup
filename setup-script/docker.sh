#!/usr/bin/env bash

SETUP_SCRIPT_DIR=$(dirname $0)
SRC_DIR=$SETUP_SCRIPT_DIR/../src

INSTALL_DIR=$HOME/bin

TARGET_NAME=docker
DEST_PATH=$INSTALL_DIR/$TARGET_NAME

if [ -f $DEST_PATH ]; then
    echo "'$DEST_PATH' exists."
else
    curl https://get.docker.io/builds/Darwin/x86_64/docker-latest -o $DEST_PATH 
    chmod +x $DEST_PATH
    echo "'$DEST_PATH' has been installed."
fi

if [ "$DOCKER_HOST" = "" ]; then
    echo "Set the environment variable for the docker daemon like:"
    echo "export DOCKER_HOST=tcp://127.0.0.1:4243"
fi
