FROM node:7.10.0-slim
MAINTAINER 'developers@erento.com'

RUN echo "deb http://http.debian.net/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list &&\
    apt-get update && apt-get install --no-install-recommends -y \
    git curl bzip2 nano dnsutils ssh python &&\
    apt-get install --no-install-recommends -y -t jessie-backports \
    openjdk-8-jre-headless ca-certificates-java &&\

    # Npm needs username to checkout git repos.
    git config --global user.name "temp name" &&\
    git config --global user.email "temp@example.com"

RUN mkdir /app
WORKDIR /app
