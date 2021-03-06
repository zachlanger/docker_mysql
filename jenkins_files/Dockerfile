FROM ubuntu:14.04
MAINTAINER Zach Langer zlanger@comverge.com
ENV REFRESHED_AT 2015-07-14

# Install dependencies
RUN apt-get update -qq && apt-get install -qqy curl apt-transport-https
RUN curl https://get.docker.com/gpg | apt-key add -
RUN echo deb http://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list
RUN apt-get update -qq && apt-get install -qqy iptables ca-certificates lxc openjdk-6-jdk git-core lxc-docker

# Install jenkins
ENV JENKINS_HOME /opt/jenkins/data
ENV JENKINS_MIRROR http://mirrors.jenkins-ci.org

# Set up environment
RUN mkdir -p $JENKINS_HOME/plugins
RUN curl -sf -o /opt/jenkins/jenkins.war -L $JENKINS_MIRROR/war-stable/latest/jenkins.war

# Install plugins
RUN for plugin in chucknorris greenballs scm-api github github-api multiple-scms git-client git authentication-tokens token-macro ruby credentials ssh-credentials ssh-slaves durable-task slave-setup ws-cleanup ;\
    do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi \
       -L $JENKINS_MIRROR/plugins/${plugin}/latest/${plugin}.hpi ; done

ADD ./dockerjenkins.sh /usr/local/bin/dockerjenkins.sh
RUN chmod +x /usr/local/bin/dockerjenkins.sh

# Install ssh and git
RUN apt-get -y install openssh-client
RUN apt-get -y install git

VOLUME /var/lib/docker

EXPOSE 8080

ENTRYPOINT [ "/usr/local/bin/dockerjenkins.sh" ]

# Setup jobs and slaves
RUN mkdir -p /opt/jenkins/data/jobs/car_creation
RUN mkdir -p /opt/jenkins/data/jobs/creating_cars
RUN mkdir -p /opt/jenkins/data/nodes/slave1
RUN mkdir -p /opt/jenkins/data/nodes/slave2
COPY car_creation/* /opt/jenkins/data/jobs/car_creation/
COPY creating_cars/* /opt/jenkins/data/jobs/creating_cars/
COPY slave1/* /opt/jenkins/data/nodes/slave1/
COPY slave2/* /opt/jenkins/data/nodes/slave2/
COPY credentials.xml /opt/jenkins/data/

# Create ssh key
RUN ssh-keygen -q -b 4096 -t rsa -f /root/.ssh/id_rsa -P ""
