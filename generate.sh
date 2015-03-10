#!/bin/bash

docker rm strongswan-build || true
docker run --name strongswan-build -v $PWD:/root/ ubuntu bash /root/install.sh
cd build/
tar -c * | xz - > ../strongswan.tar.xz
cd ..
