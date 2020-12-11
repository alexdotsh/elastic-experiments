#!/bin/bash

elasticsearch-keystore create

ELASTICSEARCH_BOOTSTRAP_PASSWORD=$(elasticsearch-setup-passwords auto -b | grep 'PASSWORD elastic' | awk '{print $4}')

# export APM_SYSTEM_PASSWORD
# export KIBANA_SYSTEM_PASSWORD
export KIBANA_PASSWORD
# export LOGSTASH_SYSTEM_PASSWORD
# export BEATS_SYSTEM_PASSWORD
# export REMOTE_MONITORING_USER_PASSWORD
export ELASTIC_PASSWORD

curl -X POST -u "elastic:${ELASTICSEARCH_BOOTSTRAP_PASSWORD}" "elasticsearch:9200/_security/user/elastic/_password?pretty" \
  -H 'Content-Type: application/json' \
  -d "{ \"password\": \"${ELASTIC_PASSWORD}\"}"

curl -X POST -u "elastic:${ELASTIC_PASSWORD}" "elasticsearch:9200/_security/user/kibana/_password?pretty" \
  -H 'Content-Type: application/json' \
  -d "{ \"password\": \"${KIBANA_PASSWORD}\"}"
