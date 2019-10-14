#!/bin/sh -e
CLUSTER_NAME=knative
CLUSTER_ZONE=us-east1-b
PROJECT=knative
# gcloud projects create $PROJECT --set-as-default
gcloud config set core/project $PROJECT
gcloud services enable \
     cloudapis.googleapis.com \
     container.googleapis.com \
     containerregistry.googleapis.com
gcloud beta container clusters create $CLUSTER_NAME \
  --addons=HorizontalPodAutoscaling,HttpLoadBalancing,Istio \
  --machine-type=n1-standard-4 \
  --cluster-version=latest --zone=$CLUSTER_ZONE \
  --enable-ip-alias \
  --enable-autoscaling --min-nodes=1 --max-nodes=8 \
  --enable-autorepair \
  --enable-autoupgrade \
  --num-nodes=1 \
  --preemptible \
  --scopes cloud-platform
#  --enable-network-policy \
gcloud beta container clusters update $CLUSTER_NAME] --logging-service none --monitoring-service none --zone $CLUSTER_ZONE
kubectl create clusterrolebinding cluster-admin-binding \
     --clusterrole=cluster-admin \
     --user=$(gcloud config get-value core/account)
sleep 60
kubectl apply --selector knative.dev/crd-install=true \




1765  curl -L https://github.com/knative/serving/releases/download/v0.9.0/serving.yaml   | sed 's/LoadBalancer/NodePort/' \
 1766  wget https://github.com/knative/serving/releases/download/v0.9.0/serving.yaml
 1767  wget https://github.com/knative/eventing/releases/download/v0.9.0/release.yaml
 1768  wget https://github.com/knative/serving/releases/download/v0.9.0/monitoring.yaml
 1769  clear ; ansible-playbook main.yml -i environments/local --tags knative


####
curl -v "http://default-broker.tutorial.svc.cluster.local/" -X POST -H "X-B3-Flags:1"  -H "ce-specversion:0.2" -H "ce-type: com.ruggedcode.chat.message.text" -H "ce-time:2018-04-05T03:56:24Z" -H "ce-id:45a8b444-3213-4758-be3f-54093f85ff" -H "ce-source: com.ruggedcode.chat.curl" -H 'Content-Type:application/json' -H 'ce-datacontenttype: application/json' -d '{"text":"voiture"}'
