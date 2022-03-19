#!/bin/bash

echo '+ Pushing the Hello World application image to subrahmanyamr Docker repo+'

echo '+ Logging into Docker hub +'

docker login -u subrahmanyamr -p $DOCKER_PASS_KEY && \
    echo '+ Logged into Docker hub successfully +'

docker push subrahmanyamr/java_app:$BUILD_TAG