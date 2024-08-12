#!/bin/bash

# Create Kubernetes cluster with kind
echo "Creating Kubernetes cluster with kind..."
kind create cluster --config=kind-config.yaml


echo "All commands executed successfully!"
