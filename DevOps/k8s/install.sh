#!/bin/bash


./installation-scripts/docker/install-docker.sh

./installation-scripts/k8s/install-k8s.sh

./installation-scripts/k8s/load-images.sh

./installation-scripts/k8s/install-flannel.sh

./installation-scripts/k8s/install-nginx.sh

./installation-scripts/deploy-cluster.sh

./installation-scripts/helm/install-helm.sh