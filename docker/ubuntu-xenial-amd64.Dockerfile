FROM ubuntu:xenial

ARG timestamp
ARG uid=1000

ENV TIMESTAMP $timestamp
ENV JENKINS_UID $uid

RUN apt-get update && apt-get install -y \
        wget \
        sudo \
        git \
        python-dev \
        ruby-dev \
	build-essential \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install fpm
RUN useradd -s /bin/bash --uid $JENKINS_UID -m jenkins
RUN echo "ALL    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

ENV USER jenkins
