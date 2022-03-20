FROM jenkins/jenkins

USER root

RUN apt-get update && apt-get install python3-pip -y && \
    pip3 install ansible --upgrade

RUN apt-get install iputils-ping -y

RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
    chmod +x get-docker.sh && \
    ./get-docker.sh

RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

USER jenkins