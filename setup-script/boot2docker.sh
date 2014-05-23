#!/usr/bin/env bash

SETUP_SCRIPT_DIR=$(dirname $0)
SRC_DIR=$SETUP_SCRIPT_DIR/../src

INSTALL_DIR=$HOME/bin

TARGET_NAME=boot2docker
DEST_PATH=$INSTALL_DIR/$TARGET_NAME

SRC_URL=https://raw.githubusercontent.com/boot2docker/boot2docker/master/boot2docker

if [ -f $DEST_PATH ]; then
    echo "'$DEST_PATH' exists."
else
    curl -fsSL $SRC_URL > $DEST_PATH
    chmod +x $DEST_PATH
    echo "'$DEST_PATH' has been installed."
    $DEST_PATH download
    $DEST_PATH init
    $SETUP_SCRIPT_DIR/virtualbox-portforwarding.sh 49000 49900
fi

