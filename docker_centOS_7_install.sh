#!/bin/bash

sudo yum -q update
curl -O -sSL https://get.docker.com/rpm/1.7.0/centos-7/RPMS/x86_64/docker-engine-1.7.0-1.el7.centos.x86_64.rpm
sudo yum localinstall -y --nogpgcheck docker-engine-1.7.0-1.el7.centos.x86_64.rpm
sudo service docker start

## running test image
test_out=`sudo docker run hello-world | grep "Hello from Docker."`
##there should be any error if install was seccessfull
if [[ "${test_out}"=="Hello from Docker." ]]
then
	echo -e "\e[32mDocker installed seccessfully!\e[39m"
else
	echo -e "\e[31mcheck docker service\e[39m"
fi

sudo chkconfig docker on
