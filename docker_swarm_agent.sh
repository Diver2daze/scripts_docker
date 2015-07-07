docker -H tcp://0.0.0.0:2375 -d

docker run -d swarm join --addr=<node_ip:2375> token://$1