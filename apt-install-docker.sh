#! /bin/bash

#uninstall all conflicting packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

#update system
sudo apt update

#install prerequisite packages
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

#add gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#add docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#install docker-ce
sudo apt install -y docker-ce

#start & enable docker
sudo systemctl start docker
sudo systemctl enable docker

#check
sudo systemctl is-active docker
docker --version

#add docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64" -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
docker-compose version
