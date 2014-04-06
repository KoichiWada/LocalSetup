#!/usr/bin/env bash

BOOT2DOCKER_BOX_VERSION="0.5.4-1"
BOOT2DOCKER_BOX_URL="https://github.com/mitchellh/boot2docker-vagrant-box/releases/download/v${BOOT2DOCKER_BOX_VERSION}/boot2docker_virtualbox.box"

SETUP_SCRIPT_DIR=$(dirname $0)
SRC_DIR=$(cd $SETUP_SCRIPT_DIR/../src && pwd)

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

# vagrant init
cd $VAGRANT_DIR
vagrant init boot2docker $BOOT2DOCKER_BOX_URL

# vagrant-docker
cp $SRC_DIR/vagrant-docker $HOME/bin/.
chmod +x $HOME/bin/vagrant-docker

echo "'$HOME/bin/vagrant-docker' has been installed."

