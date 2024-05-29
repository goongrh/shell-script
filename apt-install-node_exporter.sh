#! /bin/bash

#update system
sudo apt update -y

#install wget
sudo apt install wget -y

#download node_exporter package
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.1/node_exporter-1.8.1.linux-amd64.tar.gz

#extract node_exporter package
tar -xvzf node_exporter-1.8.1.linux-amd64.tar.gz

#move binary to /usr/local/bin
sudo mv node_exporter-1.8.1.linux-amd64/node_exporter /usr/local/bin/

#create node_exporter service file
cat <<EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target
[Service]
User=root
Group=root
Type=simple
ExecStart=/usr/local/bin/node_exporter
[Install]
WantedBy=multi-user.target
EOF

#reload daemon, start service, enable service, and verify service
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
systemctl is-active node_exporter
