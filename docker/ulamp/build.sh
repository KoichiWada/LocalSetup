#!/usr/bin/env bash

cd $(dirname $0)
docker build -t wada/ulamp .

docker rm $(docker ps -aq)
docker rmi $(docker images | awk '/^<none>/ { print $3 }')
