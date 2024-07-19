#!/bin/bash

# Create Kubernetes cluster with kind
echo "Creating Kubernetes cluster with kind..."
kind create cluster --config=kind-config.yaml

# Install Operator Lifecycle Manager
echo "Installing Operator Lifecycle Manager..."
curl -sL https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.28.0/install.sh | bash -s v0.28.0

# Install or upgrade Helm chart for operator-subscriptions
echo "Installing or upgrading Helm chart for operator-subscriptions..."
helm upgrade operator-subscriptions operator-subscriptions --install --namespace operator-subscriptions --create-namespace

echo "All commands executed successfully!"
