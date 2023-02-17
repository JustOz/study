#!/bin/bash


# disable firewalld
systemctl stop firewalld

# set master hostname
hostnamectl set-hostname 'master'

# disable swap
swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab
sed -i '/^disabled_plugins / s/^/#/' /etc/containerd/config.toml

systemctl restart containerd
systemctl restart docker

sleep 2

# disable selinux
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system

echo "source <(kubectl completion bash)" >> ~/.bashrc

kubectl version
kubeadm init --pod-network-cidr=10.244.0.0/16 --kubernetes-version=v1.26.1 --v=5 > ~/kubeadm.init.log

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl get nodes

grep -q "KUBECONFIG" ~/.bashrc || {
    echo 'export KUBECONFIG=/etc/kubernetes/admin.conf' >> ~/.bashrc
    . ~/.bashrc
}

kubectl apply -f /var/rpm_dir/kube/flannel/kube-flannel.yml