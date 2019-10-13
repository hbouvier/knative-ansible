mkdir kafka
 cd kafka
 wget https://github.com/strimzi/strimzi-kafka-operator/releases/download/0.13.0/strimzi-cluster-operator-0.13.0.yaml
 cat strimzi-cluster-operator-0.13.0.yaml | sed 's/namespace: .*/namespace: kafka/' > kafka-cluster-operator.yaml
 wget https://raw.githubusercontent.com/strimzi/strimzi-kafka-operator/0.13.0/examples/kafka/kafka-persistent-single.yaml
 cat kafka-persistent-single.yaml | sed 's/100Gi/16Gi/g' > kafka-standalone.yaml
 k create namespace kafka
 kubectl apply -f kafka-cluster-operator.yaml -n kafka
 kubectl apply -f kafka-standalone.yaml -n kafka

kubectl wait kafka/my-cluster --for=condition=Ready --timeout=300s -n kafka 


-----
k edit cm -n knative-eventing config-kafka
bootstrapServers: standalone-kafka-bootstrap.kafka.svc.cluster.local:9092



###
k edit cm default-ch-webhook -n knative-eventing
-----
apiVersion: v1
kind: ConfigMap
metadata:
  name: default-ch-webhook
  namespace: knative-eventing
data:
  default-ch-config: |
    clusterDefault:
      apiVersion: messaging.knative.dev/v1alpha1
      kind: InMemoryChannel
    namespaceDefaults:
      henri:
        apiVersion: messaging.knative.dev/v1alpha1
        kind: KafkaChannel
        spec:
                numpartitions: 2
                replicationFactor: 1
                