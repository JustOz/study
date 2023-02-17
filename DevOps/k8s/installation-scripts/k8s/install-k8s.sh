#!/bin/bash

yum install -y --cacheonly --disablerepo=* /var/rpm_dir/kube/*.rpm
# run kubeadm, which returns a list of required images:
kubeadm config images list > images.txt