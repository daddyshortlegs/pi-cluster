#!/bin/bash

export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i inventory/pis.yaml  workers.yaml -K --ask-pass

