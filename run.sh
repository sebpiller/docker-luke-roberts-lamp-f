#!/usr/bin/with-contenv bashio

java \
  -Dlogback.configurationFile=/logback.xml \
  -jar /luke-roberts-lamp-f-cli-LATEST.jar \
  --config /lamp-f.yaml \
  {}

