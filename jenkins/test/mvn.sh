#!/bin/bash

echo '+ Testing the Hello World application +'

docker container run --rm -v /home/ubuntu/jenkins/pipeline/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:ibmjava-alpine "$@"