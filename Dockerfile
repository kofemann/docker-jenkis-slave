# Based on CentOS 7
FROM centos:7


MAINTAINER dCache "https://www.dcache.org"

# install required packages
RUN yum -y -q install java-1.8.0-openjdk-headless git maven

# make directories for client binaries
RUN mkdir -p /usr/share/jenkins/bin
RUN mkdir -p /usr/share/jenkins/lib

# get jenkins swarm client
ADD https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/2.2/swarm-client-2.2-jar-with-dependencies.jar /usr/share/jenkins/lib/swarm-client.jar
RUN chmod +r /usr/share/jenkins/lib/swarm-client.jar

# copy entry point script and adjust permissions
COPY run.sh /usr/share/jenkins/bin/run.sh
RUN chmod +x /usr/share/jenkins/bin/run.sh

# use dedicated user to run jenkins slave
RUN groupadd -r jenkins
RUN useradd -r -g jenkins -d /var/lib/jenkins -c "Jenkins Build Slave" -m jenkins
USER jenkins

# keep jenkins workspace
VOLUME /var/lib/jenkins

ENV JENKINS_SYS_LABELS javac javac-8 git maven maven3 CentOS7
ENV JENKINS_EXECUTORS 1

ENTRYPOINT ["/usr/share/jenkins/bin/run.sh"]
