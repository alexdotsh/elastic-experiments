#!/bin/bash

kubectl create -f "${PWD}/elastic/kubernetes/manifests/*yml"

# Install ElasticSearch
helm install elasticsearch elastic/elasticsearch -n elastic -f "${PWD}/helm/aarch64/elasticsearch/values.yml"

sleep 30

# Install Logtash
helm install logstash elastic/logstash -n elastic -f "${PWD}/helm/aarch64/logstash/values.yml"

sleep 30

# Install Kibana
helm install kibana elastic/kibana -n elastic -f "${PWD}/helm/x86-64/kibana/values.yml"

helm install apm-server elastic/apm-server -n elastic -f "${PWD}/helm/x86-64/apm-server/values.yml"
