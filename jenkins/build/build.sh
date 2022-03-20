#!/bin/bash

echo '+ Copying Jar file "/home/ubuntu/jenkins/pipeline/jenkins/build/" location +'
cp -f ./java-app/target/*jar ./jenkins/build/
echo '+ Copy complete +'


echo '+ Building Docker Image +'
echo ' '
cd ./jenkins/build &&
    docker-compose build --no-cache
echo ' '
echo '+ Image build complete +'