#!/bin/bash

sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update -y
sudo apt install ansible -y

ansible-playbook -i inventory/pis.yaml controller.yaml -K --ask-pass

#sudo cp templates/etc/netplan/01-netcfg-master.yaml /etc/netplan
#sudo netplan apply

#sudo sysctl -w net.ipv4.ip_forward=1
#sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
#sudo apt install iptables-persistent kea -y
#sudo sh -c "iptables-save > /etc/iptables/rules.v4"

#sudo cp templates/etc/kea/kea-dhcp4.conf /etc/kea
#sudo systemctl restart kea-dhcp4-server

#ssh-keygen -t rsa -b 4096

# This stuff should be separate as the worker nodes may not be ready
#ssh-copy-id pi@10.0.0.2
#ssh-copy-id pi@10.0.0.3
#ssh-copy-id pi@10.0.0.4

