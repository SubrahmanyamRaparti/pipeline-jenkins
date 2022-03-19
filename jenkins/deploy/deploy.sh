#!/bin/bash

echo subrahmanyamr/java_app > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $DOCKER_PASS_KEY >> /tmp/.auth

IPV4=ec2-13-233-131-230.ap-south-1.compute.amazonaws.com

scp -i "/home/ubuntu/Linux.pem" /tmp/.auth ubuntu@$IPV4:/tmp/.auth

echo '1. Copied /tmp/.auth file'

scp -i "/home/ubuntu/Linux.pem" /home/ubuntu/jenkins/pipeline/jenkins/deploy/publish.sh ubuntu@$IPV4:/tmp/publish.sh

echo '2. Copied publish.sh file'

scp -i "/home/ubuntu/Linux.pem" -r /home/ubuntu/jenkins/pipeline/jenkins/deploy/maven/ ubuntu@$IPV4:

echo '3. Copied maven/docker-compose.yml file'

ssh -i "/home/ubuntu/Linux.pem" ubuntu@IPV4 "/tmp/publish.sh"

rm -fr /tmp/.auth
