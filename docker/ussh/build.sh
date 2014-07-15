#!/usr/bin/env bash

cd $(dirname $0)
cp $HOME/.ssh/id_rsa .
cp $HOME/.ssh/id_rsa.pub .

docker build -t wada/ussh .

docker rm $(docker ps -aq)
docker rmi $(docker images | awk '/^<none>/ { print $3 }')
