#!/bin/bash

ubuntu_style() {
	echo "ubuntu style"
	sudo useradd -s /bin/bash -d /opt/stack -m stack || true
	sudo echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack
	sudo rm -r -f /opt/stack/devstack
	echo "cloning devstack"
	sudo -u stack git clone https://opendev.org/openstack/devstack /opt/stack/devstack
	cd /opt/stack/devstack
	echo `pwd`
#	sudo -u stack echo "[[local|localrc]]
#ADMIN_PASSWORD=admin
#DATABASE_PASSWORD=$ADMIN_PASSWORD
#RABBIT_PASSWORD=$ADMIN_PASSWORD
#SERVICE_PASSWORD=$ADMIN_PASSWORD" > /opt/stack/devstack/local.conf
	sudo -u stack /opt/stack/devstack/stack.sh
	
}

centos_style() {
	echo "centos style"
	sudo su 
	echo -e "DEVICE=eth0 BOOTPROTO=none
ONBOOT=yes
PREFIX=24
IPADDR=192.168.2.203" > /etc/sysconfig/network-scripts/ifcfg-eth0
	systemctl restart network
	systemctl stop firewalld
	systemctl disable firewalld
	echo "selinux=enabled" >> /etc/selinux/config
	touch /.autorelabel
	
	yum -y update
	yum -y install centos-release-openstack-queens
	yum -y install openstack-packstack
	packstack --allinone --os-heat-install=y
}


os=`cat /etc/os-release | grep '^ID=' | cut -d '=' -f 2`
echo "${os}"

if [ ${os} = "ubuntu" ]
then
        ubuntu_style
else
        centos_style
fi
