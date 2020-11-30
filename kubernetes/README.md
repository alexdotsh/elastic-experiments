# Helm installation

helm repo add elastic https://helm.elastic.co

helm install elasticsearch elastic/elasticsearch -n elastic -f ./helm/values.yml
