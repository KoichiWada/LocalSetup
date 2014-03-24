#!/usr/bin/env bash

SETUP_SCRIPT_DIR=$(dirname $0)
SRC_DIR=$SETUP_SCRIPT_DIR/../src

INSTALL_DIR=$HOME/bin

TARGET_NAME=fixbin
SRC_PATH=$SRC_DIR/$TARGET_NAME
DEST_PATH=$INSTALL_DIR/$TARGET_NAME

if [ -f $DEST_PATH ]; then
    echo "'$DEST_PATH' exists."
else
    echo "cp $SRC_PATH $DEST_PATH"
    echo "chmod +x $DEST_PATH"
    cp $SRC_PATH $DEST_PATH
    chmod +x $DEST_PATH
    echo "'$DEST_PATH' has been installed."
fi
