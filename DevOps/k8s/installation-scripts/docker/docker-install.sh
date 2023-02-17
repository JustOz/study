#!/bin/bash


# Install yum utilities (offline machine)
yum install -y --cacheonly --disablerepo=* /var/rpm_dir/yum/*.rpm
# install Docker file drivers:
yum install -y --cacheonly --disablerepo=* /var/rpm_dir/dm/*.rpm
yum install -y --cacheonly --disablerepo=* /var/rpm_dir/lvm2/*.rpm
# install container-selinux:
yum install -y --cacheonly --disablerepo=* /var/rpm_dir/se/*.rpm
# install Docker:
yum install -y --cacheonly --disablerepo=* /var/rpm_dir/docker-ce/*.rpm
# enable and start the docker service:
systemctl enable docker
systemctl start docker
# verify docker:
systemctl status docker
docker version