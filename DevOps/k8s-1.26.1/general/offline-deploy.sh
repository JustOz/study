#!/bin/bash
#DEBUG THIS - SEEMS TO NOT WORK AUTOMATICALLY FOR SOME REASON BUT DOES WORK MANUALLY?

kubectl version
kubeadm init --pod-network-cidr=10.244.0.0/16 --kubernetes-version=v1.26.1 --v=5 --image-repository=localhost:5000 > ~/kubeadm.init.log

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl get nodes

grep -q "KUBECONFIG" ~/.bashrc || {
    echo 'export KUBECONFIG=/etc/kubernetes/admin.conf' >> ~/.bashrc
    . ~/.bashrc
}

kubectl apply -f /k8s/flannel/kube-flannel.yml