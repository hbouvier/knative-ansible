
# Docker for Desktop

```bash
cd ..
source .env/bin/activate
cd ansible

ansible-playbook main.yml -i environments/local --tags=helm
ansible-playbook main.yml -i environments/local --tags=istio
ansible-playbook main.yml -i environments/local --tags=knative --extra-vars='{"knative_domain":"knative.example.com"}'
ansible-playbook main.yml -i environments/local --tags=cert-manager --extra-vars='{"certmanager_email":"your.name@example.com"}'
```


    1  cd app
    2  ls
    3  pip install -r requirements.txt
    4  ansible --version
    5  pwd
    6  ls
    7  cd ansible.cfg 
    8  ansible-playbook main.yml -i environments/local --tags=helm
    9  ansible-playbook main.yml -i environments/local --tags=helm
   10  ansible-playbook main.yml -i environments/local --tags=helm -vvvvvv

   18  export KUBECONFIG=/app/.kube/config 

   11  apt-get update -y
   apt-get -y install vim
   
   12  curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.5/bin/linux/amd64/kubectl
   13  chmod +x ./kubectl
   14  mv ./kubectl /usr/local/bin/kubectl

   curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
   37  $ chmod 700 get_helm.sh
   38  chmod 700 get_helm.sh
   39  ./get_helm.sh 


 
   15  ansible-playbook main.yml -i environments/local --tags=helm -vvvvvv
   16  kubectl -h
   17  pwd
   19  kubectl get ns
   20  ansible-playbook main.yml -i environments/local --tags=helm -vvvvvv
   21  pip greeze
   22  pip freeze
   23  vi a.py
   24  apt-get -y install vim
   25  vi test.py
   26  python test.py
   27  ansible-playbook main.yml -i environments/local --tags=helm -vvvvvv
   28  which python
   29  history



































ansible-playbook main.yml -i environments/local --extra-vars='mode=clean'
ansible-playbook main.yml -i environments/local 


# Sur GCP
kubectl create clusterrolebinding cluster-admin-binding \
     --clusterrole=cluster-admin \
     --user=$(gcloud config get-value core/account)


# changements
DOMAIN=knative.acme.com
cm config-domain knative-serving
```
apiVersion: v1
kind: ConfigMap
metadata:
  name: config-domain
  namespace: knative-serving
data:
  ${DOMAIN}: ""
```


# Grafana

kubectl -n knative-monitoring port-forward service/grafana 8080:30802 > /dev/null 2>&1


# istio injection
#!/bin/sh
NAMESPACE=${1:-default}
kubectl label namespace ${NAMESPACE}  istio-injection=enabled



##

```bash
kubectl proxy >/dev/null 2>&1 &
open http://localhost:8001/api/v1/namespaces/knative-monitoring/services/kibana-logging/proxy/app/kibana
# echo "indice is zipkin:span-* not logstash-*"
open http://localhost:8001/api/v1/namespaces/istio-system/services/zipkin:9411/proxy/zipkin/
```

```bash
kubectl -n knative-monitoring port-forward svc/grafana 30802:30802
open http://localhost:30802
```