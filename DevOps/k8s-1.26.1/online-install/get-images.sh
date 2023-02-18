#!/bin/bash


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