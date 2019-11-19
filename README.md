# Prerequisite

* docker
* helm

To install docker please check below link:-
https://docs.docker.com/docker-for-mac/

To install helm follow below steps:-
https://helm.sh/docs/intro/install/


# Usage

1. Setup AZURE CLI if not already setup

   RUN ``` bash setup_azure_cli.sh ```

2. Create a Resouce Group and Azure Container Regisrty

   RUN ``` bash acr_create [Resource-Group-Name] [ACR-Name]```

To create an Azure Container Registry, you first need a resource group. An Azure resource group is a logical container into which Azure resources are deployed and managed.


3. Create AKS cluster

   RUN ``` bash create_aks_cluster.sh [CLUSTER_NAME] [RESOURCE_GROUP] [ACR_NAME]```

4. Push image to ACR

   RUN ``` bash docker_push_acr [FILE_PATH] [RESOURCE_GROUP] [ACR_NAME] [DOCKER_IMAGE_NAME] [TAG]```

in our case above mentioned values should be :-

```FILE_PATH=nodejs-app/, DOCKER_IMAGE_NAME=nodejs-app, TAG=v1```
