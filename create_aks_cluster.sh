#! /bin/bash

set -e

CLUSTER_NAME=${1?need cluster name}
RESOURCE_GROUP=${2?need resource name}
ACR_NAME=${3?need ACR name}

echo "Creating AKS ....."
az aks create \
    --resource-group ${RESOURCE_GROUP} \
    --name ${CLUSTER_NAME} \
    --node-count 3 \
    --generate-ssh-keys \
    --attach-acr ${ACR_NAME} \
    --api-server-authorized-ip-ranges 0.0.0.0/32 \
    --enable-cluster-autoscaler \
    --max-count 30 \
    --pod-cidr 10.20.0.0/14 \
    --service-cidr 10.30.0.0/26 \
    --nodepool-name default-pool

echo "AKS created"

echo "Installing Kubernetes CLI"
az aks install-cli
echo "Kubernetes CLI installed"

echo "Logging in to AKS"
az aks get-credentials --resource-group ${RESOURCE_GROUP} --name ${CLUSTER_NAME}
echo "Logged In"

kubectl get nodes