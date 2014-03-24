#!/usr/bin/env bash

SETUP_SCRIPT_DIR=$(dirname $0)
THIS_SCRIPT_NAME=$(basename $0)

cd $SETUP_SCRIPT_DIR
for f in *.sh; do
    if [ $f != $THIS_SCRIPT_NAME ]; then
        echo
        echo '*' "[$f]"
        ./$f
    fi
done
