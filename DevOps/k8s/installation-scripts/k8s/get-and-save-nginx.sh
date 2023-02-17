#!/bin/bash


curl https://raw.githubusercontent.com/kubernetes/ingress-nginx/ingress-nginx-3.8.0/deploy/static/provider/baremetal/deploy.yaml -o deploy.yaml

docker pull k8s.gcr.io/ingress-nginx/controller:v0.41.0
docker pull docker.io/jettech/kube-webhook-certgen:v1.5.0

mkdir -p /var/rpm_dir/kube/nginx
mv deploy.yaml /var/rpm_dir/kube/nginx/deploy.yaml

docker save k8s.gcr.io/ingress-nginx/controller:v0.41.0 > /var/rpm_dir/kube/nginx/ingress-nginx-controller:v0.41.0.tar
docker save docker.io/jettech/kube-webhook-certgen:v1.5.0 > /var/rpm_dir/kube/nginx/jettech-kube-webhook-certgen:v1.5.0.tar