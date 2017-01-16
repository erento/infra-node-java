FROM node:7.4.0-slim
MAINTAINER 'developers@erento.com'

RUN apt-get update && apt-get install --no-install-recommends -y \
    openjdk-7-jre-headless git curl bzip2 dnsmasq &&\

    # Npm needs username to checkout git repos.
    git config --global user.name "temp name" &&\
    git config --global user.email "temp@example.com"

# Add local TLDs

RUN echo '127.0.0.1 localhost.com localhost.at localhost.ch localhost.co.uk' > /etc/dnsmasq_hosts
RUN echo '\naddn-hosts=/etc/dnsmasq_hosts' >> /etc/dnsmasq.conf

RUN mkdir /app
WORKDIR /app
