#! /bin/bash

set -e

RESOURCE_GROUP=${1?need resource name}
ACR_NAME=${2?need ACR name}

echo "Creating Resouce"

az group create --name ${RESOURCE_GROUP} --location eastus
echo "Resource Created"

echo "Creating ACR"
az acr create --resource-group ${RESOURCE_GROUP} --name ${ACR_NAME} --sku Basic
echo "ACR created with Basic SKU"

echo "Logging in to ACR"
az acr login --name ${ACR_NAME}
echo "Logged in"



