#!/bin/bash


# install the Kubernetes repository:
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
        https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF


# download the Kubernetes utilities
yumdownloader --assumeyes --destdir=/var/rpm_dir/kube --resolve yum-utils kubeadm kubelet kubectl ebtables