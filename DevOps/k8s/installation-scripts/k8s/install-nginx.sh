#!/bin/bash

# extract images
docker load < /var/rpm_dir/kube/nginx/jettech-kube-webhook-certgen:v1.5.0.tar
docker load < /var/rpm_dir/kube/nginx/ingress-nginx-controller:v0.41.0.tar