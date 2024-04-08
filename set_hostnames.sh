#!/bin/bash

ansible-playbook -i inventory/pis.yaml  workers.yaml  -K --ask-pass

