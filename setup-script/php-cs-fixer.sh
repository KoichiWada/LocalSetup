#!/usr/bin/env bash

SETUP_SCRIPT_DIR=$(dirname $0)
SRC_DIR=$SETUP_SCRIPT_DIR/../src

INSTALL_DIR=$HOME/bin

TARGET_NAME=php-cs-fixer
DEST_PATH=$INSTALL_DIR/$TARGET_NAME

if [ -f $DEST_PATH ]; then
    echo "'$DEST_PATH' exists."
else
    curl http://cs.sensiolabs.org/get/php-cs-fixer.phar -o $DEST_PATH
    chmod +x $DEST_PATH
    echo "'$DEST_PATH' has been installed."
fi
