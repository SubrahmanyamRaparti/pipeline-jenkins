#!/bin/bash

export IMAGE=$(sed -n '1p' /tmp/.auth)
export BUILD_TAG=$(sed -n '2p' /tmp/.auth)
export DOCKER_PASS_KEY=$(sed -n '3p' /tmp/.auth)

# cd ~/maven && docker stack deploy -c docker-compose.yml Hello_World_App
cd ~/maven && docker-compose up -d