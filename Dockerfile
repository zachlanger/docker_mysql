FROM rails:onbuild
MAINTAINER Zach Langer
RUN apt-get update
RUN apt-get install -y openjdk-7-jdk
RUN apt-get install -y openssh-server