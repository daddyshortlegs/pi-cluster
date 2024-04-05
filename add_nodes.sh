#!/bin/bash

TOKEN=$(microk8s.add-node --format json | jq .urls[0])
ssh -t pi@10.0.0.2 "microk8s join ${TOKEN} --worker"

TOKEN=$(microk8s.add-node --format json | jq .urls[0])
ssh -t pi@10.0.0.3 "microk8s join ${TOKEN} --worker"

TOKEN=$(microk8s.add-node --format json | jq .urls[0])
ssh -t pi@10.0.0.4 "microk8s join ${TOKEN} --worker"
