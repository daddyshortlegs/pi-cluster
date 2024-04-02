#!/bin/bash

sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible iptables-persistent kea -y
sudo cp templates/etc/netplan/01-netcfg-master.yaml /etc/netplan
sudo netplan apply
sudo cp templates/etc/kea/kea-dhcp4.conf /etc/kea
sudo systemctl restart kea-dhcp4-server


# ansible-playbook -i inventory/pis.yaml playbook.yaml -K
