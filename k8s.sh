#!/bin/bash

ansible-playbook -i inventory/pis.yaml microk8s.yaml -K --ask-pass
