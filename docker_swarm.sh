#!/bin/bash

docker pull swarm

TOKEN=`docker run --rm swarm create`
echo herу is your token for cluster ${TOKEN}

