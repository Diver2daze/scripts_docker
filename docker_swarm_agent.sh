#!/bin/bash

if [ -z $1 -o -z $2 ]
then
	echo "please set token and node_ip adrees, to add agent to swarm cluster"
	echo "usage ./docker_swarm_agent.sh <node_ip> <token>"
	exit
else
	echo "use swarm token $2 and node_ip $1"
fi

sudo cp ./docker-tcp.socket /etc/systemd/system/docker-tcp.socket

sudo systemctl enable docker-tcp.socket
sudo systemctl stop docker
sudo systemctl start docker-tcp.socket
sudo systemctl start docker


#sudo docker -H tcp://0.0.0.0:2375 -d

sudo docker run -d swarm join --addr=$1:2375 token://$1