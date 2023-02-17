#!/bin/bash


tar -xvf /var/rpm_dir/helm/helm-v3.11.1-linux-amd64.tar.gz --directory /var/rpm_dir/helm/
cp /var/rpm_dir/helm/linux-amd64/helm /bin/helm

helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set installCRDs=true