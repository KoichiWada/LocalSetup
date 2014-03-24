#!/usr/bin/env bash

SETUP_SCRIPT_DIR=$(dirname $0)
SRC_DIR=$SETUP_SCRIPT_DIR/../src

INSTALL_DIR=$HOME/bin

TARGET_NAME=composer
DEST_PATH=$INSTALL_DIR/$TARGET_NAME

if [ -f $DEST_PATH ]; then
    echo "'$DEST_PATH' exists."
else
    curl -sS https://getcomposer.org/installer | php -- --install-dir=$INSTALL_DIR
    echo "mv $INSTALL_DIR/composer.phar $DEST_PATH"
    mv $INSTALL_DIR/composer.phar $DEST_PATH
    $DEST_PATH self-update
    echo "'$DEST_PATH' has been installed."
fi
