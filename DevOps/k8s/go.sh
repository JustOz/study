#!/bin/bash


./installation-scripts/docker/get-docker.sh
./installation-scripts/docker/install-docker.sh

./installation-scripts/k8s/get-k8s.sh
./installation-scripts/k8s/install-k8s.sh

./installation-scripts/k8s/get-and-save-images.sh
./installation-scripts/k8s/load-images.sh

./installation-scripts/k8s/get-and-save-flannel.sh
./installation-scripts/k8s/install-flannel.sh

./installation-scripts/k8s/get-and-save-nginx.sh
./installation-scripts/k8s/install-nginx.sh

./installation-scripts/deploy-cluster.sh