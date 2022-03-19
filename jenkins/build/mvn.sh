#!/bin/bash

echo '##############################################'
echo '################ Building Jar ################' 
echo '##############################################'

WORKSPACE=/home/ubuntu/jenkins/jenkins_home/workspace/pipeline-work2

docker container run --rm -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:ibmjava-alpine "$@"
