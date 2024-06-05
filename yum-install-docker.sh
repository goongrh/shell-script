#! /bin/bash

#add docker-ce repo
#sudo yum config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo yum config-manager --add-repo=https://download.docker.com/linux/rhel/docker-ce.repo

#install docker-ce
sudo yum install -y docker-ce

#start & enable docker
sudo systemctl start docker
sudo systemctl enable docker

#check
sudo systemctl is-active docker
docker --version

#add docker-compose
#sudo curl -L "https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64" -o /usr/bin/docker-compose
#sudo chmod +x /usr/bin/docker-compose
#docker-compose version
