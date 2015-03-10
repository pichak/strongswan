#!/bin/bash
set -ex

# install dependencies
apt-get -y update
apt-get -y upgrade
apt-get -y build-dep strongswan

# build node.js
cd /root/
bash autogen.sh
./configure \
       --prefix=/usr\
       --sysconfdir=/etc\
       --enable-ha\
       --enable-eap-radius\
       --enable-eap-identity\
       --enable-eap-md5\
       --enable-eap-mschapv2\
       --enable-xauth-eap
make
make install DESTDIR=/root/build/
