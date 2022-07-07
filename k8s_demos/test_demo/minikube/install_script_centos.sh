#! /bin/bash


## Begin dependencies
## Uninstall old Docker versions
sudo yum -y remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
# Setup Docker repo
 sudo yum install -y yum-utils
 sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
# Install Docker
 sudo yum -y install docker-ce docker-ce-cli containerd.io
# Start Docker
sudo systemctl start docker
## End dependencies

# Install the latest "minikube" release
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
sudo rpm -Uvh minikube-latest.x86_64.rpm

# Start 'minikube' cluster
minikube start