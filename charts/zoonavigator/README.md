# Zoonavigator - Web-based ZooKeeper UI and editor/browser with many features.

[Zoonavigator](https://github.com/elkozmon/zoonavigator) Web-based ZooKeeper UI and editor/browser with many features.

## TL;DR;

```console
# Add the Repository to Helm:

$ helm repo add lowess-helm https://lowess.github.io/helm-charts

# Install zoonavigator

$ helm install lowess-helm/zoonavigator
```

## Introduction

This chart bootstraps a [zoonavigator](https://github.com/elkozmon/zoonavigator) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.3+ with Beta APIs enabled

## Installing the Chart

To install the chart with the release name `my-release`:

```console

$ helm install --name my-release lowess-helm/zoonavigator
```

The command deploys zoonavigator on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the zoonavigator chart and their default values.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"elkozmon/zoonavigator"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"zoonavigator.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `9000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` |  |
| zoonavigator.env.AUTO_CONNECT_AUTH_INFO | string | `nil` |  |
| zoonavigator.env.AUTO_CONNECT_CONNECTION_STRING | string | `nil` |  |
| zoonavigator.env.HTTPS_PORT | string | `nil` |  |
| zoonavigator.env.HTTP_PORT | int | `9000` |  |
| zoonavigator.env.JAVA_JAAS_LOGIN_CONFIG | string | `nil` |  |
| zoonavigator.env.JAVA_KRB5_DEBUG | string | `nil` |  |
| zoonavigator.env.JAVA_KRB5_KDC | string | `nil` |  |
| zoonavigator.env.JAVA_KRB5_REALM | string | `nil` |  |
| zoonavigator.env.JAVA_OPTS | string | `nil` |  |
| zoonavigator.env.JAVA_XMS | string | `nil` |  |
| zoonavigator.env.JAVA_XMX | string | `nil` |  |
| zoonavigator.env.SECRET_KEY | string | `nil` |  |
| zoonavigator.env.SESSION_TIMEOUT_MILLIS | string | `nil` |  |
| zoonavigator.env.SSL_KEYSTORE_PASSWORD | string | `nil` |  |
| zoonavigator.env.SSL_KEYSTORE_PATH | string | `nil` |  |
| zoonavigator.env.SSL_KEYSTORE_TYPE | string | `nil` |  |
| zoonavigator.env.ZK_CLIENT_CNXN_SOCKET | string | `nil` |  |
| zoonavigator.env.ZK_CLIENT_SECURE | string | `nil` |  |
| zoonavigator.env.ZK_CLIENT_TIMEOUT_MILLIS | string | `nil` |  |
| zoonavigator.env.ZK_CONNECT_TIMEOUT_MILLIS | string | `nil` |  |
| zoonavigator.env.ZK_SASL_CLIENT | string | `nil` |  |
| zoonavigator.env.ZK_SASL_CLIENT_CONFIG | string | `nil` |  |
| zoonavigator.env.ZK_SASL_CLIENT_USERNAME | string | `nil` |  |
| zoonavigator.env.ZK_SERVER_REALM | string | `nil` |  |
| zoonavigator.env.ZK_SSL_KEYSTORE_PASSWORD | string | `nil` |  |
| zoonavigator.env.ZK_SSL_KEYSTORE_PATH | string | `nil` |  |
| zoonavigator.env.ZK_SSL_TRUSTSTORE_PASSWORD | string | `nil` |  |
| zoonavigator.env.ZK_SSL_TRUSTSTORE_PATH | string | `nil` |  |
| zoonavigator.podAnnotations | object | `{}` |  |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install lowess-helm/zoonavigator --name my-release \
    --set zoonavigator.env.zoonavigator_REPORTERS=prometheus
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install lowess-helm/zoonavigator --name my-release -f values.yaml
```

> **Tip**: You can use the default [values.yaml](values.yaml)
