#!/bin/bash

# get kube-flannel.yml
curl https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml -o kube-flannel.yml

# determine flannel version
version=$(grep "image: docker.io/flannel/flannel:" kube-flannel.yml | head -n 1 | awk -F ':' '{ print $NF }')

mkdir -p /var/rpm_dir/kube/flannel
mv kube-flannel.yml /var/rpm_dir/kube/flannel/kube-flannel.yml

# download and save the required image (from previous command)
docker pull docker.io/flannel/flannel:$version
docker save docker.io/flannel/flannel:$version > /var/rpm_dir/kube/flannel/flannel:$version.tar
