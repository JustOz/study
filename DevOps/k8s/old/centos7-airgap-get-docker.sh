#!/bin/bash


# Upload rpm db
sudo yum check-update

# Adds the Docker repo
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install yum-utils
sudo yum install -y yum-utils -y

# Get dependencies
repoquery -R --resolve --recursive docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin device-mapper-persistent-data lvm2 | xargs -r yumdownloader --nogpgcheck