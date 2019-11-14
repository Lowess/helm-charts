# Burrow - Kafka Consumer Lag Checking

[Burrow](https://github.com/linkedin/Burrow), is a monitoring companion for [Apache Kafka](http://kafka.apache.org) that provides consumer lag checking as a service without the need for specifying thresholds. It monitors committed offsets for all consumers and calculates the status of those consumers on demand. An HTTP endpoint is provided to request status on demand, as well as provide other Kafka cluster information. There are also configurable notifiers that can send status out via email or HTTP calls to another service.

## TL;DR;

```console
# Add the Repository to Helm:

$ helm repo add lowess-helm https://github.com/Lowess/helm-charts.git

# Install burrow

$ helm install lowess-helm/burrow
```

