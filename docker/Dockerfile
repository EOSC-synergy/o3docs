# Dockerfile has following Arguments: branch
# branch - user repository branch to clone (default: master, other option: test)
#
# To build the image:
# $ docker build -t <dockerhub_user>/<dockerhub_repo> --build-arg arg=value .
# or using default args:
# $ docker build -t <dockerhub_user>/<dockerhub_repo> .

# Base image, e.g. ubuntu:bionic
FROM ubuntu:20.04

LABEL maintainer='V.Kozlov (KIT)'

# What user branch to clone (!)
ARG branch=master

# Install system updates and tools
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y --no-install-recommends \
# Install system updates and tools
        build-essential \
        curl \
        git \
        nano \
        procps \
        python3-dev \
        python3-pip \
        python3-wheel \
        python3-setuptools && \
# Clean up & back to dialog front end
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*


WORKDIR /srv/

# Install user app
RUN if [ -d o3as.data.kit.edu.git ]; then \
        cd o3as.data.kit.edu && git submodule update --init --recursive ; \
    else git clone --recurse-submodules https://git.scc.kit.edu/synergy.o3as/o3as.data.kit.edu.git && \
         cd o3as.data.kit.edu; fi && \
    pip3 install --no-cache -r requirements.txt && \
    rm -rf /root/.cache/pip/* && \
    rm -rf /tmp/*

WORKDIR /srv/o3as.data.kit.edu

CMD ["make", "html"]
