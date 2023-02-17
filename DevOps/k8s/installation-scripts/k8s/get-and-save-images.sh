#!/bin/bash


mkdir -p /var/rpm_dir/kube/k8s-control-plane-images
kubeadm config images list >> /tmp/control-plane-images

while IFS= read -r image
do
    image_name=$(echo $image | awk -F '/' '{ print $NF }')
    docker pull $image
    docker save $image > /var/rpm_dir/kube/k8s-control-plane-images/$image_name.tar 
done < "/tmp/control-plane-images"
