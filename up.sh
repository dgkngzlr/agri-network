#!/bin/bash

./down.sh

./setup.sh

docker-compose -f docker-compose-cli.yaml up -d

./createChannel.sh
echo "---> Deploying the chaincode ..."
sleep 5
./deployChaincode.sh
