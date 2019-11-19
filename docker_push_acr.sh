#! /bin/bash

set -e

FILE_PATH=${1?need doker file path}
RESOURCE_GROUP=${2?need resource name}
ACR_NAME=${3?need ACR name}
DOCKER_IMAGE_NAME=${4?need docker image name}
TAG=${5?need image tag}


echo "Creating docket image....."
docker build -f ${FILE_PATH}
echo "Image created\n"

echo "Pushing docker Image to ACR ....."
docker tag ${DOCKER_IMAGE_NAME} ${ACR_NAME}.azurecr.io/${DOCKER_IMAGE_NAME}:${TAG}
docker push ${DOCKER_IMAGE_NAME} ${ACR_NAME}.azurecr.io/${DOCKER_IMAGE_NAME}:${TAG}
echo "Image pushed to ACR"
az acr repository list --name ${ACR_NAME} --output table