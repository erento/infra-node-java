FROM node:7.7.0-slim
MAINTAINER 'developers@erento.com'

RUN apt-get update && apt-get install --no-install-recommends -y \
    openjdk-7-jre-headless git curl bzip2 nano dnsutils ssh python &&\

    # Npm needs username to checkout git repos.
    git config --global user.name "temp name" &&\
    git config --global user.email "temp@example.com"

RUN mkdir /app
WORKDIR /app
