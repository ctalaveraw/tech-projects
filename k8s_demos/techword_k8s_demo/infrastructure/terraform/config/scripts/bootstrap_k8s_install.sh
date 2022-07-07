#!/bin/bash

## This script will bootstrap an Kubernetes cluster


## Don't run until instance is fully up
echo "Please wait for EC2 to fully initialize..."
sleep 5m

## Run OS updates
echo "--Running Ubuntu OS updates--"
sudo apt-get update -y

## Install Docker dependencies
echo "--Installing Docker dependencies--"
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

## Downloading Docker public signing key
echo "--Downloading Docker GPG Key--"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

## Add Docker repo
echo "--Adding Docker 'apt' repository--"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

## Install Docker Engine
echo "--Installing Docker Engine--"
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin

## Start Docker
echo "--Starting Docker--"
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl start docker.service
sudo systemctl start containerd.service


## Install Kubernetes dependencies
echo "--Installing Kubernetes dependencies--"
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

## Downloading K8s public signing key
echo "--Downloading K8s GPG Key--"
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

## Add K8s repo
echo "--Adding Kubnernetes 'apt' repository--"
echo \
    "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | \
    sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y

## Install k8s
echo "--Installing Kubernetes--"
sudo apt-get install -y \
kubelet \
kubeadm \
kubectl \
kubernetes-cni

