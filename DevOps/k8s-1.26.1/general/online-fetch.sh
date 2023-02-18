#!/bin/bash

# GET ALL THE RPM PACKAGES

# download utilities
yum install --nogpgcheck -y yum-utils createrepo


# add repos
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo


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


mkdir -p /tmp/k8s/repo
cd /tmp/k8s/repo

repotrack yum-utils
repotrack device-mapper-persistent-data
repotrack lvm2
repotrack docker-ce
repotrack container-selinux

repotrack kubeadm
repotrack kubelet
repotrack kubectl
repotrack ebtables

cd /root

createrepo --database /tmp/k8s/repo

# PERFORM INSTALLATION OF K8s

# prerequisities

# disable firewalld
systemctl stop firewalld

# set master hostname
hostnamectl set-hostname 'master'

# disable swap
swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab

# disable selinux
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system

yum install --nogpgcheck -y yum-utils
yum install --nogpgcheck -y device-mapper-persistent-data lvm2 container-selinux
yum install --nogpgcheck -y docker-ce

systemctl start docker
systemctl enable docker

yum install --nogpgcheck -y kubeadm kubelet kubectl ebtables


sed -i '/^disabled_plugins / s/^/#/' /etc/containerd/config.toml

systemctl restart docker
systemctl restart containerd

# GET THE CONTROL PLANE IMAGES

mkdir -p /tmp/k8s/control-plane-images
kubeadm config images list >> /tmp/control-plane-images.txt

while IFS= read -r image
do
    image_name=$(echo $image | awk -F '/' '{ print $NF }')
    docker pull $image
    docker save $image > /tmp/k8s/control-plane-images/$image_name.tar
done < "/tmp/control-plane-images.txt"

rm /tmp/control-plane-images.txt

# GET THE FLANNEL IMAGES

mkdir -p /tmp/k8s/flannel
curl https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml -o /tmp/k8s/flannel/kube-flannel.yml

cat /tmp/k8s/flannel/kube-flannel.yml | grep image | grep -v '#' | sort -u | awk '{ print $2 }' > /tmp/flannel-images.txt

while IFS= read -r image
do
    image_name=$(echo $image | awk -F '/' '{ print $NF }')
    docker pull $image
    docker save $image > /tmp/k8s/flannel/$image_name.tar
done < "/tmp/flannel-images.txt"

rm /tmp/flannel-images.txt

# GET DOCKER REGISTRY IMAGE

mkdir -p /tmp/k8s/docker-registry
docker pull docker.io/registry:latest
docker save docker.io/registry:latest > /tmp/k8s/docker-registry/docker-registry.tar

tar -zcvf k8s.tar.gz /tmp/k8s