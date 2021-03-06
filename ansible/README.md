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