FROM node:7.2.1-slim
MAINTAINER 'developers@erento.com'

RUN apt-get update && apt-get install --no-install-recommends -y \
    openjdk-7-jre-headless git

RUN mkdir /app
WORKDIR /app
