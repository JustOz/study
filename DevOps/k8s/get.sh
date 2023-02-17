#!/bin/bash


./installation-scripts/docker/get-docker.sh

sleep 1

./installation-scripts/k8s/get-k8s.sh

sleep 1

./installation-scripts/k8s/get-and-save-images.sh

sleep 1

./installation-scripts/k8s/get-and-save-flannel.sh

sleep 1

./installation-scripts/k8s/get-and-save-nginx.sh

sleep 1

./installation-scripts/helm/get-helm.sh