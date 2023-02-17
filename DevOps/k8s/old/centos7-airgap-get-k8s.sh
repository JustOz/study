#!/bin/bash


# Upload rpm db
sudo yum check-update

# Adds the Kubernetes repository
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

# Install yum-utils
sudo yum install -y yum-utils -y

# Get dependencies
repoquery -R --resolve --recursive kubectl kbueadm kubelet | xargs -r yumdownloader --nogpgcheck