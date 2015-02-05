#!/usr/bin/env bash

if [ ! -d ~/go ]; then
    mkdir ~/go
fi

if [ $(grep -c GOPATH ~/.bashrc) -eq 0 ]; then
    echo '# go setting' >> ~/.bashrc
    echo 'GOPATH=~/go' >> ~/.bashrc
fi

if [ -z "$(which go)" ]; then
    "Install go"
fi
