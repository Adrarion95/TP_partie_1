#!/bin/bash

ubuntu_style() {
	echo "ubuntu style"
	wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
	sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \/etc/apt/sources.list.d/jenkins.list'
	sudo apt update
	sudo apt install jenkins default-jre
	path=`type -p java`
	sudo echo "PATH=${path}:$PATH" >> /etc/bash.bashrc
}

centos_style() {
	echo "centos style"
	sudo yum install java-1.8.0-openjdk-devel
	curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
	sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
	sudo yum install jenkins
	sudo systemctl enable jenkins
	sudo systemctl start jenkins
}


os=`cat /etc/os-release | grep '^ID=' | cut -d '=' -f 2`
echo "${os}"

if [ ${os} = "ubuntu" ]
then
        ubuntu_style
else
        centos_style
fi
