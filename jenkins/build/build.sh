#!/bin/bash

echo '+ Copying Jar file "/home/ubuntu/jenkins/pipeline/jenkins/build/" location +'
cp -f /home/ubuntu/jenkins/pipeline/java-app/target/*jar /home/ubuntu/jenkins/pipeline/jenkins/build/
echo '+ Copy complete +'


echo '+ Building Docker Image +'
echo ' '
cd /home/ubuntu/jenkins/pipeline/jenkins/build &&
    docker-compose build --no-cache
echo ' '
echo '+ Image build complete +'