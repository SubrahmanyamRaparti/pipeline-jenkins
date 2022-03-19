#!/bin/bash

echo subrahmanyamr/java_app > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $DOCKER_PASS_KEY >> /tmp/.auth


scp -i "/home/ubuntu/Linux.pem" /tmp/.auth ubuntu@ec2-3-108-250-91.ap-south-1.compute.amazonaws.com:/tmp/.auth

echo '1. Copied /tmp/.auth file'

scp -i "/home/ubuntu/Linux.pem" /home/ubuntu/jenkins/pipeline/jenkins/deploy/publish.sh ubuntu@ec2-3-108-250-91.ap-south-1.compute.amazonaws.com:/tmp/publish.sh

echo '2. Copied publish.sh file'

scp -i "/home/ubuntu/Linux.pem" -r /home/ubuntu/jenkins/pipeline/jenkins/deploy/maven/ ubuntu@ec2-3-108-250-91.ap-south-1.compute.amazonaws.com:

echo '3. Copied maven/docker-compose.yml file'

ssh -i "/home/ubuntu/Linux.pem" ubuntu@ec2-3-108-250-91.ap-south-1.compute.amazonaws.com "/tmp/publish.sh"

rm -fr /tmp/.auth