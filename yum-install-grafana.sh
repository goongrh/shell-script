#! /bin/bash

#Create Grafana repository
cat <<EOF > /etc/yum.repos.d/grafana.repo
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF

#Show yum repository list
sudo yum repolist

#Update your local package
sudo yum update -y
 
#Install Grafana
sudo yum install grafana -y

#Restart daemon
sudo systemctl daemon-reload

#Enable service to start at boot
sudo systemctl enable grafana-server.service

#Start Grafana service
sudo systemctl start grafana-server

#Check that your Grafana service is active
sudo systemctl is-active grafana-server
