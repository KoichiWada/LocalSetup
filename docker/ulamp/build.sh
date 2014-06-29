#!/usr/bin/env bash

cd $(dirname $0)
cp $HOME/.ssh/id_rsa.pub ./key.pub

docker build -t wada/ulamp .

docker rm $(docker ps -aq)
docker rmi $(docker images | awk '/^<none>/ { print $3 }')
