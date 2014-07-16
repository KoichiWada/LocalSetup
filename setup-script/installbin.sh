#!/usr/bin/env bash

SETUP_SCRIPT_DIR=$(dirname $0)
SRC_DIR=$SETUP_SCRIPT_DIR/../src/bin

INSTALL_DIR=$HOME/bin

for f in $(ls $SRC_DIR); do
    src=$SRC_DIR/$f
    dest=$INSTALL_DIR/$f

    echo "* $f"
    echo "cp $src $dest"
    echo "chmod +x $dest"
    cp $src $dest
    chmod +x $dest
    echo "'$dest' has been installed."
done
