#!/bin/sh

/usr/bin/java ${JENKINS_JAVA_OPT} \
	-jar /usr/share/jenkins/lib/swarm-client.jar \
	-description "Docker Build agent" \
	-fsroot /var/lib/jenkins \
	-name docker-`hostname -s` \
	-executors ${JENKINS_EXECUTORS} \
	-labels "jenkins-slave `uname -snio` ${JENKINS_SYS_LABELS} ${JENKINS_EXTRA_LABLES}" \
	${JENKINS_OPT} \
	-master $1


