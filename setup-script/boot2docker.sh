#!/usr/bin/env bash

SETUP_SCRIPT_DIR=$(dirname $0)
SRC_DIR=$SETUP_SCRIPT_DIR/../src

INSTALL_DIR=$HOME/bin

TARGET_NAME=boot2docker
DEST_PATH=$INSTALL_DIR/$TARGET_NAME

if [ -f $DEST_PATH ]; then
    echo "'$DEST_PATH' exists."
else
    curl https://raw.github.com/boot2docker/boot2docker/master/boot2docker > $DEST_PATH
    chmod +x $DEST_PATH
    echo "'$DEST_PATH' has been installed."
fi
