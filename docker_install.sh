#!/bin/bash

sudo apt-get update
sudo apt-get install -y ssh
sudo apt-get install -y curl
sudo sed -i 's/without_password/yes/g'
service ssh restart
sudo apt-get install -y software-properties-common apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get purge lxc-docker*
sudo apt-get purge docker-engine
sudo apt-get autoremove --purge docker-engine
sudo rm -rf /var/lib/docker
sudo apt-get install -y docker-engine
sudo curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
service docker start
sudo apt-get install virtualbox-guest-dkms
reboot
