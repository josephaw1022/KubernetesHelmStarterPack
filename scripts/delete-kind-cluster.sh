#!/bin/bash

# Delete Kubernetes cluster with kind
echo "Deleting Kubernetes cluster with kind..."
kind delete cluster

echo "Kind cluster deleted successfully!"
