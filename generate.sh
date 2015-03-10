#!/bin/bash
set -ex

docker rm strongswan-build || true
docker run --name strongswan-build -v $PWD:/root/ ubuntu bash /root/build.sh
cd build/
tar -c * | xz - > ../strongswan.tar.xz
cd ..
