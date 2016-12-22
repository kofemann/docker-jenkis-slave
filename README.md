Dockerized jenkins slave
========================


To build
--------
```
$ docker build -t local/js .
```

Usage
-----
```
$ docker -e JENKINS_OPT="-username XXX -password XXX" local/js https://ci.my.domain
```


Environments
------------
```
# extra options passed to JVM
JENKINS_JAVA_OPT=

# extra options passed to jenkins slave
JENKINS_OPT=

# extra labels passed to jenkins slave
JENKINS_EXTRA_LABLES=

# number of executors to run
JENKINS_EXECUTORS=1
```
