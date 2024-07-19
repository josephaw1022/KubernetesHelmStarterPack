# Instructions

## Prerequisites

- Have Docker Desktop, Rancher Desktop, or Podman Desktop installed
- Have Helm and kubectl installed
- Have k9s installed
- Have kind installed

## Steps

1. Make the `k8s` script executable:

   ```bash
   chmod +x k8s
   ```

2. To start the kind cluster, install OLM, and deploy the operator subscriptions, run:

   ```bash
   ./k8s up
   ```

   After running this command, `kubectl` should automatically switch its context to the kind cluster. You can verify that everything is working by running:

   ```bash
   kubectl get nodes
   ```

3. To tear down the kind cluster, run:

   ```bash
   ./k8s down
   ```

4. Run k9s to manage and view your Kubernetes cluster:

   ```bash
   k9s
   ```

## Operator Subscriptions Helm Chart

The Operator Subscriptions Helm chart contains a collection of subscription YAML files. Each file subscribes to a specific operator from the OperatorHub, enabling the deployment of various operators into your Kubernetes cluster. Here is an example of a subscription YAML file:

```yaml
---
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: my-postgresql
  namespace: operators
spec:
  channel: v5
  name: postgresql
  source: operatorhubio-catalog
  sourceNamespace: olm
```

With the PostgreSQL subscription, for example, you are now able to use Custom Resource Definitions (CRDs) provided by the PostgreSQL operator in other Helm charts or Kubernetes manifests. This enables you to manage PostgreSQL clusters and related resources declaratively. Here are some examples of CRDs that can be used:


#### PostgresCluster

```yaml
apiVersion: postgres-operator.crunchydata.com/v1beta1
kind: PostgresCluster
metadata:
  name: example
spec:
  backups:
    pgbackrest:
      repos:
        - name: repo1
          volume:
            volumeClaimSpec:
              accessModes:
                - ReadWriteOnce
              resources:
                requests:
                  storage: 1Gi
  instances:
    - dataVolumeClaimSpec:
        accessModes:
          - ReadWriteOnce
        resources:
          requests:
            storage: 1Gi
      replicas: 1
  postgresVersion: 15
```

#### PGAdmin

```yaml
apiVersion: postgres-operator.crunchydata.com/v1beta1
kind: PGAdmin
metadata:
  name: example-pgadmin
  namespace: openshift-operators
spec:
  dataVolumeClaimSpec:
    accessModes:
      - ReadWriteOnce
    resources:
      requests:
        storage: 1Gi
  serverGroups:
    - name: Crunchy Postgres for Kubernetes
      postgresClusterSelector: {}
```

#### PGUpgrade

```yaml
apiVersion: postgres-operator.crunchydata.com/v1beta1
kind: PGUpgrade
metadata:
  name: example-upgrade
spec:
  fromPostgresVersion: 15
  postgresClusterName: example
  toPostgresVersion: 16
```

### Files in the Templates Directory

The `templates` directory of the Helm chart includes subscription files for various operators. Here are some examples:

- **PostgreSQL**: Enables the use of CRDs for managing PostgreSQL clusters and related resources.
- **Prometheus**: Provides CRDs for setting up and managing Prometheus for monitoring and alerting.
- **Grafana**: Includes CRDs for deploying and managing Grafana dashboards.
- **Cert-Manager**: Provides CRDs for managing SSL/TLS certificates within your Kubernetes cluster.

### Purpose

This Helm chart is designed to provide an opinionated platform for development and application engineers working on projects using Kubernetes. It streamlines the process of deploying and managing essential operators within your Kubernetes cluster, enabling developers to focus more on building applications and less on managing infrastructure.
