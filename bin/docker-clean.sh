#!/bin/bash

docker ps -aq | xargs docker rm -f

if [[ "$1" == "--all" ]]; then
    docker images -aq | xargs docker rmi -f
    docker volume ls -q | xargs docker volume rm -f
    docker network prune -f
fi
