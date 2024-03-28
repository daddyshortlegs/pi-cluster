#!/bin/bash

ansible-playbook -i inventory/pis.yaml playbook.yaml -K
