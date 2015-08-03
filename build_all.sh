#!/bin/bash
# Run in a docker terminal

cd jenkins_files
docker build -t zlanger/dockerjenkins .
docker run -p 8080:8080 --name jenkins --privileged -d zlanger/dockerjenkins
cd ..
docker cp jenkins:/root/.ssh/id_rsa.pub $PWD/ubuntu_slave
cd ubuntu_slave
docker build -t zlanger/dockerubuntu .
rm id_rsa.pub
docker run -p 5000:22 --name ubuntu_slave -t zlanger/dockerubuntu &
TASK_PID=$!
sleep 5
kill $TASK_PID
docker run -p 5011:22 --name ubuntu_slave2 -t zlanger/dockerubuntu &
TASK_PID=$!
sleep 5
kill $TASK_PID
