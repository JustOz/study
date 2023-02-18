#!/bin/bash


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

# INSTALL THE RPM PACKAGES
echo "[k8s]
name=CentOS-\$releasever - k8s
baseurl=file:///k8s/repo/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7" >  /etc/yum.repos.d/k8s.repo


yum install --disablerepo=* --enablerepo=k8s --nogpgcheck -y yum-utils
yum install --disablerepo=* --enablerepo=k8s --nogpgcheck -y device-mapper-persistent-data lvm2 container-selinux
yum install --disablerepo=* --enablerepo=k8s --nogpgcheck -y docker-ce

systemctl start docker
systemctl enable docker

yum install --disablerepo=* --enablerepo=k8s --nogpgcheck -y kubeadm kubelet kubectl ebtables


sed -i '/^disabled_plugins / s/^/#/' /etc/containerd/config.toml

systemctl restart docker
systemctl restart containerd

sleep 1

# LOAD IMAGES
find /k8s/control-plane-images -name "*.tar" -exec bash -c 'docker load < {}' \;
find /k8s/flannel -name "*.tar" -exec bash -c 'docker load < {}' \;
find /k8s/docker-registry -name "*.tar" -exec bash -c 'docker load < {}' \;

# SETUP LOCAL REGISTRY
docker run -d -p 5000:5000 --name my-registry registry:latest

sleep 2

# push local images to the local registry
# docker image list | sed -r 's/^[^\/]*[\/]//g' | tail -n +2 | awk '{ print $1":"$2 }' > /tmp/local-images
docker image list | tail -n +2 | awk '{ print $1":"$2}' > /tmp/local-images


while IFS= read -r image
do
    image_name=$(echo $image | awk -F '/' '{ print $NF }')
    docker tag $image localhost:5000/$image_name
    docker push localhost:5000/$image_name
done < "/tmp/local-images"

rm -f /tmp/local-images

echo "source <(kubectl completion bash)" >> ~/.bashrc

sleep 0.5

systemctl start kubelet
systemctl enable kubelet