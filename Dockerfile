FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive

LABEL arch="armv7|amd64"

MAINTAINER Sébastien Piller <me@sebpiller.ch>

RUN printf "luke-roberts-lamp-f" > /etc/hostname

RUN apt-get update && \
    apt-get install -y default-jre-headless && \
    apt-get install -y bluez bluez-hcidump

RUN printf "\nalias lampf='java -Dlogback.configurationFile=/luke-roberts/logback.xml -jar /luke-roberts/luke-roberts-lamp-f-cli-LATEST.jar '\n" >> ~/.bashrc

COPY docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh

RUN mkdir -p /luke-roberts/
COPY bin/luke-roberts-lamp-f-cli-LATEST.jar /luke-roberts/
COPY logback.xml /luke-roberts

HEALTHCHECK CMD lampf --version

ENTRYPOINT sh docker-entrypoint.sh

