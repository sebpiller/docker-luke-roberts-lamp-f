FROM debian:buster

LABEL arch="armv7|amd64"

MAINTAINER Sébastien Piller <me@sebpiller.ch>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends default-jre-headless && \
    apt-get install -y --no-install-recommends bluetooth blueman bluez

# Copy data for add-on
#COPY run.sh /
#RUN chmod a+x /run.sh

COPY bin/luke-roberts-lamp-f-cli-LATEST.jar /

# Ok if able to call usage of the command
HEALTHCHECK CMD java -jar /luke-roberts-lamp-f-cli-LATEST.jar --help

