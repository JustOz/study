#!/bin/bash

# unpack and load images
for image in /var/rpm_dir/kube/k8s-control-plane-images/*.tar
do 
    docker load < $image
    echo "loaded image from $image"
done