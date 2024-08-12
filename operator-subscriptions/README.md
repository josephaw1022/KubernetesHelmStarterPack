# Operator Subscriptions Helm Chart


#### Overview

This Helm chart facilitates the deployment of Kubernetes operator subscriptions. Each subscription enables the corresponding operator CRDs (Custom Resource Definitions) within your cluster, allowing you to manage resources provided by these operators. It's important to note that enabling an operator through this chart does not deploy the actual services or applications associated with that operator. Instead, it prepares the cluster for their deployment and management.

#### Prerequisites

- Kubernetes 1.19+
- Helm 3.0+

#### Configuration

The `values.yaml` file contains configurable options for the chart, including the ability to enable or disable specific operators. Adjust this file as needed before deploying the chart.

#### Installing the Chart

To install the chart with the release name `operator-subscriptions` in the `operator-subscriptions` namespace, run the following command from the directory containing the chart:

```bash
helm install operator-subscriptions . --namespace operator-subscriptions --create-namespace -f values.yaml
```

#### Upgrading the Chart

To upgrade the chart and modify the enabled operators, use the `helm upgrade` command. For example, to enable specific operators such as `kubevirt`, `tekton`, `argocd`, `keda`, and `neuvector`, execute:

```bash
helm upgrade --install operator-subscriptions . \
  --namespace operator-subscriptions \
  --create-namespace \
  -f values.yaml \
  --set features.kubevirt=true,features.tekton=true,features.argocd=true,features.keda=true,features.neuvector=true
```

#### Values Configuration

Operators are enabled or disabled through the `features` key in `values.yaml`. Each operator key can be set to `true` (enabled) or `false` (disabled). Here’s an example snippet:

```yaml
features:
  argocd: false
  azure-service-operator: false
  cert-manager: false
  dapr: false
  elastic: false
  # Additional operators can be enabled or disabled as needed
```

#### Customizing the Chart

You can further customize the chart by editing the individual YAML files to adjust the configurations of each operator subscription if necessary.

#### Uninstalling the Chart

To uninstall/delete the `operator-subscriptions` deployment, use:

```bash
helm delete operator-subscriptions --namespace operator-subscriptions
```

This command removes all the Kubernetes components associated with the chart and deletes the release.

---

### Notes

- **Backup Configurations**: Before performing upgrades or uninstallations, ensure to back up your configurations.
- **Checking Releases**: Post-installation or upgrades, use `helm list -n operator-subscriptions` to verify the status of your release.

This README provides essential details for managing the chart and explains the role of enabling operators within your Kubernetes environment. It highlights that enabling an operator does not deploy the actual applications but prepares the cluster for managing those applications through the deployed CRDs. Adjust the content as needed to fit detailed configurations or specific operator requirements related to your environment.