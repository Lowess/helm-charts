# Monochart

A declarative helm chart for deploying common types of services on Kubernetes.

Forked from [Cloudposse / Monochart](https://github.com/cloudposse/charts/tree/master/incubator/monochart/)


# Upgrade Guide

## `0.30.0` -> `1.0.0`

### :warn: Breaking changes

*  `service` previously allowed the creation of a single service. It now allows multiple services creation similar to the structure of `ingress` or `configMaps` objects. This change was necessary introduce the support of [Rollout](https://argo-rollouts.readthedocs.io/en/stable/features/traffic-management/#how-does-argo-rollouts-enable-traffic-management) objects.

Before:

```diff
service:
-  enabled: true
-  type: ClusterIP
-  # ports:
-  #   name:
-  #     internal: 80
-  #     external: 80
-  # labels:
-  #   name: value
-  # annotations:
-  #   name: value
```

After

```diff
service:
+    default:
+      enabled: true
+      type: ClusterIP
+      # ports:
+      #   name:
+      #     internal: 80
+      #     external: 80
+      # labels:
+      #   name: value
+      # annotations:
+      #   name: value
```