#!/bin/bash

sudo docker pull swarm

TOKEN=`sudo docker run --rm swarm create`
echo -e "herу is your token for cluster \e[32m${TOKEN}\e[39m"

