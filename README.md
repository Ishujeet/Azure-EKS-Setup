# Azure-EKS-Setup

Basic Azure **EKS**, **Resource Group** and **ACR** setup with **terraform** and app delpoyment on it with **helm Charts**.

# Prerequisite

* docker
* helm

To install docker please check this link:-
https://docs.docker.com/docker-for-mac/

To install helm follow this link:-
https://helm.sh/docs/intro/install/


# Usage

1. Setup AZURE CLI if not already setup

   RUN ``` bash setup_azure_cli.sh ```

2. Create a Resouce Group and Azure Container Regisrty

   RUN ``` bash acr_create [Resource-Group-Name] [ACR-Name]```

    To create an Azure Container Registry, you first need a resource group. An Azure resource group is a logical container         into which Azure resources are deployed and managed.


3. Create AKS cluster

   RUN ``` bash create_aks_cluster.sh [CLUSTER_NAME] [RESOURCE_GROUP] [ACR_NAME]```

4. Push image to ACR

   RUN ``` bash docker_push_acr [FILE_PATH] [RESOURCE_GROUP] [ACR_NAME] [DOCKER_IMAGE_NAME] [TAG]```

   in our case above mentioned values should be :-

   ```FILE_PATH=nodejs-app/, DOCKER_IMAGE_NAME=nodejs-app, TAG=v1```
   
   We can automate the build process using jenkins, a sample jenkinsfile is provided in repositroy, it can be modified            according to needs.

5. To deploy node app in AKS specify the following values in https://github.com/Ishujeet/Azure-Test/blob/master/helm/nodejs-app/values.yaml
   * image_name = ${ACR_NAME}.azurecr.io/${DOCKER_IMAGE_NAME}
   * image_tag = ${TAG}

6. Run ```helm install nodejs-app helm/nodejs-app```. Your app will be up and running in few min, check for ```kubectl get svc    --watch``` to get External IP of APP.

7. APP is autoscalable as Horizontal Pod Autoscaler is also defined in helm chart.
