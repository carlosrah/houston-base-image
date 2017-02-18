FROM debian:latest
MAINTAINER Carlos Aparicio

ENV LANG C.UTF-8

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive  apt-get install -y --force-yes curl vi ssh nano visudo tar bash zip unzip wget rsync oracle-java8-installer oracle-java8-set-default
RUN rm -rf /var/cache/oracle-jdk8-installer
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean

