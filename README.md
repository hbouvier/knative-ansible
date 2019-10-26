# knative-ansible
Ansible scripts to install KNative on Kubernetes (with Kafka)

## Eventing


## Requirements

- go-lang >= v1.13
- python3 with pip



## Cleaning generated helm templates for ansible k8s

```bash
cat helm-template.yaml | perl -pe 's/^#.*$//g' | perl -0pe 's/-{3}(?:-{3}|[\n\s]*)*-{3}/---/g' | perl -0pe 's/-{3}[\n\s]*$//g' > cleaned-template.yaml
```
