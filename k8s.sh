#!/bin/bash

export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i inventory/pis.yaml microk8s.yaml -K --ask-pass
