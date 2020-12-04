# Running Elastic stack in Raspberry Pi 4

## Helm installation

helm repo add elastic https://helm.elastic.co

helm install (product) elastic/(product) -n elastic -f ./helm/(archtype)/(product)/values.yml
