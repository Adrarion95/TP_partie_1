#!/bin/bash

ubuntu_style() {
	echo "ubuntu style"
	sudo apt install git
}

centos_style() {
	echo "centos style"
	sudo yum install git
}


os=`cat /etc/os-release | grep '^ID=' | cut -d '=' -f 2`
echo "${os}"

if [ ${os} = "ubuntu" ]
then
        ubuntu_style
else
        centos_style
fi
