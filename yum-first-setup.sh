#! /bin/bash

#Update your local package
sudo yum update -y

#Install package
sudo yum install -y epel-release nano wget net-tools telnet git

#Turn off firewall
sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo firewall-cmd --state

#Turn off selinux & reboot
cat <<EOF > /etc/selinux/config
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=disabled
# SELINUXTYPE= can take one of these three values:
#     targeted - Targeted processes are protected,
#     minimum - Modification of targeted policy. Only selected processes are protected.
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted
EOF

sestatus

sleep 5

reboot
