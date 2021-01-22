#!/bin/bash

ubuntu_style() {
	echo "ubuntu style"
	read -p "package ?: " pkg
	sudo apt install ${pkg}
}

centos_style() {
	echo "centos style"
	read -p "package ?: " pkg
	sudo yum install ${pkg}
}


os=`cat /etc/os-release | grep '^ID=' | cut -d '=' -f 2`
echo "${os}"

if [ ${os} = "ubuntu" ]
then
        ubuntu_style
else
        centos_style
fi
