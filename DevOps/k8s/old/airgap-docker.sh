#!/bin/bash

yum install yum-plugin-downloadonly yum-utils createrepo -y
mkdir /var/tmp/docker
mkdir /var/tmp/docker-installroot

yum install --downloadonly --installroot=/var/tmp/docker-installroot --downloaddir=/var/tmp/docker docker-ce -y

createrepo --database /var/tmp/docker
rm -rf /var/tmp/docker-installroot

cat <<EOF > /etc/yum.repos.d/offline-docker.repo
[offline-docker]
name=CentOS-$releasever - docker
baseurl=file:///var/tmp/docker
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF

repoclosure --repoid=offline-docker
