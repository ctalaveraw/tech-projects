#!/bin/bash


## Generate a key, adding in the hostname as the author
ssh-keygen -t rsa -f "../keys/ssh_k8s_demo" -P ""

## Show the created public key
cat ../keys/ssh_k8s_demo.pub
