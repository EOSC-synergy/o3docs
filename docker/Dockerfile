# If one wants to create documentation for local hosting, 
# this Dockerfile can be used to generate necessary Docker Image.
#
# Dockerfile has following Arguments: branch
# branch - user repository branch to clone (default: master, other option: test)
#
# To build the image:
# $ docker build -t <dockerhub_user>/<dockerhub_repo> --build-arg arg=value .
# or using default args:
# $ docker build -t <dockerhub_user>/<dockerhub_repo> .
#
# Usage example:
# $ docker run --rm -ti -v $PWD:/srv/docs_out \
#   -e HOSTUSER=$(id -u) -e HOSTGROUP=$(id -g) <dockerhub_user>/<dockerhub_repo>
#

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

ENV DOCSREPO "https://git.scc.kit.edu/synergy.o3as/o3as.data.kit.edu.git"
ENV BUILDTARGET "html"
ENV HOSTUSER 1000
ENV HOSTGROUP 1000

# Script to generate docs
# N.B. build_docs.sh needs:
# ${DOCSREPO}, ${BUILDTARGET}, ${HOSTUSER}, ${HOSTGROUP} environments to be set
ADD ./build_docs.sh /srv
RUN chmod +x build_docs.sh

CMD ["/srv/build_docs.sh"]
