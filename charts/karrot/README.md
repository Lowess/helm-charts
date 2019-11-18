# Karrot - A Kafka lag reporter processing events from Burrow

[Karrot](https://github.com/Lowess/karrot) is Flask Webapp that acts as a lag reporting tool able to parse [Burrow](https://github.com/linkedin/Burrow) (a monitoring companion for [Apache Kafka](http://kafka.apache.org)) http notifications. It offers [AWS CloudWatch](https://aws.amazon.com/cloudwatch/) lag reporting as well as a [Prometheus](https://prometheus.io/) metrics exporter.

## TL;DR;

```console
# Add the Repository to Helm:

$ helm repo add lowess-helm https://lowess.github.io/helm-charts

# Install burrow

$ helm install lowess-helm/karrot
```

## Introduction

This chart bootstraps a [Karrot](https://github.com/Lowess/karrot) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.3+ with Beta APIs enabled

## Installing the Chart

To install the chart with the release name `my-release`:

```console

$ helm install --name my-release lowess-helm/karrot
```

The command deploys Karrot on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Karrot chart and their default values.

Parameter | Description | Default
--------- | ----------- | -------
`karrot.env.AWS_DEFAULT_REGION` | AWS Region in which Karrot should be reporting the lag | `us-east-1`
`karrot.env.KARROT_REPORTERS` | A CSV list of reporters to use in Karrot. Choices are `prometheus`, `cloudwatch` | `prometheus,cloudwatch`
`karrot.env.KARROT_CLOUDWATCH_NAMESPACE` | The Cloudwatch namespace prefix to use for lag reporting | `GumGum/Kafka/Burrow/ConsumerLag`
`karrot.env.KARROT_CLOUDWATCH_INTERVAL` | The Cloudwatch flush interval to execute the put_metric_data api call | `30`
`burrow.enabled` | Create a Burrow instance | `false`
`burrow.burrow.config` | Please refer to [Burrow configuration](https://github.com/Lowess/helm-charts/tree/master/charts/burrow#configuration) | `{}`

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install lowess-helm/karrot --name my-release \
    --set karrot.env.KARROT_REPORTERS=prometheus
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install lowess-helm/karrot --name my-release -f values.yaml
```

> **Tip**: You can use the default [values.yaml](values.yaml)
