#!/bin/bash

sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible iptables-persistent kea -y

# ansible-playbook -i inventory/pis.yaml playbook.yaml -K
