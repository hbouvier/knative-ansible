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


## Zookeeper

```bash
ansible-playbook main.yml -i environments/local/ --tag zookeeper --extra-vars='{"mode":"apply","zookeeper_namespace":"zookeeper"}'
kubectl run terminal --rm --image=bitnami/zookeeper:3.5.6-debian-9-r0 --restart=Never --tty -i --generator=run-pod/v1 -- /opt/bitnami/zookeeper/bin/zkCli.sh -server zookeeper.zookeeper:2181
	# ls /
	# create something
	# ls /
	# set something 'nothing'
	# get something
	# ^D
ansible-playbook main.yml -i environments/local/ --tag zookeeper --extra-vars='{"mode":"clean","zookeeper_namespace":"zookeeper"}'
```