#!/usr/bin/env bash

SETUP_SCRIPT_DIR=$(dirname $0)
SRC_DIR=$SETUP_SCRIPT_DIR/../src
EMACS_DIR=~/.emacs.d

brew install emacs --with-cocoa --with-gnutls --japanese

if [ ! -f $EMACS_DIR/init.el ]; then
    cp $SRC_DIR/init.el $EMACS_DIR/init.el 
fi

if [ ! -d $EMACS_DIR/elisp ]; then
    cp -r $SRC_DIR/elisp $EMACS_DIR/.
fi
