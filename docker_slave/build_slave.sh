#!/bin/bash

docker build -t zlanger/dind .
docker run -p 5022:22 --name slave1 --privileged -t -i zlanger/dind