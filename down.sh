#!/bin/bash

docker kill $(docker ps -q)

docker rm $(docker ps -aq)

docker volume prune -f

docker system prune -f

rm -r channel-artifacts crypto-config
