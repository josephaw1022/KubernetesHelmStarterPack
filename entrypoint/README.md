# OLM and Application Management Helm Chart

This Helm chart automates the deployment of Operator Lifecycle Manager (OLM) and key applications like ArgoCD and TektonCD within a Kubernetes cluster. It includes setup, management, and clean-up processes.

## Quickstart

**Prerequisites:** Kubernetes 1.16+, Helm 3.0+

**Install the chart with:**

```bash
 helm upgrade entrypoint . --namespace entrypoint --create-namespace --wait --install
```
