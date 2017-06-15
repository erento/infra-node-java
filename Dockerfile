# Phantomjs isn't building with npm5 aka node:8.1.0
# https://github.com/Medium/phantomjs/issues/707
# https://github.com/npm/npm/issues/16896

FROM node:7.10-alpine
MAINTAINER 'developers@erento.com'

RUN apk add --no-cache \
    curl bind-tools bash nano \
    openssh-client git g++ make \
    openjdk8-jre python &&\

    # Npm needs username to checkout git repos.
    git config --global user.name "temp name" &&\
    git config --global user.email "temp@example.com"

RUN mkdir /app
WORKDIR /app
