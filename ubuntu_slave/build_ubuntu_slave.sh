#!/bin/bash

docker build -t zlanger/dockerubuntu .
docker run -p 5000:22 --name ubuntu_slave -v $(pwd):/usr/src/app --privileged -t zlanger/dockerubuntu