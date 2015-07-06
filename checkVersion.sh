#!/bin/bash

function checkver (){
    vercomp $1 $2
    case $? in
        0) op='=';;
        1) op='>';;
        2) op='<';;
    esac
    if [[ $op != $3 ]]
    then
        echo 1
    else
        echo 0
    fi
}

vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}


KERNEL_VER=`uname -r | sed 's/-.*//'`

if [ "$(checkver ${KERNEL_VER} '3.10' '>')" -eq 0 ]
then
    echo "current Kernel version ${KERNEL_VER} > 3.10  --- ok"
else
    echo "current Kernel version ${KERNEL_VER} should be > 3.10"
    exit
fi
IPTABLES_VER=`iptables -V |  sed 's/iptables v*//'`

if [ "$(checkver ${IPTABLES_VER} '1.4' '>')" -eq 0 -o "$(checkver ${IPTABLES_VER} '1.4' '=')" -eq 0 ]
then
    echo "current Iptables version ${IPTABLES_VER} > 1.4  --- ok"
else
    echo "current Iptables version ${IPTABLES_VER} should be > 1.4"
    exit
fi
GIT_VER=`git --version |  sed 's/git version *//'`

if [ "$(checkver ${GIT_VER} '1.7' '>')" -eq 0 -o "$(checkver ${GIT_VER} '1.7' '=')" -eq 0 ]
then
    echo "current Git version ${GIT_VER} > 1.7  --- ok"
else
    echo "current Git version ${GIT_VER} should be > 1.7"
    exit
fi
