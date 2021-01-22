#!/bin/bash

ubuntu_style() {
	echo "ubuntu style"
	read -p "name of package you want to remove: " pkg
	sudo apt remove ${pkg}
}

centos_style() {
	echo "centos style"
	read -p "name of package you want to remove: " pkg
	sudo yum remove ${pkg}
	
}


os=`cat /etc/os-release | grep '^ID=' | cut -d '=' -f 2`
echo "${os}"

if [ ${os} = "ubuntu" ]
then
        ubuntu_style
else
        centos_style
fi
