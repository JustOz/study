#!/bin/bash


./installation-scripts/docker/get-docker.sh

./installation-scripts/k8s/get-k8s.sh

./installation-scripts/k8s/get-and-save-images.sh

./installation-scripts/k8s/get-and-save-flannel.sh

./installation-scripts/k8s/get-and-save-nginx.sh

./installation-scripts/helm/get-helm.sh