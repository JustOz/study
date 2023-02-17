#!/bin/bash


yum install yum-utils -y

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yumdownloader --assumeyes --destdir=/var/rpm_dir/yum --resolve yum-utils
yumdownloader --assumeyes --destdir=/var/rpm_dir/dm --resolve device-mapper-persistent-data
yumdownloader --assumeyes --destdir=/var/rpm_dir/lvm2 --resolve lvm2
yumdownloader --assumeyes --destdir=/var/rpm_dir/docker-ce --resolve docker-ce
yumdownloader --assumeyes --destdir=/var/rpm_dir/se --resolve container-selinux