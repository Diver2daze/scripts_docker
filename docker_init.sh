#!/bin/bash
if [ -z $1 -o -z $2 ]
then
        echo "please set directory to store docker images"
        echo "usage ./docker_centOs_7_install.sh <images directory> <swarm filter label>"
        exit
else
        echo "use $1 direcotry to store docker images, and $2 for swarm filter"
fi

sudo sed -e "s;%FOLDER%;$1;g" -e "s;%LABEL%;$2;g" docker.template > docker.service
#sudo sed -e "s/^ExecStart.\{19\}/& -g $1 /"  docker.service
