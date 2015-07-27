#!/bin/bash

cd jenkins_files
bash build_jenkins.sh
cd ..
docker cp jenkins:/root/.ssh/id_rsa.pub $PWD/ubuntu_slave
cd ubuntu_slave
bash build_ubuntu_slave.sh
