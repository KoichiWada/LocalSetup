#!/usr/bin/env bash

SETUP_SCRIPT_DIR=$(dirname $0)
SRC_DIR=$SETUP_SCRIPT_DIR/../src

VAGRANT_ROOT_DIR=$HOME/Vagrant
VAGRANT_DIR=$VAGRANT_ROOT_DIR/docker

if [ ! -d $VAGRANT_ROOT_DIR ]; then
    echo "mkdir $VAGRANT_ROOT_DIR"
    mkdir $VAGRANT_ROOT_DIR
fi

if [ ! -d $VAGRANT_DIR ]; then
    echo "mkdir $VAGRANT_DIR"
    mkdir $VAGRANT_DIR
fi

echo "cp $SRC_DIR/Vagrantfile.boot2docker $VAGRANT_DIR/Vagrantfile"
cp $SRC_DIR/Vagrantfile.boot2docker $VAGRANT_DIR/Vagrantfile

echo "cp $SRC_DIR/vagrant-docker $HOME/bin/."
echo "chmod +x $HOME/bin/vagrant-docker"

cp $SRC_DIR/vagrant-docker $HOME/bin/.
chmod +x $HOME/bin/vagrant-docker

echo "'$HOME/bin/vagrant-docker' has been installed."

